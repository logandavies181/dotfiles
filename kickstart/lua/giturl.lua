local function printUrl()
  local res = vim.system({"git", "remote", "get-url", "origin"}, { text = true }):wait()
  if res.code ~= 0 then
    print("No remote found")
    return
  end

  local currentFilePath = vim.api.nvim_buf_get_name(0)
  if currentFilePath:len() == 0 then
    print("Not a file")
    return
  end

  local remoteUrl = vim.trim(res.stdout)
  local repoUrl = remoteUrl:sub(0, remoteUrl:len()-4)

  if remoteUrl:sub(0, 4) == "git@" then
    repoUrl = "https://" .. repoUrl:sub(5)
  end
  local prefixLen = vim.fs.root(0, ".git"):len()
end

vim.api.nvim_create_user_command(
  'GetFileUrl',
  function()
    printUrl()
  end,
  {}
)
