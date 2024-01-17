local WORDS = {}
local M = {}

function M.change()
  local current_word = vim.fn.expand("<cword>")
  local next_word = WORDS[current_word]
  if next_word then
    vim.api.nvim_set_current_line(
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.fn.substitute(
        vim.api.nvim_get_current_line(),
        current_word,
        next_word,
        ""
      )
    )
  end
end

---@class AntonymOptions
---@field only_antonym? boolean
---@field words table<string, string> | table<number, string[]>
---@param opts AntonymOptions
function M.setup(opts)
  if not opts or not opts.words then
    vim.notify("No words mapping", vim.log.levels.ERROR, { title = "Antonym" })
    return
  end
  if opts.only_antonym then
    WORDS = opts.words
    for raw_word, antonym in pairs(opts.words) do
      WORDS[antonym] = raw_word
    end
    goto create_user_command
  end
  for _, words in ipairs(opts.words) do
    for idx, word in ipairs(words) do
      if words[idx + 1] then
        WORDS[word] = words[idx + 1]
      else
        WORDS[word] = words[1]
      end
    end
  end
  ::create_user_command::
  vim.api.nvim_create_user_command("Antonym", M.change, {})
end

return M
