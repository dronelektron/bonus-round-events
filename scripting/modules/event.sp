void Event_Create() {
    HookEvent("dod_round_win", Event_RoundWin);
    HookEvent("dod_round_start", Event_RoundStart);
}

void Event_HookPlayerTeam() {
    HookEvent("player_team", Event_PlayerTeam);
}

void Event_UnhookPlayerTeam() {
    UnhookEvent("player_team", Event_PlayerTeam);
}

public void Event_RoundWin(Event event, const char[] name, bool dontBroadcast) {
    int winTeam = event.GetInt("team");

    UseCase_BonusRoundStart(winTeam);
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast) {
    UseCase_BonusRoundEnd();
}

public void Event_PlayerTeam(Event event, const char[] name, bool dontBroadcast) {
    int userId = event.GetInt("userid");
    int client = GetClientOfUserId(userId);
    int team = event.GetInt("team");

    UseCase_PlayerTeam(client, team);
}
