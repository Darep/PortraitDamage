function PortraitDamage_OnLoad(self)
	self:RegisterEvent("UNIT_COMBAT", "target");
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	CombatFeedback_Initialize(self, TargetHitIndicator, 28);
end

function PortraitDamage_OnEvent(self, event, ...)
	local arg1, arg2, arg3, arg4, arg5 = ...;

	if (event == "PLAYER_TARGET_CHANGED") then
		TargetHitIndicator:SetText("");
		TargetHitIndicator:Hide();
	elseif (event == "UNIT_COMBAT" and arg1 == "target") then
		CombatFeedback_OnCombatEvent(self, arg2, arg3, arg4, arg5);
	end
end

function PortraitDamage_OnUpdate(self, elapsed)
	CombatFeedback_OnUpdate(self, elapsed);
end
