-- Disable unused language providers to speed up startup time
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Load core settings
require("config.options")
require("config.keymaps")
