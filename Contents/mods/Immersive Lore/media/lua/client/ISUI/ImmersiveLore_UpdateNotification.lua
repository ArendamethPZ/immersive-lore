return
--[[
require "ISUI/ISPanelJoypad"
require "ISUI/ISCollapsableWindow"

ImmersiveLore_UpdateNotification = ISCollapsableWindow:derive("ImmersiveLore_UpdateNotification");

function ImmersiveLore_UpdateNotification:createChildren()
    local btnWid = 100
    local btnHgt = 25
    local f = 0.8

    local text =
        "<H1> Immersive Lore Update Notice <BR><LEFT><SIZE:medium>" ..
        "If you're a <SPACE><PUSHRGB:0,1,0>regular player <SPACE><POPRGB> on a server, you can safely dismiss this message. <BR>" ..
        "<PUSHRGB:1,0.5,0><SPACE>However, if you're playing singleplayer or you're a server admin: <SPACE><POPRGB><SPACE><LINE>" ..
        "Starting <SPACE><RGB:1,0,0> May 7th, 2025 <RGB:1,1,1>, the Immersive Lore mod will require the Location Identifier Framework (LIF) mod. <BR>" ..
        "Without LIF installed, Immersive Lore will <PUSHRGB:1,0,0><SPACE>no longer function <POPRGB><SPACE>correctly. <BR>" ..
        "<PUSHRGB:0.7,0.8,1> It is recommended you install LIF ahead of time to avoid disruption and ensure compatibility. <BR>" ..
        "<ORANGE> Thank you for using Immersive Lore!"

    self.contentBox = ISRichTextPanel:new(10, 40, self:getWidth() - 20, self:getHeight() - 100);
    self.contentBox:initialise();
    self.contentBox:instantiate();
    self.contentBox:setText(text)
    self.contentBox:addScrollBars(false)
    self.contentBox:setMargins(0, 0, 20, 0)
    self.contentBox.backgroundColor = { r = 0, g = 0, b = 0, a = 0 };
    self:addChild(self.contentBox);

    self.contentBox.autosetheight = false;
    self.contentBox:paginate()

    self.closeButton = ISButton:new(self:getWidth() - (btnWid * f) - 10, self:getHeight() - btnHgt - 10, btnWid * f,
        btnHgt, "Close", self, ImmersiveLore_UpdateNotification.onOptionMouseDown)
    self.closeButton.internal = "CLOSE"
    self.closeButton.anchorTop = false
    self.closeButton.anchorBottom = true
    self.closeButton:initialise()
    self.closeButton:instantiate()
    self.closeButton.borderColor = { r = 1, g = 1, b = 1, a = 1 }
    self:addChild(self.closeButton)

    local x = self.closeButton.x - self.closeButton:getWidth() - 10
    self.infoButton = ISButton:new(x, self:getHeight() - btnHgt - 10, btnWid * f,
        btnHgt, "LIF Mod Page", self, ImmersiveLore_UpdateNotification.onOptionMouseDown)
    self.infoButton.internal = "INFO"
    self.infoButton.anchorTop = false
    self.infoButton.anchorBottom = true
    self.infoButton:initialise()
    self.infoButton:instantiate()
    self.infoButton.borderColor = { r = 0.3, g = 0.6, b = 1, a = 1 }
    self.infoButton.backgroundColor = { r = 0, g = 0.3, b = 0.7, a = 0.8 }
    self.infoButton.backgroundColorMouseOver = { r = 0.1, g = 0.4, b = 1, a = 1 }
    self:addChild(self.infoButton)

    ISCollapsableWindow.createChildren(self)
end

function ImmersiveLore_UpdateNotification:onOptionMouseDown(button, x, y)
    if button.internal == "CLOSE" then
        self:close()
    elseif button.internal == "INFO" then
        local url = "https://steamcommunity.com/sharedfiles/filedetails/?id=3473144811/"
        if isSteamOverlayEnabled() then
            activateSteamOverlayToWebPage(url)
        else
            openUrl(url)
        end
    end
end

function ImmersiveLore_UpdateNotification:prerender()
    ISCollapsableWindow.prerender(self)
end

function ImmersiveLore_UpdateNotification:render()
    ISCollapsableWindow.render(self)
end

function ImmersiveLore_UpdateNotification:close()
    ImmersiveLore_UpdateNotification.instance = nil
    self:setVisible(false)
    self:removeFromUIManager()
end

function ImmersiveLore_UpdateNotification:new(x, y, character)
    local width = 560
    local height = 450
    local o = ISCollapsableWindow.new(self, x, y, width, height)
    o.chr = character

    o.playerNum = character:getPlayerNum()

    if y == 0 then
        o.y = getPlayerScreenTop(o.playerNum) + (getPlayerScreenHeight(o.playerNum) - height) / 2
        o:setY(o.y)
    end
    if x == 0 then
        o.x = getPlayerScreenLeft(o.playerNum) + (getPlayerScreenWidth(o.playerNum) - width) / 2
        o:setX(o.x)
    end
    o.width = width
    o.height = height
    o.moveWithMouse = true
    o.anchorLeft = true
    o.anchorRight = true
    o.anchorTop = true
    o.anchorBottom = true
    o:setResizable(false)
    o:setTitle("Update alert")
    ImmersiveLore_UpdateNotification.instance = o
    return o
end
]] --
