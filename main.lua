local function SetColorNameplate()
    SetCVar("ShowClassColorInFriendlyNameplate", 1)
    SetCVar("ShowClassColorInNameplate", 1)
end

local function RegisterPlayerFrameClassIcon()
    hooksecurefunc("UnitFramePortrait_Update", function(self)
        if self.unit == "player" or self.unit == "pet" then
            return
        end

        if self.portrait then
            if UnitIsPlayer(self.unit) then
                local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
                if t then
                    self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
                    self.portrait:SetTexCoord(unpack(t))
                else
                    self.portrait:SetTexCoord(0, 1, 0, 1)
                end
            else
                self.portrait:SetTexCoord(0, 1, 0, 1)
            end
        end
    end)
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event)
    SetColorNameplate()
    RegisterPlayerFrameClassIcon()
end)