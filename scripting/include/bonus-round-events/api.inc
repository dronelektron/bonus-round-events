#if defined _bonus_round_events_api_included
 #endinput
#endif
#define _bonus_round_events_api_included

forward void BonusRound_OnReset(int client);

forward void BonusRound_OnLoser(int client);

forward void BonusRound_OnWinner(int client);

forward void BonusRound_OnSpectator(int client);
