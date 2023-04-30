//! zinc
library Aura {
    integer indexOfAuraUpgrade = 0;

    function AuraUpgrade ()  -> nothing {
        unit AuraAlliance = gg_unit_n012_0049;
        unit AuraHorde = gg_unit_n013_0255;
        indexOfAuraUpgrade += 1;
        if (indexOfAuraUpgrade == 1) {
            UnitRemoveAbility(AuraAlliance, 'Apiv');
            UnitRemoveAbility(AuraHorde,    'Apiv');
            PauseTimer(GetExpiredTimer());
            DestroyTimer(GetExpiredTimer());
        }

        if (indexOfAuraUpgrade == 2) {
            SetUnitAbilityLevel(AuraAlliance, 'A0C8', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraAlliance, 'A0C9', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraHorde,    'A0CA', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraHorde,    'A0CB', indexOfAuraUpgrade);
        }

        if (indexOfAuraUpgrade == 3) {
            SetUnitAbilityLevel(AuraAlliance, 'A0C8', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraAlliance, 'A0C9', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraHorde,    'A0CA', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraHorde,    'A0CB', indexOfAuraUpgrade);
        }

        if (indexOfAuraUpgrade == 4) {
            SetUnitAbilityLevel(AuraAlliance, 'A0C8', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraAlliance, 'A0C9', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraHorde,    'A0CA', indexOfAuraUpgrade);
            SetUnitAbilityLevel(AuraHorde,    'A0CB', indexOfAuraUpgrade);
            return;
        }
        TimerStart(CreateTimer(), 600, false, function AuraUpgrade);
        AuraHorde = null;
        AuraAlliance = null;
    }

    function onInit ()  -> nothing {
        timer t = CreateTimer();
        TimerStart(t, 900, false, function AuraUpgrade);
    }
}
//! endzinc