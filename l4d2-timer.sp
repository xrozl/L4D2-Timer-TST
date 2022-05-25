#include <sourcemod>

#define VERSION "1.0"
#define NAME "L4D2-Timer"
#define AUTHOR "y"
#define DESCRIPTION "L4D2 Timer"
#define URL "http://www.sourcemod.net/"

public Plugin myinfo =
{
    name = NAME,
    author = AUTHOR,
    description = DESCRIPTION,
    version = VERSION,
    url = URL
};

new Handle:cvar_timer_time;
new int:timer;
new int:nt;

public OnPluginStart() {
    cvar_timer_time = CreateConVar("timer_time", "60", FCVAR_NONE, "Timer time");
    timer = 60;
    nt = 0;

    CreateTimer(timer, callMsg);
}

stock callMsg() {
    nt = nt + 1;
    if (nt == timer) {
        nt = 0;
        timer = GetConVarInt(cvar_timer_time);
        PrintChatToAll("Time is up!");
        CreateTimer(timer, callMsg);
    }
    return;
}
