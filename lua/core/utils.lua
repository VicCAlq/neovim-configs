local M = {}

function M.fun(t)
  local f = t[1]
  local args = { unpack(t, 2) }
  return function()
    return f(unpack(args))
  end
end

function M.fn(f, ...)
  local args = { ... }
  return function(...)
    return f(unpack(args), ...)
  end
end

function M.conditional_func(func, condition, ...)
  -- if the condition is true or no condition is provided, evaluate the function with the rest of the parameters and return the result
  if condition and type(func) == "function" then
    return func(...)
  end
end

function M.bool2str(bool)
  return bool and "on" or "off"
end

function M.escape(str)
  return str:gsub("%%", "%%%%")
end

--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function M.is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

--- Merge extended options with a default table of options
---@param default? table The default table that you want to merge into
---@param opts? table The new options that should be merged with the default table
---@return table # The merged table
function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

--- Serve a notification with a title of NeoVim
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function()
    vim.notify(msg, type, M.extend_tbl({ title = "NeoVim" }, opts))
  end)
end

--- Updates a highlight group with the new options
---@param group string The name of the lighlight group (see :h group-name)
---@param tbl table A table containing the new properties you want to apply
---@return nil
local function update_hl(group, tbl)
  local old_hl = vim.api.nvim_get_hl(0, { name = group })
  local new_hl = vim.tbl_extend("force", old_hl, tbl)
  vim.api.nvim_set_hl(0, group, new_hl)
end

--- Updates the highlight groups lists present inside the function
---@return nil
function M.set_new_hl()
  local to_bold_italic = { "Function", "Boolean" }
  local to_bold = { "Constant", "Label", "Exception" }
  local to_italic = { "Keyword", "Conditional", "Comment" }

  for _, v in ipairs(to_italic) do
    update_hl(v, { italic = true, force = true, fg = vim.api.nvim_get_hl(0, { name = v }).fg })
  end
  for _, v in ipairs(to_bold) do
    update_hl(v, { bold = true, force = true, fg = vim.api.nvim_get_hl(0, { name = v }).fg })
  end
  for _, v in ipairs(to_bold_italic) do
    update_hl(v, { italic = true, bold = true, force = true, fg = vim.api.nvim_get_hl(0, { name = v }).fg })
  end
end

return M
