local E, L, V, P, G, _ = unpack(select(2, ...)); --Inport: Engine, Locales, PrivateDB, ProfileDB, GlobalDB, Localize Underscore
local S = E:GetModule('Skins')
local LSM = LibStub("LibSharedMedia-3.0")

local function LoadSkin()
	if E.private.skins.blizzard.enable ~= true or E.private.skins.blizzard.losscontrol ~= true then return end
	
	--/run LossOfControlFrame.fadeTime = 2000; LossOfControlFrame_SetUpDisplay(LossOfControlFrame, true, 'CONFUSE', 2094, 'Disoriented', [[Interface\Icons\Spell_Shadow_MindSteal]], 72101.9765625, 7.9950003623962, 8, 0, 5, 2)
	local IconBackdrop = CreateFrame("Frame", nil, LossOfControlFrame)
	IconBackdrop:SetTemplate()
	IconBackdrop:SetOutside(LossOfControlFrame.Icon)
	IconBackdrop:SetFrameLevel(LossOfControlFrame:GetFrameLevel() - 1)

	LossOfControlFrame.Icon:SetTexCoord(.1, .9, .1, .9)
	LossOfControlFrame:StripTextures()
	LossOfControlFrame.AbilityName:ClearAllPoints()

	local font = E["media"].normFont
	LossOfControlFrame.Anim:HookScript('OnFinished', function()
		LossOfControlFrame.AbilityName:FontTemplate(font, 28, 'OUTLINE')
		LossOfControlFrame.TimeLeft.NumberText:FontTemplate(font, 28, 'OUTLINE')
		LossOfControlFrame.TimeLeft.SecondsText:FontTemplate(font, 28, 'OUTLINE')
	end)
	

	hooksecurefunc("LossOfControlFrame_SetUpDisplay", function(self, ...)	
		self.Icon:ClearAllPoints()
		self.Icon:SetPoint("CENTER", self, "CENTER", 0, 0)

		self.AbilityName:ClearAllPoints()
		self.AbilityName:SetPoint("BOTTOM", self, 0, -28)

		self.TimeLeft.NumberText:ClearAllPoints()
		self.TimeLeft.NumberText:SetPoint("BOTTOM", self, 4, -58)

		self.TimeLeft.SecondsText:ClearAllPoints()
		self.TimeLeft.SecondsText:SetPoint("BOTTOM", self, 0, -80)

		-- always stop shake animation on start
		if self.Anim:IsPlaying() then
			self.Anim:Stop()
		end
	end)

end

S:RegisterSkin("ElvUI", LoadSkin)