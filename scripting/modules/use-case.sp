static bool g_isBonusRound = false;
static int g_winTeam;

void UseCase_BonusRoundStart(int winTeam) {
    g_isBonusRound = true;
    g_winTeam = winTeam;

    Event_HookPlayerTeam();
    Forward_OnStart();

    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            int team = GetClientTeam(client);

            UseCase_PlayerTeam(client, team);
        }
    }
}

void UseCase_BonusRoundEnd() {
    if (!g_isBonusRound) {
        return;
    }

    g_isBonusRound = false;

    Event_UnhookPlayerTeam();
    Forward_OnEnd();

    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            Forward_OnReset(client);
        }
    }
}

void UseCase_PlayerTeam(int client, int team) {
    if (team <= TEAM_SPECTATOR) {
        Forward_OnSpectator(client);
    } else if (team == g_winTeam) {
        Forward_OnWinner(client);
    } else {
        Forward_OnLoser(client);
    }
}
