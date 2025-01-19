------------------------------------------------------
-- Ctrl + U で「Mission Controlの左スペース（デスクトップ）」へ移動
-- Ctrl + I で「Mission Controlの右スペース（デスクトップ）」へ移動
--
-- Ctrl + Space でカーソルを次のスクリーン（ディスプレイ）に移動
-- Ctrl + Shift + Space でカーソルを前のスクリーン（ディスプレイ）に移動
-- Ctrl + Enter でもカーソルを次のスクリーンに移動（コメントに合わせて追加）
--
-- Ctrl + O で現在のカーソル位置をクリック
--
-- : + j / : + k でスクロール (vi風の操作)
-- : + gg でページの最上部へ
-- : + G  でページの最下部へ
------------------------------------------------------

------------------------------------------------------
-- ■ カーソルを次のスクリーンに移動
------------------------------------------------------
function moveMouseToNextScreen()
  local currentScreen = hs.mouse.getCurrentScreen()
  local screens = hs.screen.allScreens()
  local screenCount = #screens

  if screenCount < 2 then
      hs.alert.show("No additional screen detected")
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
      hs.alert.show("No current screen found")
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

------------------------------------------------------
-- ■ カーソルを前のスクリーンに移動
------------------------------------------------------
function moveMouseToPreviousScreen()
  local currentScreen = hs.mouse.getCurrentScreen()
  local screens = hs.screen.allScreens()
  local screenCount = #screens

  if screenCount < 2 then
      hs.alert.show("No additional screen detected")
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
      hs.alert.show("No current screen found")
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

------------------------------------------------------
-- ■ Mission Control スペースを左右に移動する (Ctrl + ← / Ctrl + →)
------------------------------------------------------
local function moveSpaceLeft()
  hs.osascript.applescript([[
      tell application "System Events"
          key code 123 using control down
      end tell
  ]])
end

local function moveSpaceRight()
  hs.osascript.applescript([[
      tell application "System Events"
          key code 124 using control down
      end tell
  ]])
end

------------------------------------------------------
-- ■ キーバインド設定
------------------------------------------------------

-- 「Ctrl + U」で左のMission Controlスペースへ
hs.hotkey.bind({"ctrl"}, "u", function()
  moveSpaceLeft()
end)

-- 「Ctrl + I」で右のMission Controlスペースへ
hs.hotkey.bind({"ctrl"}, "i", function()
  moveSpaceRight()
end)

-- 「Ctrl + Space」でカーソルを次のスクリーンへ
hs.hotkey.bind({"ctrl"}, "space", moveMouseToNextScreen)

-- 「Ctrl + Shift + Space」でカーソルを前のスクリーンへ
hs.hotkey.bind({"ctrl", "shift"}, "space", moveMouseToPreviousScreen)

-- 「Ctrl + Enter(=Return)」でもカーソルを次のスクリーンへ（コメントに合わせて追加）
hs.hotkey.bind({"ctrl"}, "return", moveMouseToNextScreen)

------------------------------------------------------
-- ■ カーソル位置をクリック
------------------------------------------------------
local function clickAtCursor()
  -- 現在のマウス座標を取得
  local point = hs.mouse.absolutePosition()
  -- 左クリック(Down)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseDown, point):post()
  -- 左クリック(Up)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types.leftMouseUp, point):post()
end

-- 「Ctrl + O」でカーソル位置をクリック
hs.hotkey.bind({"ctrl"}, "o", function()
  clickAtCursor()
end)

------------------------------------------------------
-- ■ : + j / k / gg / G でスクロール操作する
--    (vi 風のページ移動)
------------------------------------------------------
local colonMode = false      -- : が押されたかどうか
local keyBuffer = ""
local maxBufferLength = 2

local spjkTap = hs.eventtap.new(
  { hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp },
  function(event)
      local keyCode = event:getKeyCode()
      local char = hs.keycodes.map[keyCode] or "(unknown)"
      local eventType = event:getType()

      ------------------------------------------------------
      -- 「:」キーが押されたらモード開始/終了を判定
      ------------------------------------------------------
      if char == ":" then
          if eventType == hs.eventtap.event.types.keyDown then
              colonMode = true
              keyBuffer = ""
          elseif eventType == hs.eventtap.event.types.keyUp then
              colonMode = false
          end
          return false
      end

      ------------------------------------------------------
      -- : モード中にキーが押されたらバッファに追記
      ------------------------------------------------------
      if colonMode and eventType == hs.eventtap.event.types.keyDown then
          keyBuffer = keyBuffer .. char
          if #keyBuffer > maxBufferLength then
              keyBuffer = keyBuffer:sub(-maxBufferLength)
          end

          --------------------------------------------------
          -- : + j → 下方向にスクロール
          --------------------------------------------------
          if keyBuffer == "j" then
              -- 下方向へスクロール(少し上に移動させる)
              hs.eventtap.scrollWheel({0, -2}, {}, "line")
              keyBuffer = ""
              return true

          --------------------------------------------------
          -- : + k → 上方向にスクロール
          --------------------------------------------------
          elseif keyBuffer == "k" then
              -- 上方向へスクロール(少し下に移動させる)
              hs.eventtap.scrollWheel({0, 2}, {}, "line")
              keyBuffer = ""
              return true

          --------------------------------------------------
          -- : + gg → 最上部へ (Cmd + ↑)
          --------------------------------------------------
          elseif keyBuffer == "gg" then
              hs.eventtap.keyStroke({"cmd"}, "up", 0)
              keyBuffer = ""
              return true

          --------------------------------------------------
          -- : + G → 最下部へ (Cmd + ↓)
          --------------------------------------------------
          elseif keyBuffer == "G" then
              hs.eventtap.keyStroke({"cmd"}, "down", 0)
              keyBuffer = ""
              return true
          end
      end

      return false
  end
)

spjkTap:start()
