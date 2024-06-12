static int g_winTeam;

void UseCase_BonusRoundStart(int winTeam) {
    g_winTeam = winTeam;

    for (int client = 1; client <= MaxClients; client++) {
        if (IsClientInGame(client)) {
            int team = GetClientTeam(client);

            UseCase_PlayerTeam(client, team);
        }
    }
}

void UseCase_BonusRoundEnd() {
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
