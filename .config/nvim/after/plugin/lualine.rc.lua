local status, lualine = pcall(require, "lualine")
if (not status) then return end

-- Add this custom component for Windsurf status
local function get_windsurf_status()
  local ok, windsurf_status = pcall(vim.api.nvim_call_function, "codeium#GetStatusString", {})
  if ok and windsurf_status then
    return windsurf_status
  end
  return ""
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    disabled_filetypes = {}
    -- section_separators = { left = '', right = '' },
    -- component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      { 'filename', file_status = true, path = 1 },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { "nvim_diagnostic" },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding', 'filetype'
    },
    lualine_y = { 'lsp_progress', { get_windsurf_status } },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      { 'filename', file_status = true, path = 1 }
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
