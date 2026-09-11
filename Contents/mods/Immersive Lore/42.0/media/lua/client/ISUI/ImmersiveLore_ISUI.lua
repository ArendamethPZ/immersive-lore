local Utils = require("ImmersiveLore_Utils")
require "ISUI/ISPanelJoypad"
require "ISUI/ISCollapsableWindow"

ISReadStoryUI = ISCollapsableWindow:derive("ISReadStoryUI")

function ISReadStoryUI:toggleAuthor()
    local setting = self.chr:getModData().ImmersiveLore_AuthorVisiblity
    if setting then
        self.chr:getModData().ImmersiveLore_AuthorVisiblity = false
        self.authorButton.borderColor = { r = 1, g = 0, b = 0, a = 1 }
    else
        self.chr:getModData().ImmersiveLore_AuthorVisiblity = true
        self.authorButton.borderColor = { r = 0, g = 1, b = 0, a = 1 }
    end
end

function ISReadStoryUI:isAuthorVisiblityEnabled()
    local status = self.chr:getModData().ImmersiveLore_AuthorVisiblity
    return status or false
end

function ISReadStoryUI:toggleCensor()
    local setting = self.chr:getModData().ImmersiveLore_Censorship
    if setting then
        self.chr:getModData().ImmersiveLore_Censorship = false
        self.censorButton.borderColor = { r = 1, g = 0, b = 0, a = 1 }
    else
        self.chr:getModData().ImmersiveLore_Censorship = true
        self.censorButton.borderColor = { r = 0, g = 1, b = 0, a = 1 }
    end

    local contentToShow = self.content

    if self:isCensorshipEnabled() then
        contentToShow = Utils.censorContent(self.content)
    end

    self.contentBox:setText("<RGB:1,1,1>" .. contentToShow)
    self.contentBox:paginate()
end

function ISReadStoryUI:isCensorshipEnabled()
    local status = self.chr:getModData().ImmersiveLore_Censorship
    return status or false
end

function ISReadStoryUI:createChildren()
    local btnWid = 100
    local btnHgt = 25
    local f = 0.8

    local contentToShow = self.content

    if self:isCensorshipEnabled() then
        contentToShow = Utils.censorContent(self.content)
    end

    self.contentBox = ISRichTextPanel:new(10, 40, self:getWidth() - 20, self:getHeight() - 100)
    self.contentBox:initialise()
    self.contentBox:instantiate()
    self.contentBox:setText("<RGB:1,1,1>" .. contentToShow)
    self.contentBox:addScrollBars(false)
    self.contentBox:setMargins(0, 0, 20, 0)
    self.contentBox.backgroundColor = { r = 0, g = 0, b = 0, a = 0 }
    self:addChild(self.contentBox)

    self.contentBox.autosetheight = false
    self.contentBox:paginate()

    self.closeButton = ISButton:new(
        self:getWidth() - (btnWid * f) - 10, self:getHeight() - btnHgt - 10, btnWid * f, btnHgt, "Close", self,
        ISReadStoryUI.onOptionMouseDown
    )
    self.closeButton.internal = "CLOSE"
    self.closeButton.anchorTop = false
    self.closeButton.anchorBottom = true
    self.closeButton:initialise()
    self.closeButton:instantiate()
    self.closeButton.borderColor = { r = 1, g = 1, b = 1, a = 1 }
    self:addChild(self.closeButton)

    self.authorButton = ISButton:new(10, self:getHeight() - 40, 30, 30, "", self, ISReadStoryUI.onOptionMouseDown)
    self.authorButton.internal = "AUTHOR"
    self.authorButton:initialise()
    self.authorButton:instantiate()
    self.authorButton:setImage(getTexture("media/textures/eye.png"))
    if self:isAuthorVisiblityEnabled() then
        self.authorButton.borderColor = { r = 0, g = 1, b = 0, a = 1 }
    else
        self.authorButton.borderColor = { r = 1, g = 0, b = 0, a = 1 }
    end
    self:addChild(self.authorButton)

    self.censorButton = ISButton:new(
        self.authorButton:getRight() + 10, self.authorButton.y, 30, 30, "#!%&!$*", self, ISReadStoryUI.onOptionMouseDown
    )
    self.censorButton.internal = "CENSOR"
    self.censorButton:initialise()
    self.censorButton:instantiate()
    if self:isCensorshipEnabled() then
        self.censorButton.borderColor = { r = 0, g = 1, b = 0, a = 1 }
    else
        self.censorButton.borderColor = { r = 1, g = 0, b = 0, a = 1 }
    end
    self:addChild(self.censorButton)

    ISCollapsableWindow.createChildren(self)
end

function ISReadStoryUI:onMouse(button)
end

function ISReadStoryUI:onOptionMouseDown(button, x, y)
    if button.internal == "CLOSE" then
        self:close()
    elseif button.internal == "AUTHOR" then
        self:toggleAuthor()
    elseif button.internal == "CENSOR" then
        self:toggleCensor()
    end
end

function ISReadStoryUI:prerender()
    ISCollapsableWindow.prerender(self)

    -- local bkg = getTexture("media/textures/wrinkles.png");
    -- self:drawTextureScaled(bkg, -60, -60, self:getWidth() + 500, self:getHeight() + 500, 1, 0.98, 0.96, 0.89);

    if self.author and self:isAuthorVisiblityEnabled() then
        self:drawText(
            "Author: " .. self.author, self.censorButton:getRight() + 10, self.authorButton.y, 1, 1, 1, 1,
            UIFont.NewMedium
        )
    end

    if self:isAuthorVisiblityEnabled() then
        self.authorButton.tooltip = "Disable author visibility"
    else
        self.authorButton.tooltip = "Enable author visibility"
    end

    if self:isCensorshipEnabled() then
        self.censorButton.tooltip = "Disable censorship"
    else
        self.censorButton.tooltip = "Enable censorship"
    end
end

function ISReadStoryUI:render()
    ISCollapsableWindow.render(self)
end

function ISReadStoryUI:close()
    ISReadStoryUI.instance = nil
    self:setVisible(false)
    self:removeFromUIManager()
end

function ISReadStoryUI:new(x, y, character, title, content, author)
    local width = 560
    local height = 300
    local o = ISCollapsableWindow.new(self, x, y, width, height)
    o.chr = character
    o.author = author
    if not author then o.author = "N/A" end
    o.playerNum = character:getPlayerNum()
    o.content = content
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
    o:setTitle(title)
    ISReadStoryUI.instance = o
    return o
end
