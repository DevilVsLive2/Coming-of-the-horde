//! zinc
library PlayerLeaves requires CothUtilities {
    public constant string PlayerColorPrefix[11];

    function PlayerLeave ()  -> nothing {
        string PlayerName = PlayerColorPrefix[GetPlayerId(GetTriggerPlayer())] + GetPlayerName(GetTriggerPlayer()) + "|r";
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 15, PlayerName + " покинул игру.");
        ShareEverythingWithTeam(GetTriggerPlayer());
        ForceRemovePlayer(udg_Horde, GetTriggerPlayer());
        ForceRemovePlayer(udg_Alliance, GetTriggerPlayer());
        ForceRemovePlayer(udg_KickVoteCallers, GetTriggerPlayer());
        EnableTrigger(gg_trg_Horde_Item_Point_Divider);
        EnableTrigger(gg_trg_Alliance_Item_Point_Divider);
    }

    function onInit ()  -> nothing {
        trigger t = CreateTrigger();
        integer index;
        //Инициализация цветов ника
        PlayerColorPrefix[0] = "|c00FF0303";
        PlayerColorPrefix[1] = "|c000042FF";
        PlayerColorPrefix[2] = "|c001CE6B9";
        PlayerColorPrefix[3] = "|c00540081";
        PlayerColorPrefix[4] = "|c00FFFC01";
        PlayerColorPrefix[5] = "|c00FEBA0E";
        PlayerColorPrefix[6] = "|c0020C000";
        PlayerColorPrefix[7] = "|c003F3F3F";
        PlayerColorPrefix[8] = "|c00959697";
        PlayerColorPrefix[9] = "|c007EBFF1";
        PlayerColorPrefix[10] = "|c00106246";
        PlayerColorPrefix[11] = "|c004E2A04";
        for (0 <= index <= 11) {
            TriggerRegisterPlayerEvent(t, Player(index), EVENT_PLAYER_LEAVE);
        }
        TriggerAddAction(t, function PlayerLeave);
    }
}
//! endzinc
