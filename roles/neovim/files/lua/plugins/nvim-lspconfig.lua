local util = require("lspconfig.util")

-- Check if pyproject.toml at `root` contains a [tool.<section>] entry.
local function has_pyproject_section(root, section)
  local f = io.open(root .. "/pyproject.toml")
  if not f then
    return false
  end
  local content = f:read("*a")
  f:close()
  return content:find("%[tool%." .. section .. "[.%]]") ~= nil
end

-- Return a root_dir function that only activates the server when the project
-- has a standalone config file or a matching [tool.*] section in pyproject.toml.
-- Returning nil prevents the server from starting.
local function typechecker_root(config_file, pyproject_section)
  return function(fname)
    local root = util.root_pattern(config_file)(fname)
    if root then
      return root
    end
    root = util.root_pattern("pyproject.toml")(fname)
    if root and has_pyproject_section(root, pyproject_section) then
      return root
    end
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        -- Show the tool name next to diagnistics
        virtual_text = { source = true },
        float = { source = true },
      },
      inlay_hints = { enabled = false },
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                -- pycodestyle is noisy
                pycodestyle = { enabled = false },
              },
            },
          },
        },
        -- Only start typecheckers when the project is configured for them
        pyright = { root_dir = typechecker_root("pyrightconfig.json", "pyright") },
        basedpyright = { root_dir = typechecker_root("pyrightconfig.json", "basedpyright") },
        ty = { root_dir = typechecker_root("ty.toml", "ty") },
      },
    },
  },
}
