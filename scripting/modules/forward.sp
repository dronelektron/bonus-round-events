static GlobalForward g_onStart;
static GlobalForward g_onEnd;
static GlobalForward g_onReset;
static GlobalForward g_onLoser;
static GlobalForward g_onWinner;
static GlobalForward g_onSpectator;

void Forward_Create() {
    g_onStart = new GlobalForward("BonusRound_OnStart", ET_Ignore);
    g_onEnd = new GlobalForward("BonusRound_OnEnd", ET_Ignore);
    g_onReset = new GlobalForward("BonusRound_OnReset", ET_Ignore, Param_Cell);
    g_onLoser = new GlobalForward("BonusRound_OnLoser", ET_Ignore, Param_Cell);
    g_onWinner = new GlobalForward("BonusRound_OnWinner", ET_Ignore, Param_Cell);
    g_onSpectator = new GlobalForward("BonusRound_OnSpectator", ET_Ignore, Param_Cell);
}

void Forward_OnStart() {
    RoundForward(g_onStart);
}

void Forward_OnEnd() {
    RoundForward(g_onEnd);
}

void Forward_OnReset(int client) {
    ClientForward(g_onReset, client);
}

void Forward_OnLoser(int client) {
    ClientForward(g_onLoser, client);
}

void Forward_OnWinner(int client) {
    ClientForward(g_onWinner, client);
}

void Forward_OnSpectator(int client) {
    ClientForward(g_onSpectator, client);
}

static void RoundForward(GlobalForward callback) {
    Call_StartForward(callback);
    Call_Finish();
}

static void ClientForward(GlobalForward callback, int client) {
    Call_StartForward(callback);
    Call_PushCell(client);
    Call_Finish();
}
