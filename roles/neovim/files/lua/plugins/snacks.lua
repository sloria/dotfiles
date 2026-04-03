return {
  "folke/snacks.nvim",
  opts = {
    -- disable dashboard
    dashboard = {
      enabled = false,
    },
    -- disable animated scroll
    scroll = {
      enabled = false,
    },
    picker = {
      sources = {
        files = {
          -- Include ignored and hidden files in the file picker, except for some junk files
          ignored = true,
          hidden = true,
          exclude = {
            ".git",
            ".DS_Store",
            ".tox",
            "*.egg-info",
            "*.pyc",
            "__pycache__",
            "pip-wheel-metadata",
            ".pytest_cache",
            ".mypy_cache",
            ".ruff_cache",
            ".venv",
            ".astro",
            ".husky",
            "node_modules",
            "target",
            "dist",
          },
        },
        explorer = {
          -- Simlarly, include ignored and hidden files in the file browser
          hidden = true,
          ignored = true,
          exclude = {
            ".git",
            ".svn",
            ".hg",
            "CVS",
            ".DS_Store",
            ".tox",
            "*.egg-info",
            "*.pyc",
            "__pycache__",
            "pip-wheel-metadata",
            ".pytest_cache",
            ".mypy_cache",
            ".ruff_cache",
            ".venv",
          },
        },
      },
    },
    -- let <C-j>/<C-k> pass through to terminal apps (e.g. Claude Code)
    terminal = {
      win = {
        keys = {
          nav_j = false,
          nav_k = false,
          nav_l = false,
        },
      },
    },
  },
}
