====================================================================================

RESHARE JOB LISTRIK DALAM BAHASA INDONESIA

====================================================================================
//FS JOB LISTRIK / PLN
//PASANG KE GM YA
//PASANG AJA DIBAGIAN DEFINE
#define electrictpoint1 -168.4940,-1359.2012,39.5859
#define electrictpoint2 -114.9248,-1235.3380,39.5859
#define electrictpoint3 -52.8410,-1163.1577,38.2500
#define electrictpoint4 -64.5435,-1043.9243,57.1953
#define electrictpoint5 -193.2162,-1465.6602,45.1094
#define electrictpoint6 -286.6356,-1571.1810,43.6406
#define electrictpoint7 -338.6468,-1656.6887,61.2969
#define electrictpoint8 -390.4592,-1751.3878,42.5547
#define electrictpoint9 -172.9453,-966.6528,60.1172
#define electrictpoint10 -260.7132,-901.2745,79.6328

#define panjattext1 -165.6782,-1364.0314,3.1782
#define panjattext2 -119.1398,-1239.1090,2.7952
#define panjattext3 -56.4779,-1167.4708,2.0709
#define panjattext4 -69.8627,-1042.0659,21.1430
#define panjattext5 -187.8154,-1464.0306,8.1869
#define panjattext6 -287.3250,-1576.8574,7.9409
#define panjattext7 -338.6593,-1662.1537,24.2656
#define panjattext8 -394.5280,-1755.0638,7.1137
#define panjattext9 -173.2477,-962.7034,29.7593
#define panjattext10 -263.0460,-897.1548,45.1384

#define turuntext1 -166.4905,-1359.2744,39.5859
#define turuntext2 -116.7517,-1234.8536,39.5859
#define turuntext3 -54.9063,-1163.0781,38.2500
#define turuntext4 -66.2770,-1045.0199,57.1953
#define turuntext5 -191.6429,-1467.0707,45.1094
#define turuntext6 -284.8570,-1572.4786,43.6406
#define turuntext7 -336.6970,-1657.6958,61.2969
#define turuntext8 -392.5077,-1750.6803,42.5547
#define turuntext9 -171.1236,-965.4750,60.1172
#define turuntext10 -259.6728,-899.3857,79.6328

#define pospralatan 263.6614,27.3171,2.4324
#define pospengaman 262.8106,31.2460,2.4343
//PASANG AJA KE BAGIAN NEW
new Pralatan[MAX_PLAYERS] = 0;
new Pelindung[MAX_PLAYERS] = 0;
//PASANG AJA DI BAGIAN DIALOG_TEMP_JOB BISA
DIALOG_TEMP_JOB_ELECTRICT_ST, 	// Mulailah Kang PLN
DIALOG_TEMP_JOB_ELECTRICT_END,  // Selesaikan pekerjaan
//PASANG AJA DI BAGIAN BAWAH TEMP_JOB_PIZZA
TEMP_JOB_ELECTRICT,         // tukang listrik
//PASANG AJA DI BAGIAN BAWAH EndPlayerTempJob(playerid, TEMP_JOB_PIZZA);
EndPlayerTempJob(playerid, TEMP_JOB_ELECTRICT);
//PASANG AJA DI BAGIAN PUBLIC
forward FixingElectrict(playerid);      //Fungsi fixing kabel
public FixingElectrict(playerid)
{
	new rand = random(2);
	switch(rand)
	{
	    case 0:
	    {
	    	SetPlayerJobLoadItems(playerid, GetPlayerJobLoadItems(playerid) + 1);
	       	new fmt_str[358];
			format(fmt_str, sizeof fmt_str, "Kerusakan pada kabel berhasil diperbaiki!, Total tiang listrik yang telah diperbaiki: {FF9900}%d.", GetPlayerJobLoadItems(playerid));
	 		ClearAnimations(playerid);
			SCMJOB(playerid, fmt_str);
 	       	SCMJOB(playerid, "Pergilah dan perbaiki kabel pada marker selanjutnya...");
			GameTextForPlayer(playerid, "~w~PROCESS: ~g~BERHASIL...", 4000, 6);
			SetTimerEx("InfoTDHide", 4000, false, "i", playerid);
            new next = random(10);
		  	switch(next)
			{
				case 0: SetPlayerCheckpoint(playerid, electrictpoint1, 0.8);
				case 1: SetPlayerCheckpoint(playerid, electrictpoint2, 0.8);
				case 2: SetPlayerCheckpoint(playerid, electrictpoint3, 0.8);
				case 3: SetPlayerCheckpoint(playerid, electrictpoint4, 0.8);
				case 4: SetPlayerCheckpoint(playerid, electrictpoint5, 0.8);
				case 5: SetPlayerCheckpoint(playerid, electrictpoint6, 0.8);
				case 6: SetPlayerCheckpoint(playerid, electrictpoint7, 0.8);
				case 7: SetPlayerCheckpoint(playerid, electrictpoint8, 0.8);
				case 8: SetPlayerCheckpoint(playerid, electrictpoint9, 0.8);
				case 9: SetPlayerCheckpoint(playerid, electrictpoint10, 0.8);
			}
		}
	    case 1:
		{
		    new Float:health;
	      	SCMJOB(playerid, "Gagal memperbaiki kabel, anda terkena sedikit setruman listrik");
			GetPlayerHealth(playerid,health);
			SetPlayerHealth(playerid,health-15);
			ClearAnimations(playerid);
			GameTextForPlayer(playerid, "~w~PROCESS: ~r~GAGAL...", 4000, 6);
			SetTimerEx("InfoTDHide", 1000, false, "i", playerid);
		}
	}
}
//PASANG AJA DI ONPLAYERENTERCHECKPOINT
	ElectrictJobCP(playerid);
//PASANG AJA DI BAWAH  case TEMP_JOB_FARM:
	case TEMP_JOB_ELECTRICT:
					{
						if(job == TEMP_JOB_NONE)
						{
							Dialog
							(
								playerid, DIALOG_TEMP_JOB_ELECTRICT_ST, DIALOG_STYLE_MSGBOX,
								"Pekerjaan Tukang Listrik",
								"{FFFFFF}Apakah Anda ingin mendapatkan pekerjaan sebagai tukang listrik?",
								"Ya", "Tidak"
							);
						}
						else
						{
							Dialog
							(
								playerid, DIALOG_TEMP_JOB_ELECTRICT_END, DIALOG_STYLE_MSGBOX,
								"Pekerjaan Tukang Listrik",
								"{FFFFFF}Anda yakin ingin menyelesaikan hari kerja?",
								"Ya", "Tidak"
							);
						}
				}
//PASANG AJA DI BAWAH  case DIALOG_TEMP_JOB_FARM_END:
case DIALOG_TEMP_JOB_ELECTRICT_ST:
			{
				if(response)
				{
					if(GetPlayerTempJob(playerid) == TEMP_JOB_NONE)
					{
					    SetPlayerData(playerid, P_CHECK, 0);
						SetPlayerSkin(playerid, GetTempJobInfo(TEMP_JOB_ELECTRICT, TJ_SKIN)[GetPlayerSex(playerid)]);
						//SetPlayerData(playerid, P_IN_JOB, true);
						InJob[playerid] = 0;
						SetPlayerJobLoadItems(playerid, 0);
						SetPlayerTempJob(playerid, TEMP_JOB_ELECTRICT);

						SCMJOB(playerid, "Anda memulai pekerjaan tukang listrik");
						SCMJOB(playerid, "Ambil peralatan dan pengaman diri lalu mulailah untuk bekerja!");
					}
				}
			}
			case DIALOG_TEMP_JOB_ELECTRICT_END:
			{
				if(response)
				{
				    Pralatan[playerid] = 0;
				    Pelindung[playerid] = 0;
					RemovePlayerAttachedObjects(playerid);
     				EndPlayerTempJob(playerid, TEMP_JOB_ELECTRICT);
				}
			}
//PASANG AJA DI BAWAH DI BAGIAN CMD
CMD:ambilpralatan(playerid)
{
	if(!IsPlayerInRangeOfPoint(playerid, 1.0, pospralatan)) return 1;
	{
		if(GetPlayerTempJob(playerid) != TEMP_JOB_ELECTRICT) return SCMERROR(playerid, "Anda bukan seorang tukang listrik");
		{
		    if((Pralatan[playerid]) == 1) return SCMWARNING(playerid, "Anda sudah mengambil peralatan");
			{
				Pralatan[playerid] = 1;
				SetPlayerAttachedObject(playerid, 0, 19627, 6, 0.094999, 0.029999, 0.034999, 95.000000, 25.000000, 90.000000, 1.500000, 1.899999, 1.500000);
                ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
				SCMJOB(playerid, "Anda berhasil mengambil peralatan kerja");
				if((Pelindung[playerid]) == 0) return 1;
				{
				    SCMJOB(playerid, "Silahkan ikuti marker merah pada peta untuk mulai bekerja");
					new rand;
					rand = random(10);
			     	switch(rand)
					{
						case 0: SetPlayerCheckpoint(playerid, electrictpoint1, 0.8);
						case 1: SetPlayerCheckpoint(playerid, electrictpoint2, 0.8);
						case 2: SetPlayerCheckpoint(playerid, electrictpoint3, 0.8);
						case 3: SetPlayerCheckpoint(playerid, electrictpoint4, 0.8);
						case 4: SetPlayerCheckpoint(playerid, electrictpoint5, 0.8);
						case 5: SetPlayerCheckpoint(playerid, electrictpoint6, 0.8);
						case 6: SetPlayerCheckpoint(playerid, electrictpoint7, 0.8);
						case 7: SetPlayerCheckpoint(playerid, electrictpoint8, 0.8);
						case 8: SetPlayerCheckpoint(playerid, electrictpoint9, 0.8);
						case 9: SetPlayerCheckpoint(playerid, electrictpoint10, 0.8);
					}
				}
			}
		}
	}
	return 1;
}

CMD:ambilarmor(playerid)
{
	if(!IsPlayerInRangeOfPoint(playerid, 1.0, pospengaman)) return 1;
	{
		if(GetPlayerTempJob(playerid) != TEMP_JOB_ELECTRICT) return SCMERROR(playerid, "Anda bukan seorang tukang listrik");
		{
			if((Pelindung[playerid]) == 1) return SCMWARNING(playerid, "Anda sudah mengambil perlengkapan pengaman");
			{
	 			Pelindung[playerid] = 1;
	 			SetPlayerAttachedObject(playerid, 1, 373, 1, 0.259999, -0.004999, -0.164999, 68.000000, 25.500000, 35.000000, 1.000000, 1.000000, 1.000000);
				ApplyAnimation(playerid, "BD_FIRE", "wash_up", 4.1, 0, 0, 0, 0, 0, 1);
	 			SCMJOB(playerid, "Anda berhasil mengambil perlengkapan keselamatan");
				if((Pralatan[playerid]) == 0) return 1;
				{
				    SCMJOB(playerid, "Silahkan ikuti marker merah pada peta untuk mulai bekerja");
				    new rand;
					rand = random(10);
			     	switch(rand)
					{
						case 0: SetPlayerCheckpoint(playerid, electrictpoint1, 0.8);
						case 1: SetPlayerCheckpoint(playerid, electrictpoint2, 0.8);
						case 2: SetPlayerCheckpoint(playerid, electrictpoint3, 0.8);
						case 3: SetPlayerCheckpoint(playerid, electrictpoint4, 0.8);
						case 4: SetPlayerCheckpoint(playerid, electrictpoint5, 0.8);
						case 5: SetPlayerCheckpoint(playerid, electrictpoint6, 0.8);
						case 6: SetPlayerCheckpoint(playerid, electrictpoint7, 0.8);
						case 7: SetPlayerCheckpoint(playerid, electrictpoint8, 0.8);
						case 8: SetPlayerCheckpoint(playerid, electrictpoint9, 0.8);
						case 9: SetPlayerCheckpoint(playerid, electrictpoint10, 0.8);
					}
				}
			}
		}
	}
	return 1;
}
CMD:panjat(playerid, params[])
{
	new Float:health;
	GetPlayerHealth(playerid, health);
	if((health) < 40) return SCMWARNING(playerid, "Anda tidak diperbolehkan memberbaiki listrik karena darah anda dibawah 40");
	if(GetPlayerTempJob(playerid) == TEMP_JOB_ELECTRICT)
	{
		extract params -> new id;
		switch(id)
		{
      		case 1:
			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext1))
			{
				SetPlayerPos(playerid, turuntext1);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 2:
			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext2))
			{
				SetPlayerPos(playerid, turuntext2);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 3:
			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext3))
			{
				SetPlayerPos(playerid, turuntext3);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 4:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext4))
			{
				SetPlayerPos(playerid, turuntext4);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 5:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext5))
			{
				SetPlayerPos(playerid, turuntext5);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
    		case 6:
			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext6))
			{
				SetPlayerPos(playerid, turuntext6);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 7:
			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext7))
			{
				SetPlayerPos(playerid, turuntext7);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 8:
			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext8))
			{
				SetPlayerPos(playerid, turuntext8);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 9:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext9))
			{
				SetPlayerPos(playerid, turuntext9);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
			case 10:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, panjattext10))
			{
				SetPlayerPos(playerid, turuntext10);
				SCMWARNING(playerid, "Anda berada diatas tiang listrik, berhati-hatilah saat memperbaiki kabel");
			}
		}
	}
	return 1;
}

CMD:turun(playerid, params[])
{
	if(GetPlayerTempJob(playerid) == TEMP_JOB_ELECTRICT)
	{
		extract params -> new id;
		switch(id)
		{
		    case 1:
			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext1))
			{
				SetPlayerPos(playerid, panjattext1);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 2:
			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext2))
			{
				SetPlayerPos(playerid, panjattext2);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 3:
			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext3))
			{
				SetPlayerPos(playerid, panjattext3);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 4:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext4))
			{
				SetPlayerPos(playerid, panjattext4);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 5:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext5))
			{
				SetPlayerPos(playerid, panjattext5);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 6:
			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext6))
			{
				SetPlayerPos(playerid, panjattext6);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 7:
			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext7))
			{
				SetPlayerPos(playerid, panjattext7);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 8:
			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext8))
			{
				SetPlayerPos(playerid, panjattext8);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 9:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext9))
			{
				SetPlayerPos(playerid, panjattext9);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
			case 10:
   			if(IsPlayerInRangeOfPoint(playerid,1.0, turuntext10))
			{
				SetPlayerPos(playerid, panjattext10);
				SCMWARNING(playerid, "Anda berhasil turun dari atas tiang listrik");
			}
		}
	}
}
//PASANG AJA DI BAGIAN STOCK EndPlayerTempJob PALING BAWAH/ATAS
case TEMP_JOB_ELECTRICT:
			{
				DisablePlayerCheckpoint(playerid);
				if(items > 0)
				{
				    pay_sum = items * GetTempJobInfo(job, TJ_PAY_FOR_LOAD);

				    pay_sum *= g_doubling[DOUBLING_WAGE];
					format(fmt_str, sizeof fmt_str, "Hari kerja berakhir. Total kerusakan kabel pada tiang listrik yang diperbaiki: {FFFF00}%d", items);
					SCMJOB(playerid, fmt_str);

					format(fmt_str, sizeof fmt_str, "Total yang diterima {FFFFFF}$%d", pay_sum);
					SendClientMessage(playerid, 0xffff00FF, fmt_str);

					GivePlayerMoneyEx(playerid, pay_sum, "Gaji Kang Listrik", true, false);

					format(fmt_str, sizeof fmt_str, "~b~~h~+$%d", pay_sum);
					GameTextForPlayer(playerid, fmt_str, 4000, 1);
					SetPlayerData(playerid, P_CHECK,0);
				}
				else
				{
					SCMJOB(playerid, "Hari kerja sudah berakhir");
					SetPlayerData(playerid, P_CHECK,0);
				}
			}
//PASANG AJA DI BAGIAN stock SetPlayerDataDisconnect(playerid)
EndPlayerTempJob(playerid, TEMP_JOB_ELECTRICT);
//PASANG AJA DI BAGIAN STOCK
stock ElectrictJobCP(playerid)
{
	//----------------------------------- [ JOB TUKANG LISTRIK ]
	if(GetPlayerTempJob(playerid) == TEMP_JOB_ELECTRICT)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint1))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 15000, false, "i", playerid);
	        GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint2))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 13000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint3))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 10000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint4))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 12000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint5))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 11000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint6))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 15000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint7))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 13000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint8))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 10000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint9))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 12000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
		if (IsPlayerInRangeOfPoint(playerid, 1.0, electrictpoint10))
	    {
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, 1, 0, 0, 0, 1);
	        SetTimerEx("FixingElectrict", 11000, false, "i", playerid);
	    	GameTextForPlayer(playerid, "~w~TRY TO FIXING PROCESS...", 10000, 6);
		}
	}
}

//PASANG AJA DI new g_temp_jobs[16][E_TEMP_JOB_STRUCT] PALING BAWAH
{"Pekerjaan Tukang Listrik", 268.5772,34.6503,2.4360, 		10,	{27, 233}}	// tukang listrik
//PASANG AJA DI ONGAMEMODEINIT
	//------------------- [ DYNAMIC TEXT ELECTRICAL JOB ] ------------------///
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 1", 0xFFFFFFFF ,panjattext1 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 2", 0xFFFFFFFF ,panjattext2 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 3", 0xFFFFFFFF ,panjattext3 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 4", 0xFFFFFFFF ,panjattext4 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 5", 0xFFFFFFFF ,panjattext5 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 6", 0xFFFFFFFF ,panjattext6 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 7", 0xFFFFFFFF ,panjattext7 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 8", 0xFFFFFFFF ,panjattext8 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 9", 0xFFFFFFFF ,panjattext9 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Jika kamu Tukang Listrik\nGunakan:{ffff00} /panjat 10", 0xFFFFFFFF ,panjattext10 + 0.3, 8.0);

	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 1", 0xFFFFFFFF ,turuntext1 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 2", 0xFFFFFFFF ,turuntext2 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 3", 0xFFFFFFFF ,turuntext3 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 4", 0xFFFFFFFF ,turuntext4 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 5", 0xFFFFFFFF ,turuntext5 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 6", 0xFFFFFFFF ,turuntext6 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 7", 0xFFFFFFFF ,turuntext7 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 8", 0xFFFFFFFF ,turuntext8 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 9", 0xFFFFFFFF ,turuntext9 + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk turun dari sini\nGunakan:{ffff00} /turun 10", 0xFFFFFFFF ,turuntext10 + 0.3, 8.0);

	CreateDynamic3DTextLabel("Untuk mengambil pralatan\nGunakan:{ffff00} /ambilpralatan", 0xFFFFFFFF ,pospralatan + 0.3, 8.0);
	CreateDynamic3DTextLabel("Untuk mengambil perlengkapan pengaman\nGunakan:{ffff00} /ambilarmor", 0xFFFFFFFF ,pospengaman + 0.3, 8.0);

CMD:takemoney(playerid, params[])
{
    
    //if(GetPlayerAdminEx(playerid) < 5) return 1;
    if(strfind(params, "-", true)!= -1) return SendClientMessage(playerid, COLOR_LIGHTRED, "Cukup input nominal yang di ambil tanpa tanda minus (-)");
    extract params -> new to_player, cash; else return SendClientMessage(playerid, 0xCECECEFF, "Gunakan: /takemoney [id pemain] [jumlah yang di ambil]");
    //if(!IsPlayerConnected(to_player) || !IsPlayerLogged(to_player)) return SendClientMessage(playerid, 0xCECECEFF, "Tidak ada pemain seperti itu");
    //if(!(-25_000_000 <= cash <= 25_000_000)) return SendClientMessage(playerid, 0xCECECEFF, "Anda dapat menerbitkan dari 1 hingga 25000000$ pada suatu waktu");
    if(cash > 100000) return SendClientMessage(playerid, COLOR_LIGHTRED, "Maaf setiap pengambilan uang di batasi hanya sampai 100.000 karena sering berisiko salah");
    cash = -cash;
    new reason[144];
    format(reason, sizeof reason, "Mengambil uang dari player %s", GetRPName(playerid));
    SendClientMessage(playerid, COLOR_LGREEN, reason);
    GivePlayerMoneyEx(to_player, cash, reason, true, true); // ini ke tujuan pengambilan
    GivePlayerMoneyEx(playerid, -cash, reason, true, false);    // ini ke uang pengambil bertambah
    format(reason, sizeof reason, "%s %s telah mengambil uang anda sebesar $%d", pInfo[playerid][UCP], GetRPName(playerid), cash);
    SendClientMessage(to_player, COLOR_LGREEN, reason); // notifikasi ke korban
    format(reason, sizeof reason, "[CASH] %s[%d] mengambil uang"COL_RED" %s[%d] jumlah $%d, pada akhirnya uangnya berubah jadi "COL_GREEN"$%d",  GetRPName(playerid), playerid,  GetRPName(to_player), to_player, cash, GetPlayerMoneyEx(to_player));
    //SendMessageToAdmins(reason, 0xFFFF00FF);
    SendClientMessage(playerid, COLOR_LIGHTBLUE, reason); // notifkasi ke pelaku sisa uang nya korban.
    
    format(reason, sizeof reason, "Uang di copet oleh %s[acc:%d] Sebesar $%d korbannya adalah %s",  GetRPName(playerid) , pInfo[to_player][ID], cash, GetRPName(to_player));
    printf(reason);
    //SendLog(playerid, LOG_TYPE_SUPERADMIN_ACTION, reason);
    return 1;
}
