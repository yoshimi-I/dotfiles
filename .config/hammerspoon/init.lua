------------------------------------------------------
-- Ctrl + Uで左のウィンドウに移動 --
-- Ctrl + Iで右のウィンドウに移動 --
-- Ctrl + enterで隣のモニターに移動 --
-- Ctrl + Oで現在のカーソル位置をクリックする --
------------------------------------------------------
function moveMouseToNextScreen()
  local currentScreen = hs.mouse.getCurrentScreen()
  local screens = hs.screen.allScreens()
  local screenCount = #screens

  if screenCount < 2 then
      hs.alert.show("no screens")
      return
  end

  -- 現在のスクリーンのインデックスを取得
  local currentIndex = nil
  for i, screen in ipairs(screens) do
      if screen:id() == currentScreen:id() then
          currentIndex = i
          break
      end
  end

  if not currentIndex then
      hs.alert.show("no current screen")
      return
  end

  -- 次のスクリーンのインデックスを計算
  local nextIndex = currentIndex % screenCount + 1
  local nextScreen = screens[nextIndex]

  -- 次のスクリーンの中央にカーソルを移動
  local frame = nextScreen:frame()
  local newPos = {
      x = frame.x + frame.w / 2,
      y = frame.y + frame.h / 2
  }
  hs.mouse.absolutePosition(newPos)
  hs.alert.show("move to next screen")
end

-- マウスカーソルを前のスクリーンに移動する関数
function moveMouseToPreviousScreen()
  local currentScreen = hs.mouse.getCurrentScreen()
  local screens = hs.screen.allScreens()
  local screenCount = #screens

  if screenCount < 2 then
      hs.alert.show("no screens")
      return
  end

  -- 現在のスクリーンのインデックスを取得
  local currentIndex = nil
  for i, screen in ipairs(screens) do
      if screen:id() == currentScreen:id() then
          currentIndex = i
          break
      end
  end

  if not currentIndex then
      hs.alert.show("no current screen")
      return
  end

  -- 前のスクリーンのインデックスを計算
  local previousIndex = (currentIndex - 2) % screenCount + 1
  local previousScreen = screens[previousIndex]

  -- 前のスクリーンの中央にカーソルを移動
  local frame = previousScreen:frame()
  local newPos = {
      x = frame.x + frame.w / 2,
      y = frame.y + frame.h / 2
  }
  hs.mouse.absolutePosition(newPos)
  hs.alert.show("move to previous screen")
end


-- AppleScriptを使って「Ctrl + ←」を送る関数
local function moveSpaceLeft()
  -- key code 123 は「←」キーを意味します
  -- using control down で Ctrl を押しながら、と指定
  hs.osascript.applescript([[
      tell application "System Events"
          key code 123 using control down
      end tell
  ]])
end

-- AppleScriptを使って「Ctrl + →」を送る関数
local function moveSpaceRight()
  -- key code 124 は「→」キーを意味します
  hs.osascript.applescript([[
      tell application "System Events"
          key code 124 using control down
      end tell
  ]])
end

-- 「Ctrl + U」で左へ移動
hs.hotkey.bind({"ctrl"}, "u", function()
  hs.alert.show("move to left")
  moveSpaceLeft()
end)

-- 「Ctrl + I」で右へ移動
hs.hotkey.bind({"ctrl"}, "i", function()
  hs.alert.show("move to right")
  moveSpaceRight()
end)

-- Control + Space でカーソルを次のスクリーンに移動
hs.hotkey.bind({"ctrl"}, "space", moveMouseToNextScreen)

-- Control + Shift + Space でカーソルを前のスクリーンに移動
hs.hotkey.bind({"ctrl", "shift"}, "space", moveMouseToPreviousScreen)

local function clickAtCursor()
  -- 現在のマウス座標を取得
  local point = hs.mouse.absolutePosition()

  -- マウスダウン（左クリック押し込み）
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, point):post()

  -- マウスアップ（左クリック解放）
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, point):post()
end

-- Ctrl + Oで実行
hs.hotkey.bind({"ctrl"}, "o", function()

  -- カーソル位置をクリック
  clickAtCursor()
end)
