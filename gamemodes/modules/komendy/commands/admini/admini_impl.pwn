//-----------------------------------------------<< Source >>------------------------------------------------//
//                                                     a                                                     //
//----------------------------------------------------*------------------------------------------------------//
//----[                                                                                                 ]----//
//----[         |||||             |||||                       ||||||||||       ||||||||||               ]----//
//----[        ||| |||           ||| |||                      |||     ||||     |||     ||||             ]----//
//----[       |||   |||         |||   |||                     |||       |||    |||       |||            ]----//
//----[       ||     ||         ||     ||                     |||       |||    |||       |||            ]----//
//----[      |||     |||       |||     |||                    |||     ||||     |||     ||||             ]----//
//----[      ||       ||       ||       ||     __________     ||||||||||       ||||||||||               ]----//
//----[     |||       |||     |||       |||                   |||    |||       |||                      ]----//
//----[     ||         ||     ||         ||                   |||     ||       |||                      ]----//
//----[    |||         |||   |||         |||                  |||     |||      |||                      ]----//
//----[    ||           ||   ||           ||                  |||      ||      |||                      ]----//
//----[   |||           ||| |||           |||                 |||      |||     |||                      ]----//
//----[  |||             |||||             |||                |||       |||    |||                      ]----//
//----[                                                                                                 ]----//
//----------------------------------------------------*------------------------------------------------------//
// Autor: mrucznik
// Data utworzenia: 15.09.2024
// Aktualizacja: 20.04.2025


//

//------------------<[ Implementacja: ]>-------------------
command_admini_Impl(playerid)
{
    if(IsPlayerConnected(playerid))
	{
		new string[128], activeAdmins;
		SendClientMessage(playerid, -1, "Lista administratorów na s³u¿bie:");

		foreach(new i : Player)
		{
			if(GetPlayerAdminDutyStatus(i) == 1)
			{
				if(PlayerInfo[i][pAdmin] == 5000)
				{
					format(string, sizeof(string), "{FFFFFF}H@: {FF6A6A}%s {FFFFFF}[ID: %d]", GetNickEx(i), i);
				}
				else if(IsAScripter(i)) 
				{
					format(string, sizeof(string), "{FFFFFF}Skrypter: {747b41}%s {FFFFFF}[ID: %d]", GetNickEx(i), i);
				} 
				else if(PlayerInfo[i][pAdmin] >= 1)
				{
					format(string, sizeof(string), "{FFFFFF}Administrator: {FF6A6A}%s {FFFFFF}[ID: %d] [@LVL: %d]", GetNickEx(i), i, PlayerInfo[i][pAdmin]); 
				}
				else if(PlayerInfo[i][pNewAP] >= 1 && PlayerInfo[i][pNewAP] <= 4)
				{
					format(string, sizeof(string), "{FFFFFF}Pó³-Admin: {00C0FF}%s {FFFFFF}[ID: %d] [P@LVL: %d]", GetNickEx(i), i, PlayerInfo[i][pNewAP]); 
				}
				sendTipMessage(playerid, string); 
				activeAdmins = true;
			}
		}

		if(!activeAdmins) 
		{
			SendClientMessage(playerid, -1, "--- Brak ---"); 
			SendClientMessage(playerid, -1, "Lista administratorów na serwerze:"); 

			foreach(new i : Player)
			{
				if(PlayerInfo[i][pAdmin] == 5000)
				{
					format(string, sizeof(string), "{888888}H@: {FF6A6A}%s {888888}[ID: %d]", GetNickEx(i), i);
					sendTipMessage(playerid, string); 
				}
				else if(IsAScripter(i)) 
				{
					format(string, sizeof(string), "{888888}Skrypter: {747b41}%s {888888}[ID: %d]", GetNickEx(i), i);
					sendTipMessage(playerid, string); 
				} 
				else if(PlayerInfo[i][pAdmin] >= 1)
				{
					format(string, sizeof(string), "{888888}Administrator: {FF6A6A}%s {888888}[ID: %d] [@LVL: %d]", GetNickEx(i), i, PlayerInfo[i][pAdmin]); 
					sendTipMessage(playerid, string); 
				}
				else if(PlayerInfo[i][pNewAP] >= 1 && PlayerInfo[i][pNewAP] <= 4)
				{
					format(string, sizeof(string), "{888888}Pó³-Admin: {00C0FF}%s {888888}[ID: %d] [P@LVL: %d]", GetNickEx(i), i, PlayerInfo[i][pNewAP]); 
					sendTipMessage(playerid, string); 
				}
			}
		}

		// Lista Zaufanych Graczy
		SendClientMessage(playerid, -1, "");
		SendClientMessage(playerid, -1, "Zaufani Gracze:");
		new sendername[MAX_PLAYER_NAME];
		foreach(new i : Player)
		{
			if(IsPlayerConnected(i) && PlayerInfo[i][pZG] == 10)
			{
				GetPlayerName(i, sendername, sizeof(sendername));
				format(string, sizeof(string), "{00BFFF}Zas³u¿ony: %s {FFFFFF}[ID: %d]", sendername, i);
				sendTipMessage(playerid, string);
			}
		}
	}
	return 1;
}

//end
