-- lock screen
hs.hotkey.bind({"cmd", "shift"}, "O", function()
  hs.caffeinate.lockScreen()
end)
