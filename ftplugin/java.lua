local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/nankiewi/Projects/workspace/' .. project_name
local config = {
  cmd = { '/home/nankiewi/.local/share/nvim/mason/bin/jdtls', '-data', workspace_dir },
  root_dir = vim.fs.dirname(vim.fs.find({ 'pom.xml' }, { upward = true })[1]),
  settings = {
    java = {
      references = {
        includeDecompiledSources = true,
      },
      -- format = {
      --   enabled = true,
      --   settings = {
      --     url = vim.fn.stdpath 'config' .. '/lang_servers/intellij-java-google-style.xml',
      --     profile = 'GoogleStyle',
      --   },
      -- },
      eclipse = {
        downloadSources = true,
      },
      maven = {
        downloadSources = true,
      },
      signatureHelp = { enabled = true },
      contentProvider = { preferred = 'fernflower' },
      -- eclipse = {
      -- 	downloadSources = true,
      -- },
      -- implementationsCodeLens = {
      -- 	enabled = true,
      -- },
      -- completion = {
      --   favoriteStaticMembers = {
      --     "org.hamcrest.MatcherAssert.assertThat",
      --     "org.hamcrest.Matchers.*",
      --     "org.hamcrest.CoreMatchers.*",
      --     "org.junit.jupiter.api.Assertions.*",
      --     "java.util.Objects.requireNonNull",
      --     "java.util.Objects.requireNonNullElse",
      --     "org.mockito.Mockito.*",
      --   },
      --   filteredTypes = {
      --     "com.sun.*",
      --     "io.micrometer.shaded.*",
      --     "java.awt.*",
      --     "jdk.*",
      --     "sun.*",
      --   },
      --   importOrder = {
      --     "java",
      --     "javax",
      --     "com",
      --     "org",
      --   },
      -- },
      -- sources = {
      --   organizeImports = {
      --     starThreshold = 9999,
      --     staticStarThreshold = 9999,
      --   },
      -- },
      -- codeGeneration = {
      --   toString = {
      --     template = '${object.className}{${member.name()}=${member.value}, ${otherMembers}}',
      --     flags = {
      --       allow_incremental_sync = true,
      --     },
      --   },
      --   useBlocks = true,
      -- },
      -- configuration = {
      --     runtimes = {
      --         {
      --             name = "java-17-openjdk",
      --             path = "/usr/lib/jvm/default-runtime/bin/java"
      --         }
      --     }
      -- }
      -- project = {
      -- 	referencedLibraries = {
      -- 		"**/lib/*.jar",
      -- 	},
      -- },
    },
  },
}
require('jdtls').start_or_attach(config)
