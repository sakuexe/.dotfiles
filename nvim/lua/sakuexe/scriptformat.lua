-- format using the project's `format` package script (npm/bun/pnpm/yarn)
-- falls back to lsp formatting when no script is found
local M = {}

-- walk all the way up, so monorepo roots are found past workspace packages
local function find_format_script(bufnr)
  local start = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
  for _, pkg in ipairs(vim.fs.find("package.json", { path = start, upward = true, limit = math.huge })) do
    local ok, json = pcall(vim.json.decode, table.concat(vim.fn.readfile(pkg), "\n"))
    if ok and type(json.scripts) == "table" and json.scripts.format then
      return vim.fs.dirname(pkg)
    end
  end
end

local function runner(dir)
  -- lockfile may live at the workspace root, not next to the package.json
  local lock = vim.fs.find({ "bun.lock", "bun.lockb", "pnpm-lock.yaml", "yarn.lock" }, { path = dir, upward = true })[1]
  local name = lock and vim.fs.basename(lock) or ""
  if name:match("^bun") then return "bun" end
  if name == "pnpm-lock.yaml" then return "pnpm" end
  if name == "yarn.lock" then return "yarn" end
  return "npm"
end

function M.format(bufnr)
  bufnr = (bufnr and bufnr ~= 0) and bufnr or vim.api.nvim_get_current_buf()
  local dir = find_format_script(bufnr)
  if not dir then
    return vim.lsp.buf.format({ async = true })
  end

  -- the script works on files on disk, so write first
  vim.api.nvim_buf_call(bufnr, function() vim.cmd("silent update") end)

  local cmd = { runner(dir), "run", "format" }
  vim.system(cmd, { cwd = dir, text = true }, function(res)
    vim.schedule(function()
      if res.code ~= 0 then
        vim.notify(table.concat(cmd, " ") .. " failed:\n" .. (res.stderr or ""), vim.log.levels.ERROR)
        return
      end
      -- reload every buffer the script changed on disk
      vim.cmd("checktime")
    end)
  end)
end

function M.attach()
  vim.keymap.set("n", "<M-f>", function() M.format() end, { buffer = true, desc = "Format via package script" })
end

return M
