return {
  {
    "snacks.nvim",
    opts = {
      dashboard = {
        width = 40,
        sections = function()
          local header = [[


  ███    ███  █████  ██   ██ ██ ███    ███  █████  
  ████  ████ ██   ██  ██ ██  ██ ████  ████ ██   ██ 
  ██ ████ ██ ███████   ███   ██ ██ ████ ██ ███████ 
  ██  ██  ██ ██   ██  ██ ██  ██ ██  ██  ██ ██   ██ 
  ██      ██ ██   ██ ██   ██ ██ ██      ██ ██   ██ 
          ]]
          local function greeting()
            local hour = tonumber(vim.fn.strftime("%H"))
            -- [02:00, 10:00) - morning, [10:00, 18:00) - day, [18:00, 02:00) - evening
            local part_id = math.floor((hour + 6) / 8) + 1
            local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
            local username = "Maxima"
            return ("Good %s, %s"):format(day_part, username)
          end
          -- stylua: ignore
          return {
            { padding = 0, text = { header, hl = "header" } },
            { align = "center", desc = greeting(), padding = 2 },
            { title = "Builtin Actions", indent = 2, padding = 1,
              { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "n", desc = "New File",        action = ":ene | startinsert" },
              { icon = " ", key = "s", desc = "Restore Session", section = "session" },
              { icon = " ", key = "q", desc = "Quit",            action = ":qa" } },
            { title = "Recent Projects", section = "projects", indent = 2, padding = 1 },
            { title = "Maintenance Actions", indent = 2, padding = 2,
              { icon = "󰒲 ", key = "l", desc = "Lazy",        action = ":Lazy" },
              { icon = "󱁤 ", key = "m", desc = "Mason",       action = ":Mason" },                          },
            { section = "startup" },
          }
        end,
      },
    },
  },
}
