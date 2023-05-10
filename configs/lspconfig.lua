local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

-- Go
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- Markdown
lspconfig.marksman.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"marksman", "server"},
  filetypes = {"markdown"},
  root_dir = util.root_pattern(".git", ".marksman.toml"),
}

-- Terraform 
lspconfig.terraformls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"terraform-ls", "serve"},
  filetypes = {"terraform", "terraform-vars"},
  root_dir = util.root_pattern(".terraform", ".git"),
}

-- Python
lspconfig.jedi_language_server.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"jedi-language-server"},
  filetypes = {"python"},
}

-- Yaml
lspconfig.yamlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"yaml-language-server", "--stdio"},
  filetypes = {"yaml", "yaml.docker-compose"},
}
-- local servers = {"html", "cssls", "gopls", "marksman"}
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities
--   }
-- end
--
-- lspconfig.terraformls.setup{}
-- lspconfig.jedi_language_server.setup{}
