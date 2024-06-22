#include <sourcemod>

#include "bonus-round-events/use-case"

#include "modules/event.sp"
#include "modules/forward.sp"
#include "modules/use-case.sp"

public Plugin myinfo = {
    name = "Bonus round events",
    author = "Dron-elektron",
    description = "Allows you to use custom events in the bonus round",
    version = "1.0.1",
    url = "https://github.com/dronelektron/bonus-round-events"
};

public void OnPluginStart() {
    Event_Create();
    Forward_Create();
}

public void OnMapEnd() {
    UseCase_BonusRoundEnd();
}
