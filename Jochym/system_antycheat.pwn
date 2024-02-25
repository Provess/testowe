stock AntyCheat_v01()
{
	ForeachEx(playerid, MAX_PLAYERS)
	{
	    if(IsPlayerConnected(playerid))
	    {
			if(zalogowany[playerid] == false)
			{
				if(!IsPlayerNPC(playerid))
				{
					new Float:x, Float:y, Float:z;
					GetPlayerPos(playerid, x, y, z);
					if(DaneGracza[playerid][gLogin] == 0)
					{
						if(Relog[playerid] == 0)
						{
							if(x != 0 || y != 0 || z!= 0)
							{
								if(x != 245.427795 || y != -1873.137573 || z != 3.317595)
								{
									NadajKare(playerid,-1, 0, ""PREFIXAC".AntyCheat: Spawn bez zalogowania v6", 0);
									Kick(playerid);
								}
							}
						}
					}
					if(DaneGracza[playerid][gLogin] == 0)
					{
						if(Relog[playerid] == 0)
						{
							if(GetPlayerSpeed(playerid) > 3)
							{
								NadajKare(playerid,-1, 0, ""PREFIXAC".AntyCheat: Spawn bez zalogowania v4", 0);
								Kick(playerid);
							}
						}
					}
					if(DaneGracza[playerid][gLogin] == 0)
					{
						if(Relog[playerid] == 0)
						{
							new weaponid = GetPlayerWeapon(playerid);
							if(weaponid != 0)
							{
								ResetPlayerWeapons(playerid);
								format(ACtekst_global, sizeof(ACtekst_global),""PREFIXAC".AntyCheat: Nieautoryzowana bron v3 (%s)",NazwaBroni[weaponid]);
								NadajKare(playerid,-1, 2, ACtekst_global, 30);
								Kick(playerid);
							}
						}
					}
				}
			}
			else
			{
			    AirBrk(playerid);
				if(!UprawnieniaGMa(playerid, 0))
				{
					new weaponid = GetPlayerWeapon(playerid);
					if(weaponid == 35 || weaponid == 36 || weaponid == 37 || weaponid == 38)
					{
						ResetPlayerWeapons(playerid);
						format(ACtekst_global, sizeof(ACtekst_global),""PREFIXAC".AntyCheat: Nieautoryzowana bron (%s)",NazwaBroni[weaponid]);
						NadajKare(playerid,-1, 2, ACtekst_global, 30);
					}
					if(DaneGracza[playerid][gCZAS_ONLINE] < 3 * 60 * 60)
					{
						if(weaponid != 0)
						{
							if(PosiadanaBron[playerid] == 0)
							{
								ResetPlayerWeapons(playerid);
								format(ACtekst_global, sizeof(ACtekst_global),""PREFIXAC".AntyCheat: Nieautoryzowana bron v4 (%s)",NazwaBroni[weaponid]);
								NadajKare(playerid,-1, 2, ACtekst_global, 30);
							}
						}
					}
					new AnimLib[30], AnimName[30];
					GetAnimationName(GetPlayerAnimationIndex(playerid), AnimLib, sizeof(AnimLib), AnimName, sizeof(AnimName));
					if(GetPlayerSpeed(playerid) > 60 && strcmp(AnimLib, "PARACHUTE", true) == 0 && strcmp(AnimName, "FALL_SKYDIVE_ACCEL", true) == 0)
					{
						if((DaneGracza[playerid][gAdmGroup] == 4 || DaneGracza[playerid][gAdmGroup] == 14 || DaneGracza[playerid][gAdmGroup] == 7 || DaneGracza[playerid][gAdmGroup] == 8) && DutyAdmina[playerid] == 1)
						{
							//
						}
						else
						{
							NadajKare(playerid, -1, 0, ""PREFIXAC".AntyCheat: FlyHack", 0);
						}
					}
					//AntyCheat Vehicle
					new vehicleid = GetPlayerVehicleID(playerid);
					new uid = SprawdzCarUID(vehicleid);
					for(new zapytaj = 0; zapytaj<=13; zapytaj++)
					{
						if(GetVehicleComponentInSlot(vehicleid, zapytaj) != 0)
						{
							new banik = 0;
							for(new slot = 0; slot<=13; slot++)
							{
								if(GetVehicleComponentInSlot(vehicleid, zapytaj) == PojazdInfo[uid][pTuning][slot])
								{
									banik++;
								}
							}
							if(banik == 0)
							{
								if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
								{
									NadajKare(playerid,-1, 1, ""PREFIXAC".AntyCheat: Wymuszony tuning pojazdu", -1);
								}
							}
						}
					}
					if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING && DutyAdmina[playerid] == 0)
					{
						NadajKare(playerid, -1, 0, ""PREFIXAC".AntyCheat: Invisibility", 0);
					}
					new Float:xa, Float:ya, Float:za;
					GetPlayerPos(playerid, xa, ya, za);
					if(!IsPlayerInAnyVehicle(playerid))
					{
						if(GetPlayerSpeed(playerid) >= 100 && DaneGracza[playerid][gGAMESCORE] <= 300 && Nieznajomy[playerid] == 0 || GetPlayerSpeed(playerid) >= 250 && DaneGracza[playerid][gGAMESCORE] >= 300)
						{
							if(GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerVirtualWorld(playerid) == 0 && GetPVarInt(playerid, "Teleportacja") == 0 && GetPlayerWeapon(playerid) != 46)
							{
								if(GetPVarInt(playerid, "SynchroPostaci") <= 5)
								{
									if(DaneGracza[playerid][gSpawn] == 0)
									{
										Teleportuj(playerid, BudynekInfo[1][nX],BudynekInfo[1][nY],BudynekInfo[1][nZ]);
										SetPlayerFacingAngle(playerid, BudynekInfo[1][na]);
										SetPlayerVirtualWorld(playerid, BudynekInfo[1][nVW]);
										SetPlayerInterior(playerid, BudynekInfo[1][nINT]);
										SetPlayerVirtualWorld(playerid, 0);
									}
									if(DaneGracza[playerid][gSpawn] == 1)
									{
										Teleportuj(playerid, BudynekInfo[69][nX],BudynekInfo[69][nY],BudynekInfo[69][nZ]);
										SetPlayerFacingAngle(playerid, BudynekInfo[69][na]);
										SetPlayerVirtualWorld(playerid, BudynekInfo[69][nVW]);
										SetPlayerInterior(playerid, BudynekInfo[69][nINT]);
										SetPlayerVirtualWorld(playerid, 0);
									}
									PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
									SetPVarInt(playerid, "SynchroPostaci", GetPVarInt(playerid, "SynchroPostaci")+1);
									new text[64];
									format(text, sizeof(text), "ls-life.AntyCheat: Nieautoryzowana synchronizacja postaci %d/5", GetPVarInt(playerid, "SynchroPostaci"));
									SendClientMessage(playerid, SZARY, text);
									new przelew[124];
									format(przelew, sizeof(przelew), "{FF0000}[OSTRZEZENIE]{FFFFFF} Gracz %s (%d) jest podejrzany o {FF0000}Slapper'a{FFFFFF} (speed: %d)!",ZmianaNicku(playerid), playerid, GetPlayerSpeed(playerid));
									KomunikatAdmin(1, przelew);
									return 1;
								}
								else
								{
									if(DaneGracza[playerid][gSpawn] == 0)
									{
										Teleportuj(playerid, BudynekInfo[1][nX],BudynekInfo[1][nY],BudynekInfo[1][nZ]);
										SetPlayerFacingAngle(playerid, BudynekInfo[1][na]);
										SetPlayerVirtualWorld(playerid, BudynekInfo[1][nVW]);
										SetPlayerInterior(playerid, BudynekInfo[1][nINT]);
										SetPlayerVirtualWorld(playerid, 0);
									}
									if(DaneGracza[playerid][gSpawn] == 1)
									{
										Teleportuj(playerid, BudynekInfo[69][nX],BudynekInfo[69][nY],BudynekInfo[69][nZ]);
										SetPlayerFacingAngle(playerid, BudynekInfo[69][na]);
										SetPlayerVirtualWorld(playerid, BudynekInfo[69][nVW]);
										SetPlayerInterior(playerid, BudynekInfo[69][nINT]);
										SetPlayerVirtualWorld(playerid, 0);
									}
									PlayerPlaySound(playerid, 1190, 0.0, 0.0, 0.0);
									NadajKare(playerid, -1, 0, ""PREFIXAC".AntyCheat: Nieautoryzowana synchronizacja postaci", 0);
									Kick(playerid);
									return 1;
								}
							}
						}
					}
					if(GetPlayerPing(playerid) >= 1000)
					{
						format(ACtekst_global, sizeof(ACtekst_global),""PREFIXAC".AntyCheat: Ping (%d)",GetPlayerPing(playerid));
						NadajKare(playerid,-1, 0, ACtekst_global, 0);
					}
					if((GetPlayerAnimationIndex(playerid) == 1544 || GetPlayerAnimationIndex(playerid) == 1538 || GetPlayerAnimationIndex(playerid) == 1543) && za > 10 && !IsPlayerInWater(playerid))
					{
						NadajKare(playerid,-1, 0, ""PREFIXAC".AntyCheat: Animation Hack", -1);
					}
					if(GetPlayerAnimationIndex(playerid) == 984 && !IsPlayerInWater(playerid))
					{
						NadajKare(playerid,-1, 2, ""PREFIXAC".AntyCheat: Animation Hack v2", -1);
					}
					GetPlayerHealth(playerid,ACHP);
					if(DaneGracza[playerid][gPORTFEL] != GetPlayerMoney(playerid))
					{
						ResetPlayerMoney(playerid);
						GivePlayerMoney(playerid, DaneGracza[playerid][gPORTFEL]);//ANTY MONEY
					}
					static Float: xvel, Float: yvel, Float: zvel;
					GetPlayerVelocity(playerid, xvel, yvel, zvel);
					if(xvel > 0.7 || yvel > 0.7)
					{
						if(GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerWeapon(playerid) == 0)
						{
							new tekst[128];
							format(tekst, sizeof(tekst), ""PREFIXAC".AntyCheat: Velocity: X: %f, Y: %f, Z: %d", xvel, yvel, zvel);
							NadajKare(playerid, -1, 0, tekst, -1);
						}
					}
					if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)
					{
						NadajKare(playerid,-1, 2, ""PREFIXAC".AntyCheat: JetPack", 720);
					}
					new Float:kamizelka;
					GetPlayerArmour(playerid, kamizelka);
					if(kamizelka > 1.0 && GetPVarInt(playerid, "AutoArmour") == 0)
					{
						SetPlayerArmour(playerid, 0.0);
						if(GetPVarInt(playerid, "AntyBugArmour") == 1)
						{
							SetPVarInt(playerid, "AntyBugArmour", 0);
							new armour[36];
							format(armour, sizeof(armour), ""PREFIXAC".AntyCheat: Armour: %f", kamizelka);
							NadajKare(playerid,-1, 0, armour, -1);
						}
						SetPVarInt(playerid, "AntyBugArmour", 1);
						SetTimerEx("AntyBugUsun",5000,0,"d",playerid);
					}
				}
			}
		}
	}
	return 1;
}
forward AntyBugUsun(playerid);
public AntyBugUsun(playerid)
{
	SetPVarInt(playerid, "AntyBugArmour", 0);
	return 1;
}