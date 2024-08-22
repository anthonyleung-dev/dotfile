set processExists to false
tell application "System Events"
    set processList to name of every process
    if processList contains "Notion Calendar" then
        set processExists to true
    end if
end tell
if processExists then
  tell application "System Events"
    tell process "Notion Calendar"
      -- Get the second menu bar
      set theSecondMenuBar to menu bar 2
      -- Get all menu bar items in the second menu bar
      set menuBarItems to menu bar items of theSecondMenuBar
      -- Collect the titles or values of each menu bar item
      set menuBarItemTitles to {}
      repeat with itemIndex from 1 to count of menuBarItems
        set menuBarItemTitle to value of attribute "AXTitle" of item itemIndex of menuBarItems
        set end of menuBarItemTitles to menuBarItemTitle
      end repeat
    end tell
  end tell
  return menuBarItemTitles as string
else
  return "Open Notion Calendar to see upcoming events"
end if
