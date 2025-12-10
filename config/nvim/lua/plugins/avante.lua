local config = require("avante")

config.setup({
  provider = "claude",
  auto_suggestions_provider = "claude",
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20241022",
    timeout = 30000,
    temperature = 0,
    max_tokens = 4096,
  },
  behavior = {
    auto_suggestions = false
  },
  sugestion = {
    debounce = 1000,
    throttle = 1000,
  }
})

require("img-clip").setup({
  default = {
    embed_image_as_base64 = false,
    prompt_for_file_name = false,
    drag_and_drop = {
      insert_mode = true,
    },
    use_absolute_path = true,
  },
})
