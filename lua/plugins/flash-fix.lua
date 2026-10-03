return {
  {
    "folke/flash.nvim",
    init = function()
      local function patch_flash_searchstate()
        local ok, Hacks = pcall(require, "flash.hacks")
        if not ok then
          return
        end
        local ffi = require("ffi")

        -- If the old standalone symbol is still resolvable, do nothing
        if pcall(function()
          return ffi.C.search_match_lines
        end) then
          return
        end

        -- Define the new SearchState struct for Neovim Nightly
        pcall(
          ffi.cdef,
          [[
              typedef struct {
                  bool hl_match;
                  int32_t match_lines;
                  int match_endcol;
                  int32_t first_line;
                  int32_t last_line;
                  bool no_smartcase;
                  int cmdlen;
                  bool no_hlsearch;
              } SearchState;
              SearchState Search;
          ]]
        )

        -- If the new struct isn't resolvable either, abort the patch
        if not pcall(function()
          return ffi.C.Search.match_lines
        end) then
          return
        end

        local C = ffi.C
        local Pos = require("flash.search.pos")

        -- Override the failing function
        function Hacks.get_end_pos(from)
          local ret = Pos({
            from[1] + C.Search.match_lines,
            math.max(0, C.Search.match_endcol - 1),
          })
          local line = vim.api.nvim_buf_get_lines(0, ret[1] - 1, ret[1], false)[1] or ""
          ret[2] = math.min(ret[2], #line)
          return ret
        end
      end

      -- Apply the patch right after flash.nvim loads
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyLoad",
        callback = function(args)
          if args.data == "flash.nvim" then
            patch_flash_searchstate()
          end
        end,
      })
    end,
  },
}
