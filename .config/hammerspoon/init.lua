------------------------------------------------------
-- Ctrl + Space でカーソルを次のスクリーン（ディスプレイ）に移動
-- Ctrl + Shift + Space でカーソルを前のスクリーン（ディスプレイ）に移動
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



-- 「Ctrl + Space」でカーソルを次のスクリーンへ
hs.hotkey.bind({ "ctrl" }, "space", moveMouseToNextScreen)

-- 「Ctrl + Shift + Space」でカーソルを前のスクリーンへ
hs.hotkey.bind({ "ctrl", "shift" }, "space", moveMouseToPreviousScreen)

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
hs.hotkey.bind({ "ctrl" }, "o", function()
    clickAtCursor()
end)
