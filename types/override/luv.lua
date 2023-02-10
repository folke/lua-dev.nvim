---@class vim.loop
vim.loop = {}

---@class vim.loop.Timer
---@field start fun(timer: vim.loop.Timer, timeout: integer, repeat: integer, callback: fun())
---@field stop fun(timer: vim.loop.Timer)

---@class vim.loop.Handle
---@field close fun(handle: vim.loop.Handle)
---@field is_closing fun(handle: vim.loop.Handle): boolean
---@field is_active fun(handle: vim.loop.Handle): boolean

---@class vim.loop.Stream: vim.loop.Handle
---@field shutdown fun(stream: vim.loop.Stream, callback?: fun()): boolean
---@field read_start fun(stream: vim.loop.Stream, callback? fun(err: string?, chunk: string): 0|'fail'
---@field read_stop fun(stream: vim.loop.Stream): 0|'fail'
---@field write fun(stream: vim.loop.Stream, data: string, callback?: function)
---@field try_write fun(stream: vim.loop.Stream, data: string)

---@class vim.loop.Pipe: vim.loop.Stream

---@class vim.loop.Prepare: vim.loop.Handle
---@field start fun(prepare: vim.loop.Prepare, callback: function): 0|'fail'
---@field stop fun(prepare: vim.loop.Prepare): 0|'fail'

---@class vim.loop.Check: vim.loop.Handle
---@field start fun(check: vim.loop.Check, callback: function): 0|'fail'
---@field stop fun(check: vim.loop.Check): 0|'fail'

---@class vim.loop.Process: vim.loop.Handle
---@field kill fun(process: vim.loop.Process, signum: integer|string): 0|'fail'
---@field get_pid fun(process: vim.loop.Process): integer

---@class vim.loop.TCP: vim.loop.Stream
---@field connect fun(tcp: vim.loop.TCP, host: string, port: integer, callback?: fun(err?: string))

return {
  ["vim.loop.new_timer"] = {
    ["return"] = { {
      ["type"] = "vim.loop.Timer",
    } },
  },
  ["vim.loop.new_pipe"] = {
    ["return"] = { {
      ["type"] = "vim.loop.Pipe",
    } },
  },
  ["vim.loop.new_prepare"] = {
    ["return"] = { {
      ["type"] = "vim.loop.Prepare",
    } },
  },
  ["vim.loop.new_check"] = {
    ["return"] = { {
      ["type"] = "vim.loop.Check",
    } },
  },
  ["vim.loop.new_tcp"] = {
    ["return"] = { {
      ["type"] = "vim.loop.TCP",
    } },
  },
  ["vim.loop.spawn"] = {
    ["return"] = { {
      ["type"] = "vim.loop.Process",
    } },
  },
}
