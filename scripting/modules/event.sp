static bool g_playerTeamHooked = false;

void Event_Create() {
    HookEvent("dod_round_win", Event_RoundWin);
    HookEvent("dod_round_start", Event_RoundStart);
}

public void Event_RoundWin(Event event, const char[] name, bool dontBroadcast) {
    int winTeam = event.GetInt("team");

    UseCase_BonusRoundStart(winTeam);
    HookPlayerTeam(true);
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast) {
    UseCase_BonusRoundEnd();
    HookPlayerTeam(false);
}

static void HookPlayerTeam(bool hook) {
    if (g_playerTeamHooked == hook) {
        return;
    }

    if (hook) {
        HookEvent("player_team", Event_PlayerTeam);
    } else {
        UnhookEvent("player_team", Event_PlayerTeam);
    }

    g_playerTeamHooked = hook;
}

public void Event_PlayerTeam(Event event, const char[] name, bool dontBroadcast) {
    int userId = event.GetInt("userid");
    int client = GetClientOfUserId(userId);
    int team = event.GetInt("team");

    UseCase_PlayerTeam(client, team);
}
