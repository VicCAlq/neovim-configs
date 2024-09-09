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

--- Serve a notification with a title of NeoVim
---@param msg string The notification body
---@param type? number The type of the notification (:help vim.log.levels)
---@param opts? table The nvim-notify options to use (:help notify-options)
function M.notify(msg, type, opts)
  vim.schedule(function()
    vim.notify(msg, type, M.extend_tbl({ title = "NeoVim" }, opts))
  end)
end

return M
