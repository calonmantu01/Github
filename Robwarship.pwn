PLSSS CREDITS KAY HAMZA WAG NYO 
KALIMUTAN CREDITS AH!!!!

PASTE MOTO SA BABA NG new Robcityhall or Robyacht

new Robwarship[MAX_PLAYERS];
new WARSHIPMONEY[] = { 10000, 75600, 10000, 13500, 150000, 185000, 20000 };
 
 Paste mo to sa baba ng Robyacht
CreateDynamic3DTextLabel("Warship Vault\nType [/robwarship] To start robbery",COLOR_GREEN,-1288.090454,490.632965,11.195312+0.6,4.0);
CreateDynamicPickup(1550, 1, -1288.090454,490.632965,11.195312);

paste morin to sa Robyacht[playerid] = 0;

Robwarship[playerid] = 0;

ganun parin
Robwarship[playerid] = 0;

Paste mo sa Robyacht sa baba or taas
forward afterwarship(playerid);
public afterwarship(playerid)
{
    Robwarship[playerid] = 0;
    SCMA(COLOR_LIGHTBLUE, "*YOU CAN NOW ROB THE WARSHIP!.");
    return 1;
}

paste mo sa robyacht

forward RobWarship(playerid);
public RobWarship(playerid)
{
    SetPlayerWantedLevel(playerid, 6);
    SetPlayerCheckpoint(playerid, 185.244338, -2086.268066, 13.670049, 5);
    ClearAnimations(playerid);
    SetPlayerAttachedObject(playerid, 9, 1550, 1, 0.116999, -0.170999, -0.016000, -3.099997, 87.800018, -179.400009, 0.602000, 0.640000, 0.625000, 0, 0);
    PlayerInfo[playerid][pWantedLevel] = 6;
    new rand = random(sizeof(WARSHIPMONEY));
	PlayerInfo[playerid][pDirtyCash] += WARSHIPMONEY[rand];
    TogglePlayerControllable(playerid, 1);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, "You robbed the warship, Now Goto The Checkpoint to wash your Dirty Money And Get Some Cash!");
    
    mysql_format(connectionID, queryBuffer, sizeof(queryBuffer), "UPDATE users SET DirtyCash = %i WHERE uid = %i", PlayerInfo[playerid][pDirtyCash], PlayerInfo[playerid][pID]);
	mysql_tquery(connectionID, queryBuffer);
    return 1;
}

paste mo sa baba ng cmd:robyacht

CMD:robwarship(playerid, params[])
{
    if(!IsPlayerInRangeOfPoint(playerid, 5, -1288.090454,490.632965,11.195312))
    {
        SCM(playerid, COLOR_WHITE, "Your aren't near in the yacth vault!");
        return 1;
    }
    if(IsLawEnforcement(playerid))
	{
		SCM(playerid, COLOR_GREY, "Law Enforcement Officials cannot rob an warship.");
		return 1;
	}
	new	iSuccess;
	foreach(Player, i)
	{
		if(IsLawEnforcement(i) && PlayerInfo[i][pDuty] == 1)
		{
			iSuccess ++;
		}
	}
	if(iSuccess < 4)
	{
		return SCM(playerid, COLOR_GREY, "There need to be 4+ LEO online in order to rob a yacth!");
	}
    if (Robwarship[playerid] == 0 )
    {
        SCM(playerid, COLOR_WHITE, "You now robbing !!!");
        Robwarship[playerid] = 1;
        ApplyAnimation(playerid,"BOMBER","BOM_Plant", 4.1, 1, 1, 1, 0, 0);
        SetTimerEx("RobWarship", 20000, false, "i", playerid);
        TogglePlayerControllable(playerid, 0);
        SetTimerEx("afterwarship", 15*15000000*1000, false, "i", playerid);
        foreach(Player, i) if(IsLawEnforcement(i) && PlayerInfo[i][pDuty] == 1)
		{
			new szMessage[128];
			format(szMessage, sizeof(szMessage), "ALLERT: (ROBBER: %s) Is Robbing the WARSHIP!",GetPlayerNameEx(playerid));
			SCM(i, COLOR_BLUE, szMessage);
		}
    }
    else
    {
        SCM(playerid, COLOR_WHITE, "[INFO]:ROB WARSHIP IS IN COOLDOWN!");
    }
    return 1;
}
