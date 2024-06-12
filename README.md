# Bonus round events

Allows you to use custom events in the bonus round

### Supported Games

* Day of Defeat: Source

### Requirements

* [SourceMod](https://www.sourcemod.net) 1.11 or later

### Installation

* Download latest [release](https://github.com/dronelektron/bonus-round-events/releases)
* Extract `plugins` folder to `addons/sourcemod` folder of your server

### API

Called when the bonus round is over

```sourcepawn
forward void BonusRound_OnReset(int client);
```

Called when the `client` becomes the loser

```sourcepawn
forward void BonusRound_OnLoser(int client);
```

Called when the `client` becomes the winner

```sourcepawn
forward void BonusRound_OnWinner(int client);
```

Called when the `client` becomes the spectator

```sourcepawn
forward void BonusRound_OnSpectator(int client);
```
