AntiDeAMX();

stock PrzeliczZetony(playerid, id_stolu, kasa_stol, rzad)
{
	new czerwone = 0, niebieskie = 0, zielone = 0, pomaranczowe = 0, rozowe = 0;
	new przelicznik_zetonow, zeton;
	new Float:d = 0;
	if(kasa_stol != 0 )
	{
		for(new i = 0; i < 200; i++)
		{
			if(ObiektInfo[id_stolu][gPokerObj][i] == 0)
			{
				zeton = i;
				break;
			}
		}
		przelicznik_zetonow = kasa_stol;
	}
	else
	{
		zeton = 0;
		przelicznik_zetonow = DaneGracza[playerid][gPokerZetony];
	}
	if(rzad != 0)
	{
		d = d + rzad;
	}
	new Float:zetx1 = DaneGracza[playerid][gPokx], Float:zety1 = DaneGracza[playerid][gPoky], Float:zetz1 = DaneGracza[playerid][gPokz], zetr = DaneGracza[playerid][gPokr];
	new Float:zetx2 = DaneGracza[playerid][gPokx], Float:zety2 = DaneGracza[playerid][gPoky], Float:zetz2 = DaneGracza[playerid][gPokz];
	new Float:zetx3 = DaneGracza[playerid][gPokx], Float:zety3 = DaneGracza[playerid][gPoky], Float:zetz3 = DaneGracza[playerid][gPokz];
	new Float:zetx4 = DaneGracza[playerid][gPokx], Float:zety4 = DaneGracza[playerid][gPoky], Float:zetz4 = DaneGracza[playerid][gPokz];
	new Float:zetx5 = DaneGracza[playerid][gPokx], Float:zety5 = DaneGracza[playerid][gPoky], Float:zetz5 = DaneGracza[playerid][gPokz];
	new Float:dodatekx = 0, Float:dodateky = 0;
	new Float:rotacja_stolu = ObiektInfo[id_stolu][objRotZ];
	for(new i = 0; i < 5; i++)
	{
		d = d+i+1;
		d = d / 10;
		d = d / 1.4;
		if(przelicznik_zetonow / 10 >= 20)
		{
			rozowe += 20;
			przelicznik_zetonow -= 200;
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.5, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.5, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.7, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.7, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.5, zety1+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.5, zety1+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.7, zety1+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.7, zety1+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.5, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.5, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.7, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.7, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.5, zety1-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.5, zety1-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.7, zety1-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.7, zety1-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
		}
		else if(przelicznik_zetonow != 0)
		{
			rozowe += przelicznik_zetonow / 10;
			new dodanych = przelicznik_zetonow / 10;
			przelicznik_zetonow = 0;
			switch(dodanych)
			{
				case 1: {
					zetz1 -= 0.1235;
				}
				case 2: {
					zetz1 -= 0.117;
				}
				case 3: {
					zetz1 -= 0.1105;
				}
				case 4: {
					zetz1 -= 0.104;
				}
				case 5: {
					zetz1 -= 0.0975;
				}
				case 6: {
					zetz1 -= 0.091;
				}
				case 7: {
					zetz1 -= 0.0845;
				}
				case 8: {
					zetz1 -= 0.078;
				}
				case 9: {
					zetz1 -= 0.0715;
				}
				case 10: {
					zetz1 -= 0.065;
				}
				case 11: {
					zetz1 -= 0.0585;
				}
				case 12: {
					zetz1 -= 0.052;
				}
				case 13: {
					zetz1 -= 0.0455;
				}
				case 14: {
					zetz1 -= 0.039;
				}
				case 15: {
					zetz1 -= 0.0325;
				}
				case 16: {
					zetz1 -= 0.026;
				}
				case 17: {
					zetz1 -= 0.0195;
				}
				case 18: {
					zetz1 -= 0.013;
				}
				case 19: {
					zetz1 -= 0.0065;
				}
			}
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.5, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.5, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.7, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+dodatekx, zety1+0.7, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35+dodatekx, zety1+0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.5, zety1+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.5, zety1+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.7, zety1+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.7, zety1+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-0.35-dodatekx, zety1-0.35+dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.5, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.5, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = 0.14;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.7, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1-dodatekx, zety1-0.7, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35-dodatekx, zety1-0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety1 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.5, zety1-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.5, zety1-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = 0.14;
						if(kasa_stol != 0)
						{
							zetx1 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.7, zety1-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.7, zety1-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zetx1 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = 0.1;
						dodateky = 0.1;
						if(kasa_stol != 0)
						{
							zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1940, zetx1+0.35+dodatekx, zety1+0.35-dodateky, zetz1+0.52, 0, 0, 0);
						}
						zety1 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx1 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
			break;
		}
		if(przelicznik_zetonow / 20 >= 20)
		{
			pomaranczowe += 20;
			przelicznik_zetonow -= 400;
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.5, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.5, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.7, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.7, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.5, zety2+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.5, zety2+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.7, zety2+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.7, zety2+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.5, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.5, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.7, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.7, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.5, zety2-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.5, zety2-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.7, zety2-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.7, zety2-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
		}
		else if(przelicznik_zetonow != 0)
		{
			pomaranczowe += przelicznik_zetonow / 20;
			new dodanych = przelicznik_zetonow / 20;
			przelicznik_zetonow = 0;
			switch(dodanych)
			{
				case 1: {
					zetz2 -= 0.1235;
				}
				case 2: {
					zetz2 -= 0.117;
				}
				case 3: {
					zetz2 -= 0.1105;
				}
				case 4: {
					zetz2 -= 0.104;
				}
				case 5: {
					zetz2 -= 0.0975;
				}
				case 6: {
					zetz2 -= 0.091;
				}
				case 7: {
					zetz2 -= 0.0845;
				}
				case 8: {
					zetz2 -= 0.078;
				}
				case 9: {
					zetz2 -= 0.0715;
				}
				case 10: {
					zetz2 -= 0.065;
				}
				case 11: {
					zetz2 -= 0.0585;
				}
				case 12: {
					zetz2 -= 0.052;
				}
				case 13: {
					zetz2 -= 0.0455;
				}
				case 14: {
					zetz2 -= 0.039;
				}
				case 15: {
					zetz2 -= 0.0325;
				}
				case 16: {
					zetz2 -= 0.026;
				}
				case 17: {
					zetz2 -= 0.0195;
				}
				case 18: {
					zetz2 -= 0.013;
				}
				case 19: {
					zetz2 -= 0.0065;
				}
			}
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.5, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.5, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.7, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+dodatekx, zety2+0.7, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35+dodatekx, zety2+0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.5, zety2+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.5, zety2+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.7, zety2+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.7, zety2+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-0.35-dodatekx, zety2-0.35+dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.5, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.5, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = 0.07;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.7, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2-dodatekx, zety2-0.7, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35-dodatekx, zety2-0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety2 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.5, zety2-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.5, zety2-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = 0.07;
						if(kasa_stol != 0)
						{
							zetx2 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.7, zety2-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.7, zety2-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zetx2 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = 0.05;
						dodateky = 0.05;
						if(kasa_stol != 0)
						{
							zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1932, zetx2+0.35+dodatekx, zety2+0.35-dodateky, zetz2+0.52, 0, 0, 0);
						}
						zety2 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx2 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
			break;
		}
		if(przelicznik_zetonow / 50 >= 20)
		{
			zielone += 20;
			przelicznik_zetonow -= 1000;
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.5, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.5, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.7, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.7, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.5, zety3+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.5, zety3+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.7, zety3+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.7, zety3+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.5, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.5, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.7, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.7, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.5, zety3-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.5, zety3-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.7, zety3-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.7, zety3-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
		}
		else if(przelicznik_zetonow != 0)
		{
			zielone += przelicznik_zetonow / 50;
			new dodanych = przelicznik_zetonow / 50;
			przelicznik_zetonow = 0;
			switch(dodanych)
			{
				case 1: {
					zetz3 -= 0.1235;
				}
				case 2: {
					zetz3 -= 0.117;
				}
				case 3: {
					zetz3 -= 0.1105;
				}
				case 4: {
					zetz3 -= 0.104;
				}
				case 5: {
					zetz3 -= 0.0975;
				}
				case 6: {
					zetz3 -= 0.091;
				}
				case 7: {
					zetz3 -= 0.0845;
				}
				case 8: {
					zetz3 -= 0.078;
				}
				case 9: {
					zetz3 -= 0.0715;
				}
				case 10: {
					zetz3 -= 0.065;
				}
				case 11: {
					zetz3 -= 0.0585;
				}
				case 12: {
					zetz3 -= 0.052;
				}
				case 13: {
					zetz3 -= 0.0455;
				}
				case 14: {
					zetz3 -= 0.039;
				}
				case 15: {
					zetz3 -= 0.0325;
				}
				case 16: {
					zetz3 -= 0.026;
				}
				case 17: {
					zetz3 -= 0.0195;
				}
				case 18: {
					zetz3 -= 0.013;
				}
				case 19: {
					zetz3 -= 0.0065;
				}
			}
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.5, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.5, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.7, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+dodatekx, zety3+0.7, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35+dodatekx, zety3+0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.5, zety3+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.5, zety3+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.7, zety3+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.7, zety3+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-0.35-dodatekx, zety3-0.35+dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.5, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.5, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.7, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3-dodatekx, zety3-0.7, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35-dodatekx, zety3-0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety3 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.5, zety3-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.5, zety3-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zetx3 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.7, zety3-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.7, zety3-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zetx3 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = 0;
						dodateky = 0;
						if(kasa_stol != 0)
						{
							zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1931, zetx3+0.35+dodatekx, zety3+0.35-dodateky, zetz3+0.52, 0, 0, 0);
						}
						zety3 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx3 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
			break;
		}
		if(przelicznik_zetonow / 100 >= 20)
		{
			niebieskie += 20;
			przelicznik_zetonow -= 2000;
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.5, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.5, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.7, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.7, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.5, zety4+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.5, zety4+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.7, zety4+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.7, zety4+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.5, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.5, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.7, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.7, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.5, zety4-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.5, zety4-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.7, zety4-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.7, zety4-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
		}
		else if(przelicznik_zetonow != 0)
		{
			niebieskie += przelicznik_zetonow / 100;
			new dodanych = przelicznik_zetonow / 100;
			przelicznik_zetonow = 0;
			switch(dodanych)
			{
				case 1: {
					zetz4 -= 0.1235;
				}
				case 2: {
					zetz4 -= 0.117;
				}
				case 3: {
					zetz4 -= 0.1105;
				}
				case 4: {
					zetz4 -= 0.104;
				}
				case 5: {
					zetz4 -= 0.0975;
				}
				case 6: {
					zetz4 -= 0.091;
				}
				case 7: {
					zetz4 -= 0.0845;
				}
				case 8: {
					zetz4 -= 0.078;
				}
				case 9: {
					zetz4 -= 0.0715;
				}
				case 10: {
					zetz4 -= 0.065;
				}
				case 11: {
					zetz4 -= 0.0585;
				}
				case 12: {
					zetz4 -= 0.052;
				}
				case 13: {
					zetz4 -= 0.0455;
				}
				case 14: {
					zetz4 -= 0.039;
				}
				case 15: {
					zetz4 -= 0.0325;
				}
				case 16: {
					zetz4 -= 0.026;
				}
				case 17: {
					zetz4 -= 0.0195;
				}
				case 18: {
					zetz4 -= 0.013;
				}
				case 19: {
					zetz4 -= 0.0065;
				}
			}
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.5, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.5, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.7, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+dodatekx, zety4+0.7, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35+dodatekx, zety4+0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.5, zety4+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.5, zety4+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.7, zety4+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.7, zety4+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-0.35-dodatekx, zety4-0.35+dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.5, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.5, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = -0.07;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.7, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4-dodatekx, zety4-0.7, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35-dodatekx, zety4-0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety4 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.5, zety4-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.5, zety4-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = -0.07;
						if(kasa_stol != 0)
						{
							zetx4 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.7, zety4-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.7, zety4-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zetx4 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = -0.05;
						dodateky = -0.05;
						if(kasa_stol != 0)
						{
							zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1930, zetx4+0.35+dodatekx, zety4+0.35-dodateky, zetz4+0.52, 0, 0, 0);
						}
						zety4 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx4 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
			break;
		}
		if(przelicznik_zetonow / 200 >= 20)
		{
			czerwone += 20;
			przelicznik_zetonow -= 4000;
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.5, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.5, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.7, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.7, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.5, zety5+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.5, zety5+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.7, zety5+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.7, zety5+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.5, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.5, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.7, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.7, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.5, zety5-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.5, zety5-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.7, zety5-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.7, zety5-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
		}
		else if(przelicznik_zetonow != 0)
		{
			czerwone += przelicznik_zetonow / 200;
			new dodanych = przelicznik_zetonow / 200;
			przelicznik_zetonow = 0;
			switch(dodanych)
			{
				case 1: {
					zetz5 -= 0.1235;
				}
				case 2: {
					zetz5 -= 0.117;
				}
				case 3: {
					zetz5 -= 0.1105;
				}
				case 4: {
					zetz5 -= 0.104;
				}
				case 5: {
					zetz5 -= 0.0975;
				}
				case 6: {
					zetz5 -= 0.091;
				}
				case 7: {
					zetz5 -= 0.0845;
				}
				case 8: {
					zetz5 -= 0.078;
				}
				case 9: {
					zetz5 -= 0.0715;
				}
				case 10: {
					zetz5 -= 0.065;
				}
				case 11: {
					zetz5 -= 0.0585;
				}
				case 12: {
					zetz5 -= 0.052;
				}
				case 13: {
					zetz5 -= 0.0455;
				}
				case 14: {
					zetz5 -= 0.039;
				}
				case 15: {
					zetz5 -= 0.0325;
				}
				case 16: {
					zetz5 -= 0.026;
				}
				case 17: {
					zetz5 -= 0.0195;
				}
				case 18: {
					zetz5 -= 0.013;
				}
				case 19: {
					zetz5 -= 0.0065;
				}
			}
			switch(zetr)
			{
				case 0: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.5, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.5, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d;
					}
					else
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.7, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+dodatekx, zety5+0.7, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d;
					}
				}
				case 45: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35+dodatekx, zety5+0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
					}
				}
				case 90: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.5, zety5+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.5, zety5+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d;
					}
					else
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.7, zety5+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.7, zety5+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] - d;
					}
				}
				case 135: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-0.35-dodatekx, zety5-0.35+dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] - d/1.5;
					}
				}
				case 180: {
					if(rotacja_stolu >= 89 && rotacja_stolu <= 91 || rotacja_stolu <= -269 && rotacja_stolu >= -271 || rotacja_stolu >= 269 && rotacja_stolu <= 271 || rotacja_stolu <= -89 && rotacja_stolu >= -91)
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.5, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.5, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d;
					}
					else
					{
						dodatekx = -0.14;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] - d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.7, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5-dodatekx, zety5-0.7, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] - d;
					}
				}
				case 225: {
					if(rotacja_stolu >= 134 && rotacja_stolu <= 136 || rotacja_stolu <= -224 && rotacja_stolu >= -226 || rotacja_stolu >= 314 && rotacja_stolu <= 316 || rotacja_stolu <= -44 && rotacja_stolu >= -46)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35-dodatekx, zety5-0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
						zety5 =  DaneGracza[playerid][gPoky] - d/1.5;
					}
				}
				case 270: {
					if(rotacja_stolu >= -1 && rotacja_stolu <= 1 || rotacja_stolu >= 359 && rotacja_stolu <= 361 ||rotacja_stolu <= -179 && rotacja_stolu >= -181 || rotacja_stolu >= 179 && rotacja_stolu <= 181 || rotacja_stolu >= -359 && rotacja_stolu <= -361)
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.5, zety5-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.5, zety5-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d;
					}
					else
					{
						dodateky = -0.14;
						if(kasa_stol != 0)
						{
							zetx5 =  DaneGracza[playerid][gPokx] + d;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.7, zety5-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.7, zety5-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zetx5 =  DaneGracza[playerid][gPokx] + d;
					}
				}
				case 315: {
					if(rotacja_stolu >= 44 && rotacja_stolu <= 46 || rotacja_stolu <= -314 && rotacja_stolu >= -316 || rotacja_stolu >= 224 && rotacja_stolu <= 226 || rotacja_stolu <= -134 && rotacja_stolu >= -136)
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
					else
					{
						dodatekx = -0.1;
						dodateky = -0.1;
						if(kasa_stol != 0)
						{
							zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
							zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
							ObiektInfo[id_stolu][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
							DaneGracza[playerid][gNumeryObiektowPostawionych][zeton] = ObiektInfo[id_stolu][gPokerObj][zeton];
						}
						else
						{
							DaneGracza[playerid][gPokerObj][zeton] = CreateDynamicObject(1933, zetx5+0.35+dodatekx, zety5+0.35-dodateky, zetz5+0.52, 0, 0, 0);
						}
						zety5 =  DaneGracza[playerid][gPoky] + d/1.5;
						zetx5 =  DaneGracza[playerid][gPokx] + d/1.5;
					}
				}
			}
			zeton++;
			break;
		}
	}
}

stock KoniecRundy(uid_stolu)
{
	new wygrywajacy[6], wygryw = -1, ilosc_graczy = 0,nr = 0;
	for(new i = 0; i < 6; i++)
	{
		wygrywajacy[i] = -1;
		if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
		{
			wygrywajacy[nr] = ObiektInfo[uid_stolu][gAktualniGracze][i];
			ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
			nr++;
		}
	}
	if(nr > 1)
	{
		for(new i = 0; i < nr; i++)
		{
			wygryw = wygrywajacy[i];
			DaneGracza[wygryw][gPokerZetony] += DaneGracza[wygryw][gPokerPostawione];
			ObiektInfo[uid_stolu][gPokerInfo][1] -= DaneGracza[wygryw][gPokerPostawione];
		}
		new kasa = ObiektInfo[uid_stolu][gPokerInfo][1]/nr;
		for(new i = 0; i < nr; i++)
		{
			wygryw = wygrywajacy[i];
			DaneGracza[wygryw][gPokerZetony] += kasa;
			ObiektInfo[uid_stolu][gPokerInfo][1] -= kasa;
			for(new d = 0; d < 30; d++)
			{
				if(DaneGracza[wygryw][gPokerObj][d] != 0)
				{
					DestroyDynamicObject(DaneGracza[wygryw][gPokerObj][d]);
					DaneGracza[wygryw][gPokerObj][d] = 0;
					DaneGracza[wygryw][gNumeryObiektowPostawionych][d] = 0;
				}
			}
			PrzeliczZetony(wygryw, DaneGracza[wygryw][gPoker], 0, 0);
		}
		wygryw = wygrywajacy[0];
		for(new i = 0; i < 6; i++)
		{
			if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
			{
				new kombinacja[128];
				switch(DaneGracza[wygryw][gInformacjePoker][6])
				{
					case 1:{
						kombinacja = "Poker Królewski";
					}
					case 2,3,4,5,6,7,8,9,10:{
						kombinacja = "Poker";
					}
					case 11:{
						kombinacja = "Karete";
					}
					case 12:{
						kombinacja = "Full";
					}
					case 13:{
						kombinacja = "Kolor";
					}
					case 14:{
						kombinacja = "Strit";
					}
					case 15:{
						kombinacja = "Trojka";
					}
					case 16:{
						kombinacja = "Dwie Pary";
					}
					case 17:{
						kombinacja = "Para";
					}
					case 18:{
						kombinacja = "Wysoka karta";
					}
				}
				new zaklady[120];
				format(zaklady, sizeof(zaklady), "Remis ukladu ~r~%s",kombinacja);
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]], zaklady);
			}
		}
		//PokazWygraneKarty(uid_stolu, wygryw);
		for(new i = 0; i < 6; i++)
		{
			if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
			{
				ilosc_graczy++;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerPostawione] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerKarty][0] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerKarty][1] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][0] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][1] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][2] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][3] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][4] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][5] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][6] = 0;
			}
		}
	}
	else
	{
		wygryw = wygrywajacy[0];
		if(wygryw != -1 && DaneGracza[wygryw][gPokerZetony] != -1)
		{
			if(DaneGracza[wygryw][gInformacjePoker][0] == 1)//jezeli postawil allin
			{
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
					{
						if(DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerPostawione] > DaneGracza[wygryw][gPokerPostawione])
						{
							new ilosc_wiecej;
							ilosc_wiecej = DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerPostawione] - DaneGracza[wygryw][gPokerPostawione];
							ObiektInfo[uid_stolu][gPokerInfo][1] -= ilosc_wiecej;
							DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerZetony] += ilosc_wiecej;
						}
					}
				}
			}
		}
		if(wygryw != -1)
		{
			DaneGracza[wygryw][gPokerZetony] += ObiektInfo[uid_stolu][gPokerInfo][1];
			for(new i = 0; i < 30; i++)
			{
				if(DaneGracza[wygryw][gPokerObj][i] != 0)
				{
					DestroyDynamicObject(DaneGracza[wygryw][gPokerObj][i]);
					DaneGracza[wygryw][gPokerObj][i] = 0;
					DaneGracza[wygryw][gNumeryObiektowPostawionych][i] = 0;
				}
			}
			PrzeliczZetony(wygryw, DaneGracza[wygryw][gPoker], 0, 0);
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
				{
					new kombinacja[128];
					switch(DaneGracza[wygryw][gInformacjePoker][6])
					{
						case 1:{
							kombinacja = "Poker Królewski";
						}
						case 2,3,4,5,6,7,8,9,10:{
							kombinacja = "(Poker)";
						}
						case 11:{
							kombinacja = "(Karete)";
						}
						case 12:{
							kombinacja = "(Full)";
						}
						case 13:{
							kombinacja = "(Kolor)";
						}
						case 14:{
							kombinacja = "(Strit)";
						}
						case 15:{
							kombinacja = "(Trojka)";
						}
						case 16:{
							kombinacja = "(Dwie Pary)";
						}
						case 17:{
							kombinacja = "(Para)";
						}
						case 18:{
							kombinacja = "(Wysoka karta)";
						}
						default:{
							kombinacja = "";
						}
					}
					new zaklady[120];
					format(zaklady, sizeof(zaklady), "Runde wygrywa ~r~%s~w~%s", ZmianaNicku(wygryw), kombinacja);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]], zaklady);				}
			}
			//PokazWygraneKarty(uid_stolu, wygryw);
		}
		else
		{
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
				{
					new zaklady[120];
					format(zaklady, sizeof(zaklady), "Brak zwyciescy w tym rozdaniu");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]], zaklady);
				}
			}
		}
		for(new i = 0; i < 6; i++)
		{
			if(ObiektInfo[uid_stolu][objPoker][i] != -1)
			{
				WybralMozliwoscPoker[ObiektInfo[uid_stolu][objPoker][i]] = 0;
				ilosc_graczy++;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerPostawione] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerKarty][0] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerKarty][1] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][0] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][1] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][2] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][3] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][4] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][5] = 0;
				DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gInformacjePoker][6] = 0;
				CancelSelectTextDraw(ObiektInfo[uid_stolu][objPoker][i]);
			}
		}
	}
	if(ilosc_graczy >= 2)
	{
		ObiektInfo[uid_stolu][gRundaPoker] = 1;
	}
	else
	{
		ObiektInfo[uid_stolu][gRundaPoker] = 0;
	}
	for(new i = 0; i < 100; i++)
	{
		if(ObiektInfo[uid_stolu][gPokerObj][i] != 0)
		{
			DestroyDynamicObject(ObiektInfo[uid_stolu][gPokerObj][i]);
			ObiektInfo[uid_stolu][gPokerObj][i] = 0;
		}
	}
	for(new i = 0; i < 17; i++)
	{
		ObiektInfo[uid_stolu][gPokerKarty][i] = 0;
	}
	ObiektInfo[uid_stolu][gPokerInfo][1] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][2] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][3] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][4] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][5] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][6] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][7] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][8] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][9] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][10] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][11] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][12] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][13] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][14] = 0;
	ObiektInfo[uid_stolu][gPokerInfo][15] = 0;
	OdswiezTexdrawyPoker(uid_stolu, 2);
	SetTimerEx("RozpocznijRunde",7000,0,"d",uid_stolu);
}

forward RozpocznijRunde(uid_stolu);
public RozpocznijRunde(uid_stolu)
{
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][objPoker][i] != -1 && ObiektInfo[uid_stolu][objModel] == 19474 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
		{
			/*PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta6[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta7[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta8[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta9[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta10[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta11[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta12[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta13[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta14[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta15[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta16[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta17[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta18[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta19[ObiektInfo[uid_stolu][objPoker][i]]);*/
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza22[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza33[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza44[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza55[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza66[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker6[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
			PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
			PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
			PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
			PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
			UsunBaryGracz(ObiektInfo[uid_stolu][objPoker][i]);
			OdswiezTexdrawyPoker(uid_stolu, 0);
			RozpocznijPokera(ObiektInfo[uid_stolu][objPoker][i], uid_stolu);
		}
	}
	return 0;
}

stock PokazWygraneKarty(uid_stolu, wygryw)
{
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[playerid] != 0)
		{
			new stol[12], gracz[2], pokazane[7], pokazane2[2];
			new test[256];
			format(test,sizeof(test), "%d,%d,%d,%d,%d", DaneGracza[wygryw][gInformacjePoker][1], DaneGracza[wygryw][gInformacjePoker][2], DaneGracza[wygryw][gInformacjePoker][3], DaneGracza[wygryw][gInformacjePoker][4], DaneGracza[wygryw][gInformacjePoker][5]);
			for(new d = 6; d < 11; d++)
			{
				switch(ObiektInfo[uid_stolu][gPokerInfo][d])
				{
					case 1,2,3,4:{
						stol[d] = 14;
					}
					case 5,6,7,8:{
						stol[d] = 2;
					}
					case 9,10,11,12:{
						stol[d] = 3;
					}
					case 13,14,15,16:{
						stol[d] = 4;
					}
					case 17,18,19,20:{
						stol[d] = 5;
					}
					case 21,22,23,24:{
						stol[d] = 6;
					}
					case 25,26,27,28:{
						stol[d] = 7;
					}
					case 29,30,31,32:{
						stol[d] = 8;
					}
					case 33,34,35,36:{
						stol[d] = 9;
					}
					case 37,38,39,40:{
						stol[d] = 10;
					}
					case 41,42,43,44:{
						stol[d] = 11;
					}
					case 45,46,47,48:{
						stol[d] = 12;
					}
					case 49,50,51,52:{
						stol[d] = 13;
					}
				}
				for(new c = 1; c < 6; c++)
				{
					if(DaneGracza[wygryw][gInformacjePoker][c] == stol[d] && pokazane[c] == 0)
					{
						switch(d)
						{
							case 6:{
								PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta1[ObiektInfo[uid_stolu][objPoker][i]]);
								break;
							}
							case 7:{
								PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta2[ObiektInfo[uid_stolu][objPoker][i]]);
								break;
							}
							case 8:{
								PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta3[ObiektInfo[uid_stolu][objPoker][i]]);
								break;
							}
							case 9:{
								PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta4[ObiektInfo[uid_stolu][objPoker][i]]);
								break;
							}
							case 10:{
								PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta4[ObiektInfo[uid_stolu][objPoker][i]]);
								break;
							}
						}
						pokazane[c] = 1;
					}
				}
			}
			for(new d = 0; d < 2; d++)
			{
				switch(DaneGracza[wygryw][gPokerKarty][d])
				{
					case 1,2,3,4:{
						gracz[d] = 14;
					}
					case 5,6,7,8:{
						gracz[d] = 2;
					}
					case 9,10,11,12:{
						gracz[d] = 3;
					}
					case 13,14,15,16:{
						gracz[d] = 4;
					}
					case 17,18,19,20:{
						gracz[d] = 5;
					}
					case 21,22,23,24:{
						gracz[d] = 6;
					}
					case 25,26,27,28:{
						gracz[d] = 7;
					}
					case 29,30,31,32:{
						gracz[d] = 8;
					}
					case 33,34,35,36:{
						gracz[d] = 9;
					}
					case 37,38,39,40:{
						gracz[d] = 10;
					}
					case 41,42,43,44:{
						gracz[d] = 11;
					}
					case 45,46,47,48:{
						gracz[d] = 12;
					}
					case 49,50,51,52:{
						gracz[d] = 13;
					}
				}
				for(new c = 0; c < 2; c++)
				{
					if(DaneGracza[wygryw][gInformacjePoker][c] == gracz[d] && pokazane2[c] == 0)
					{
						if(ObiektInfo[uid_stolu][objPoker][i] == wygryw)
						{
							switch(d)
							{
								case 0:{
									PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta6[ObiektInfo[uid_stolu][objPoker][i]]);
									break;
								}
								case 1:{
									PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta7[ObiektInfo[uid_stolu][objPoker][i]]);
									break;
								}
							}
						}
						else
						{
							switch(DaneGracza[wygryw][gPokerStanowisko])
							{
								case 0:{
									switch(d)
									{
										case 0:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta8[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
										case 1:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta9[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
									}
								}
								case 1:{
									switch(d)
									{
										case 0:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta10[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
										case 1:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta11[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
									}
								}
								case 2:{
									switch(d)
									{
										case 0:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta12[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
										case 1:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta13[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
									}
								}
								case 3:{
									switch(d)
									{
										case 0:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta14[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
										case 1:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta15[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
									}
								}
								case 4:{
									switch(d)
									{
										case 0:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta16[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
										case 1:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta17[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
									}
								}
								case 5:{
									switch(d)
									{
										case 0:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta18[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
										case 1:{
											PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WygranaKarta19[ObiektInfo[uid_stolu][objPoker][i]]);
											break;
										}
									}
								}
							}
						}
						pokazane2[c] = 1;
					}
				}
			}
		}
	}
	return 1;
}

stock SprawdzNieAllinow(uid_stolu)
{
	new ilosc_nie_allin = 0;
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
		{
			if(DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][0] != 1)
			{
				ilosc_nie_allin++;
			}
		}
	}
	return ilosc_nie_allin;
}

stock SprawdzKolejnego(aktualny)
{
	new kolejny = 0;
	switch(aktualny)
	{
		case 0:{
			kolejny = 4;
		}
		case 1:{
			kolejny = 5;
		}
		case 2:{
			kolejny = 0;
		}
		case 3:{
			kolejny = 1;
		}
		case 4:{
			kolejny = 3;
		}
		case 5:{
			kolejny = 2;
		}
	}
	return kolejny;
}

stock SprawdzPoprzedniego(aktualny)
{
	new poprzedni = 0;
	switch(aktualny)
	{
		case 0:{
			poprzedni = 2;
		}
		case 1:{
			poprzedni = 3;
		}
		case 2:{
			poprzedni = 5;
		}
		case 3:{
			poprzedni = 4;
		}
		case 4:{
			poprzedni = 0;
		}
		case 5:{
			poprzedni = 1;
		}
	}
	return poprzedni;
}

stock SprawdzIloscGraczy(uid_stolu)
{
	new ilosc_graczy = 0;
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
		{
			ilosc_graczy++;
		}
	}
	return ilosc_graczy;
}

stock WylosujKarte(uid_stolu, maxymalna)
{
	new wylosowana = 0;
	for(new i = 0; i < 1000; i++)
	{
		new poprawnosc = 1;
		wylosowana = random(maxymalna);
		for(new j = 0; j < 17; j++)
		{
			if(ObiektInfo[uid_stolu][gPokerKarty][j] == wylosowana || wylosowana == 0)
			{
				poprawnosc = 0;
				break;
			}
		}
		if(poprawnosc == 1)
		{
			for(new z = 0; z < 17; z++)
			{
				if(ObiektInfo[uid_stolu][gPokerKarty][z] == 0)
				{
					ObiektInfo[uid_stolu][gPokerKarty][z] = wylosowana;
					break;
				}
			}
			break;
		}
	}
	return wylosowana;
}

stock NadajTextTextdraw(playerid, uid_stolu, tekst[])
{
	new stanowisko = DaneGracza[playerid][gPokerStanowisko];
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
		{
			switch(stanowisko)
			{
				case 0:{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]], tekst);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
				}
				case 1:{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]], tekst);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
				}
				case 2:{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]], tekst);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
				}
				case 3:{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]], tekst);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
				}
				case 4:{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]], tekst);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
				}
				case 5:{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]], tekst);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
				}
			}
		}
	}
}

stock OdswiezTexdrawyPoker(uid_stolu, karty)
{
	new zetony_draw[124];
	new id_gracza1 = ObiektInfo[uid_stolu][objPoker][0];
	new id_gracza2 = ObiektInfo[uid_stolu][objPoker][1];
	new id_gracza3 = ObiektInfo[uid_stolu][objPoker][2];
	new id_gracza4 = ObiektInfo[uid_stolu][objPoker][3];
	new id_gracza5 = ObiektInfo[uid_stolu][objPoker][4];
	new id_gracza6 = ObiektInfo[uid_stolu][objPoker][5];
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][objPoker][i] != -1 && DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerZetony] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
		{
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza22[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza33[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza44[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza55[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartyGracza66[ObiektInfo[uid_stolu][objPoker][i]]);
			if(id_gracza1 != -1 && id_gracza1 != ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza1][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza1][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza1][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza11[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				if(karty == 1)
				{
					new karta1[64], karta2[64];
					karta1 = SprawdzKarte(DaneGracza[id_gracza1][gPokerKarty][0]);
					karta2 = SprawdzKarte(DaneGracza[id_gracza1][gPokerKarty][1]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]], karta2);
				}
				else if(karty != 2)
				{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
				}
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			else if(id_gracza1 == ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza1][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza1][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza1][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza11[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza1[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			if(id_gracza2 != -1 && id_gracza2 != ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza2][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza2][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza2][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza22[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				if(karty == 1)
				{
					new karta1[64], karta2[64];
					karta1 = SprawdzKarte(DaneGracza[id_gracza2][gPokerKarty][0]);
					karta2 = SprawdzKarte(DaneGracza[id_gracza2][gPokerKarty][1]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]], karta2);
				}
				else if(karty != 2)
				{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
				}
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza22[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			else if(id_gracza2 == ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza2][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza2][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza2][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza22[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza2[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza22[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			if(id_gracza3 != -1 && id_gracza3 != ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza3][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza3][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza3][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza33[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				if(karty == 1)
				{
					new karta1[64], karta2[64];
					karta1 = SprawdzKarte(DaneGracza[id_gracza3][gPokerKarty][0]);
					karta2 = SprawdzKarte(DaneGracza[id_gracza3][gPokerKarty][1]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]], karta2);
				}
				else if(karty != 2)
				{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
				}
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza7[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza8[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza33[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			else if(id_gracza3 == ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza3][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza3][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza3][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza33[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza3[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza33[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			if(id_gracza4 != -1 && id_gracza4 != ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza4][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza4][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza4][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza44[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				if(karty == 1)
				{
					new karta1[64], karta2[64];
					karta1 = SprawdzKarte(DaneGracza[id_gracza4][gPokerKarty][0]);
					karta2 = SprawdzKarte(DaneGracza[id_gracza4][gPokerKarty][1]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]], karta2);
				}
				else if(karty != 2)
				{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
				}
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza9[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza10[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza44[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			else if(id_gracza4 == ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza4][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza4][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza4][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza44[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza4[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza44[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			if(id_gracza5 != -1 && id_gracza5 != ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza5][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza5][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza5][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza55[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				if(karty == 1)
				{
					new karta1[64], karta2[64];
					karta1 = SprawdzKarte(DaneGracza[id_gracza5][gPokerKarty][0]);
					karta2 = SprawdzKarte(DaneGracza[id_gracza5][gPokerKarty][1]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]], karta2);
				}
				else if(karty != 2)
				{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
				}
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza11[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza12[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza55[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			else if(id_gracza5 == ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza5][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza5][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza5][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza55[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza5[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza55[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			if(id_gracza6 != -1 && id_gracza6 != ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza6][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza6][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza6][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza66[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				if(karty == 1)
				{
					new karta1[64], karta2[64];
					karta1 = SprawdzKarte(DaneGracza[id_gracza6][gPokerKarty][0]);
					karta2 = SprawdzKarte(DaneGracza[id_gracza6][gPokerKarty][1]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]], karta2);
				}
				else if(karty != 2)
				{
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]], "LD_CARD:cdback");
				}
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza13[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartaGracza14[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza66[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			else if(id_gracza6 == ObiektInfo[uid_stolu][objPoker][i])
			{
				if(ObiektInfo[uid_stolu][objPokerDiler] == DaneGracza[id_gracza6][gPokerStanowisko])
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d (D)", DaneGracza[id_gracza6][gPokerZetony]);
				}
				else
				{
					format(zetony_draw, sizeof(zetony_draw), "$%d", DaneGracza[id_gracza6][gPokerZetony]);
				}
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], KartyGracza66[ObiektInfo[uid_stolu][objPoker][i]], zetony_draw);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza6[ObiektInfo[uid_stolu][objPoker][i]]);
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza66[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			if(karty != 2)
			{
				new zaklady[120];
				format(zaklady, sizeof(zaklady), "Pula zakladow ~r~$%d", ObiektInfo[uid_stolu][gPokerInfo][1]);
				PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]], zaklady);
			}
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],Poker1[ObiektInfo[uid_stolu][objPoker][i]]);
			if(ObiektInfo[uid_stolu][gAktualniGracze][0] == ObiektInfo[uid_stolu][objPoker][i] || ObiektInfo[uid_stolu][gAktualniGracze][1] == ObiektInfo[uid_stolu][objPoker][i] || ObiektInfo[uid_stolu][gAktualniGracze][2] == ObiektInfo[uid_stolu][objPoker][i]
			|| ObiektInfo[uid_stolu][gAktualniGracze][3] == ObiektInfo[uid_stolu][objPoker][i] || ObiektInfo[uid_stolu][gAktualniGracze][4] == ObiektInfo[uid_stolu][objPoker][i] || ObiektInfo[uid_stolu][gAktualniGracze][5] == ObiektInfo[uid_stolu][objPoker][i])
			{
				PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza[ObiektInfo[uid_stolu][objPoker][i]]);
			}
			//PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],KartyGracza[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
			PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
			Streamer_Update(ObiektInfo[uid_stolu][objPoker][i]);
		}
	}
}

stock OdswiesBarGracza(playerid, uid_stolu, Float:wartosc)
{
	for(new i = 0; i < 6; i++)
		{
			if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
			{
				UsunBaryGracz(ObiektInfo[uid_stolu][objPoker][i]);
				switch(DaneGracza[playerid][gPokerStanowisko])
				{
					case 0:{
						SetProgressBarValue(Bar:KartyGracza111[ObiektInfo[uid_stolu][objPoker][i]], wartosc);
						ShowProgressBarForPlayer(ObiektInfo[uid_stolu][objPoker][i], KartyGracza111[ObiektInfo[uid_stolu][objPoker][i]]);
					}
					case 1:{
						SetProgressBarValue(Bar:KartyGracza222[ObiektInfo[uid_stolu][objPoker][i]], wartosc);
						ShowProgressBarForPlayer(ObiektInfo[uid_stolu][objPoker][i], KartyGracza222[ObiektInfo[uid_stolu][objPoker][i]]);
					}
					case 2:{
						SetProgressBarValue(Bar:KartyGracza333[ObiektInfo[uid_stolu][objPoker][i]], wartosc);
						ShowProgressBarForPlayer(ObiektInfo[uid_stolu][objPoker][i], KartyGracza333[ObiektInfo[uid_stolu][objPoker][i]]);
					}
					case 3:{
						SetProgressBarValue(Bar:KartyGracza444[ObiektInfo[uid_stolu][objPoker][i]], wartosc);
						ShowProgressBarForPlayer(ObiektInfo[uid_stolu][objPoker][i], KartyGracza444[ObiektInfo[uid_stolu][objPoker][i]]);
					}
					case 4:{
						SetProgressBarValue(Bar:KartyGracza555[ObiektInfo[uid_stolu][objPoker][i]], wartosc);
						ShowProgressBarForPlayer(ObiektInfo[uid_stolu][objPoker][i], KartyGracza555[ObiektInfo[uid_stolu][objPoker][i]]);
					}
					case 5:{
						SetProgressBarValue(Bar:KartyGracza666[ObiektInfo[uid_stolu][objPoker][i]], wartosc);
						ShowProgressBarForPlayer(ObiektInfo[uid_stolu][objPoker][i], KartyGracza666[ObiektInfo[uid_stolu][objPoker][i]]);
					}
				}
			}
		}
}

stock UsunBaryGracz(playerid)
{
	HideProgressBarForPlayer(playerid, KartyGracza111[playerid]);
	HideProgressBarForPlayer(playerid, KartyGracza222[playerid]);
	HideProgressBarForPlayer(playerid, KartyGracza333[playerid]);
	HideProgressBarForPlayer(playerid, KartyGracza444[playerid]);
	HideProgressBarForPlayer(playerid, KartyGracza555[playerid]);
	HideProgressBarForPlayer(playerid, KartyGracza666[playerid]);
}

stock SprawdzKolejGracza(playerid)
{
	new ilosc_nie_all = SprawdzNieAllinow(DaneGracza[playerid][gPoker]);
	if(playerid == ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] || ilosc_nie_all < 1)
	{
		ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][15] = 0;
		switch(ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker])
		{
			case 1:{
				ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker] = 2;
			}
			case 2:{
				ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker] = 3;
			}
			case 3:{
				ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker] = 4;
			}
			case 4:{
				PorownajKarty(DaneGracza[playerid][gPoker]);
				ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker] = 1;
			}
		}
		if(ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker] != 1)
		{
			new ilosc_nie = SprawdzNieAllinow(DaneGracza[playerid][gPoker]);
			if(ilosc_nie < 2)
			{
				new uid_stolu = DaneGracza[playerid][gPoker];
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
					{
						new karta1[54], karta2[54], karta3[54], karta4[54], karta5[54];
						karta1 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][6]);
						karta2 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][7]);
						karta3 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][8]);
						karta4 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][9]);
						karta5 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][10]);
						PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]], karta1);
						PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]], karta2);
						PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]], karta3);
						PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]], karta4);
						PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]], karta5);
						PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
						PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
					}
				}
				PorownajKarty(DaneGracza[playerid][gPoker]);
				ObiektInfo[DaneGracza[playerid][gPoker]][gRundaPoker] = 1;
			}
			else
			{
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][i] != -1)
					{
						RozpocznijPokera(ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][i], DaneGracza[playerid][gPoker]);
					}
				}
			}
		}
	}
	else
	{
		new kolejny = SprawdzKolejnego(DaneGracza[playerid][gPokerStanowisko]);
		new kolejny2 = DaneGracza[playerid][gPokerStanowisko];
		for(new i = 0; i < 6; i++)
		{
			if(ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][kolejny] == -1  || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][kolejny]][gInformacjePoker][0] == 1)
			{
				switch(kolejny2)
				{
					case 0:{
						kolejny2 = 4;
					}
					case 1:{
						kolejny2 = 5;
					}
					case 2:{
						kolejny2 = 0;
					}
					case 3:{
						kolejny2 = 1;
					}
					case 4:{
						kolejny2 = 3;
					}
					case 5:{
						kolejny2 = 2;
					}
				}
				kolejny = SprawdzKolejnego(kolejny2);
			}
		}
		new id_kolejnego1 = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][kolejny];
		if(DaneGracza[id_kolejnego1][gPokerPostawione] == ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13])
		{
			PlayerTextDrawSetString(id_kolejnego1, Poker3[id_kolejnego1], "Czekam");
			PlayerTextDrawSetString(id_kolejnego1, Poker4[id_kolejnego1], "Stawiam zaklad");
		}
		else
		{
			PlayerTextDrawSetString(id_kolejnego1, Poker3[id_kolejnego1], "Sprawdzam");
			PlayerTextDrawSetString(id_kolejnego1, Poker4[id_kolejnego1], "Przebijam");
		}
		new id_kolejnego = 0;
		switch(kolejny)
		{
			case 0:{
				id_kolejnego = ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][0];
				WybralMozliwoscPoker[id_kolejnego] = 60;
			}
			case 1:{
				id_kolejnego = ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][1];
				WybralMozliwoscPoker[id_kolejnego] = 60;
			}
			case 2:{
				id_kolejnego = ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][2];
				WybralMozliwoscPoker[id_kolejnego] = 60;
			}
			case 3:{
				id_kolejnego = ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][3];
				WybralMozliwoscPoker[id_kolejnego] = 60;
			}
			case 4:{
				id_kolejnego = ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][4];
				WybralMozliwoscPoker[id_kolejnego] = 60;
			}
			case 5:{
				id_kolejnego = ObiektInfo[DaneGracza[playerid][gPoker]][objPoker][5];
				WybralMozliwoscPoker[id_kolejnego] = 60;
			}
		}
		PlayerTextDrawShow(id_kolejnego,Poker2[id_kolejnego]);
		PlayerTextDrawShow(id_kolejnego,Poker3[id_kolejnego]);
		PlayerTextDrawShow(id_kolejnego,Poker4[id_kolejnego]);
		PlayerTextDrawShow(id_kolejnego,Poker5[id_kolejnego]);
		PlayerTextDrawShow(id_kolejnego,Poker6[id_kolejnego]);
		SelectTextDraw(id_kolejnego, 0xFFFFFFFF);
	}
	return 1;
}

stock SortujTablice(array[], left, right)
{
    new
        tempLeft = left,
        tempRight = right,
        pivot = array[(left + right) / 2],
        tempVar
    ;
    while(tempLeft <= tempRight)
    {
        while(array[tempLeft] < pivot) tempLeft++;
        while(array[tempRight] > pivot) tempRight--;

        if(tempLeft <= tempRight)
        {
            tempVar = array[tempLeft], array[tempLeft] = array[tempRight], array[tempRight] = tempVar;
            tempLeft++, tempRight--;
        }
    }
    if(left < tempRight) SortujTablice(array, left, tempRight);
    if(tempLeft < right) SortujTablice(array, tempLeft, right);
}

stock SprawdzUklad(id_gracza, uid_stolu)
{
	new karty[7], kartystrit[7], uklad = 0, poprawnosc[40];
	karty[0] = ObiektInfo[uid_stolu][gPokerInfo][6];
	karty[1] = ObiektInfo[uid_stolu][gPokerInfo][7];
	karty[2] = ObiektInfo[uid_stolu][gPokerInfo][8];
	karty[3] = ObiektInfo[uid_stolu][gPokerInfo][9];
	karty[4] = ObiektInfo[uid_stolu][gPokerInfo][10];
	karty[5] = DaneGracza[id_gracza][gPokerKarty][0];
	karty[6] = DaneGracza[id_gracza][gPokerKarty][1];
	for(new i = 0; i < 7; i++)
	{
		switch(karty[i])
		{
			case 1:{
				poprawnosc[0] += 1;
				poprawnosc[36] += 1;
			}
			case 2:{
				poprawnosc[1] += 1;
				poprawnosc[37] += 1;
			}
			case 3:{
				poprawnosc[2] += 1;
				poprawnosc[38] += 1;
			}
			case 4:{
				poprawnosc[3] += 1;
				poprawnosc[39] += 1;
			}
			case 5:{
				poprawnosc[32] += 1;
				poprawnosc[36] += 1;
			}
			case 6:{
				poprawnosc[33] += 1;
				poprawnosc[37] += 1;
			}
			case 7:{
				poprawnosc[34] += 1;
				poprawnosc[38] += 1;
			}
			case 8:{
				poprawnosc[35] += 1;
				poprawnosc[39] += 1;
			}
			case 9:{
				poprawnosc[28] += 1;
				poprawnosc[32] += 1;
				poprawnosc[36] += 1;
			}
			case 10:{
				poprawnosc[29] += 1;
				poprawnosc[33] += 1;
				poprawnosc[37] += 1;
			}
			case 11:{
				poprawnosc[30] += 1;
				poprawnosc[34] += 1;
				poprawnosc[38] += 1;
			}
			case 12:{
				poprawnosc[31] += 1;
				poprawnosc[35] += 1;
				poprawnosc[39] += 1;
			}
			case 13:{
				poprawnosc[24] += 1;
				poprawnosc[28] += 1;
				poprawnosc[32] += 1;
				poprawnosc[36] += 1;
			}
			case 14:{
				poprawnosc[25] += 1;
				poprawnosc[29] += 1;
				poprawnosc[33] += 1;
				poprawnosc[37] += 1;
			}
			case 15:{
				poprawnosc[26] += 1;
				poprawnosc[30] += 1;
				poprawnosc[34] += 1;
				poprawnosc[38] += 1;
			}
			case 16:{
				poprawnosc[27] += 1;
				poprawnosc[31] += 1;
				poprawnosc[35] += 1;
				poprawnosc[39] += 1;
			}
			case 17:{
				poprawnosc[20] += 1;
				poprawnosc[24] += 1;
				poprawnosc[28] += 1;
				poprawnosc[32] += 1;
				poprawnosc[36] += 1;
			}
			case 18:{
				poprawnosc[21] += 1;
				poprawnosc[25] += 1;
				poprawnosc[29] += 1;
				poprawnosc[33] += 1;
				poprawnosc[37] += 1;
			}
			case 19:{
				poprawnosc[22] += 1;
				poprawnosc[26] += 1;
				poprawnosc[30] += 1;
				poprawnosc[34] += 1;
				poprawnosc[38] += 1;
			}
			case 20:{
				poprawnosc[23] += 1;
				poprawnosc[27] += 1;
				poprawnosc[31] += 1;
				poprawnosc[35] += 1;
				poprawnosc[39] += 1;
			}
			case 21:{
				poprawnosc[16] += 1;
				poprawnosc[20] += 1;
				poprawnosc[24] += 1;
				poprawnosc[28] += 1;
				poprawnosc[32] += 1;
			}
			case 22:{
				poprawnosc[17] += 1;
				poprawnosc[21] += 1;
				poprawnosc[25] += 1;
				poprawnosc[29] += 1;
				poprawnosc[33] += 1;
			}
			case 23:{
				poprawnosc[18] += 1;
				poprawnosc[22] += 1;
				poprawnosc[26] += 1;
				poprawnosc[30] += 1;
				poprawnosc[34] += 1;
			}
			case 24:{
				poprawnosc[19] += 1;
				poprawnosc[23] += 1;
				poprawnosc[27] += 1;
				poprawnosc[31] += 1;
				poprawnosc[35] += 1;
			}
			case 25:{
				poprawnosc[12] += 1;
				poprawnosc[16] += 1;
				poprawnosc[20] += 1;
				poprawnosc[24] += 1;
				poprawnosc[28] += 1;
			}
			case 26:{
				poprawnosc[13] += 1;
				poprawnosc[17] += 1;
				poprawnosc[21] += 1;
				poprawnosc[25] += 1;
				poprawnosc[29] += 1;
			}
			case 27:{
				poprawnosc[14] += 1;
				poprawnosc[18] += 1;
				poprawnosc[22] += 1;
				poprawnosc[26] += 1;
				poprawnosc[30] += 1;
			}
			case 28:{
				poprawnosc[15] += 1;
				poprawnosc[19] += 1;
				poprawnosc[23] += 1;
				poprawnosc[27] += 1;
				poprawnosc[31] += 1;
			}
			case 29:{
				poprawnosc[8] += 1;
				poprawnosc[12] += 1;
				poprawnosc[16] += 1;
				poprawnosc[20] += 1;
				poprawnosc[24] += 1;
			}
			case 30:{
				poprawnosc[13] += 1;
				poprawnosc[17] += 1;
				poprawnosc[21] += 1;
				poprawnosc[25] += 1;
			}
			case 31:{
				poprawnosc[14] += 1;
				poprawnosc[18] += 1;
				poprawnosc[22] += 1;
				poprawnosc[26] += 1;
			}
			case 32:{
				poprawnosc[15] += 1;
				poprawnosc[19] += 1;
				poprawnosc[23] += 1;
				poprawnosc[27] += 1;
			}
			case 33:{
				poprawnosc[4] += 1;
				poprawnosc[8] += 1;
				poprawnosc[12] += 1;
				poprawnosc[16] += 1;
				poprawnosc[20] += 1;
			}
			case 34:{
				poprawnosc[5] += 1;
				poprawnosc[9] += 1;
				poprawnosc[13] += 1;
				poprawnosc[17] += 1;
				poprawnosc[21] += 1;
			}
			case 35:{
				poprawnosc[6] += 1;
				poprawnosc[10] += 1;
				poprawnosc[14] += 1;
				poprawnosc[18] += 1;
				poprawnosc[22] += 1;
			}
			case 36:{
				poprawnosc[7] += 1;
				poprawnosc[11] += 1;
				poprawnosc[15] += 1;
				poprawnosc[19] += 1;
				poprawnosc[23] += 1;
			}
			case 37:{
				poprawnosc[0] += 1;
				poprawnosc[4] += 1;
				poprawnosc[8] += 1;
				poprawnosc[12] += 1;
				poprawnosc[16] += 1;
			}
			case 38:{
				poprawnosc[1] += 1;
				poprawnosc[5] += 1;
				poprawnosc[9] += 1;
				poprawnosc[13] += 1;
				poprawnosc[17] += 1;
			}
			case 39:{
				poprawnosc[2] += 1;
				poprawnosc[6] += 1;
				poprawnosc[10] += 1;
				poprawnosc[14] += 1;
				poprawnosc[18] += 1;
			}
			case 40:{
				poprawnosc[3] += 1;
				poprawnosc[7] += 1;
				poprawnosc[11] += 1;
				poprawnosc[15] += 1;
				poprawnosc[19] += 1;
			}
			case 41:{
				poprawnosc[0] += 1;
				poprawnosc[4] += 1;
				poprawnosc[8] += 1;
				poprawnosc[12] += 1;

			}
			case 42:{
				poprawnosc[1] += 1;
				poprawnosc[5] += 1;
				poprawnosc[9] += 1;
				poprawnosc[13] += 1;
			}
			case 43:{
				poprawnosc[2] += 1;
				poprawnosc[6] += 1;
				poprawnosc[10] += 1;
				poprawnosc[14] += 1;
			}
			case 44:{
				poprawnosc[3] += 1;
				poprawnosc[7] += 1;
				poprawnosc[11] += 1;
				poprawnosc[15] += 1;
			}
			case 45:{
				poprawnosc[0] += 1;
				poprawnosc[4] += 1;
				poprawnosc[8] += 1;
			}
			case 46:{
				poprawnosc[1] += 1;
				poprawnosc[5] += 1;
				poprawnosc[9] += 1;
			}
			case 47:{
				poprawnosc[2] += 1;
				poprawnosc[6] += 1;
				poprawnosc[10] += 1;
			}
			case 48:{
				poprawnosc[3] += 1;
				poprawnosc[7] += 1;
				poprawnosc[11] += 1;
			}
			case 49:{
				poprawnosc[0] += 1;
				poprawnosc[4] += 1;
			}
			case 50:{
				poprawnosc[1] += 1;
				poprawnosc[5] += 1;
			}
			case 51:{
				poprawnosc[2] += 1;
				poprawnosc[6] += 1;
			}
			case 52:{
				poprawnosc[3] += 1;
				poprawnosc[7] += 1;
			}
		}
	}
	if(poprawnosc[36] == 5 || poprawnosc[37] == 5 || poprawnosc[38] == 5 || poprawnosc[39] == 5)
	{
		uklad = 10;//Poker od Piatki
	}
	if(poprawnosc[32] == 5 || poprawnosc[33] == 5 || poprawnosc[34] == 5 || poprawnosc[35] == 5)
	{
		uklad = 9;//Poker od Szóstki
	}
	if(poprawnosc[28] == 5 || poprawnosc[29] == 5 || poprawnosc[30] == 5 || poprawnosc[31] == 5)
	{
		uklad = 8;//Poker od Siódemki
	}
	if(poprawnosc[24] == 5 || poprawnosc[25] == 5 || poprawnosc[26] == 5 || poprawnosc[27] == 5)
	{
		uklad = 7;//Poker od Osemki
	}
	if(poprawnosc[20] == 5 || poprawnosc[21] == 5 || poprawnosc[22] == 5 || poprawnosc[23] == 5)
	{
		uklad = 6;//Poker od Dziewi¹tki
	}
	if(poprawnosc[16] == 5 || poprawnosc[17] == 5 || poprawnosc[18] == 5 || poprawnosc[19] == 5)
	{
		uklad = 5;//Poker od Dziesi¹tki
	}
	if(poprawnosc[12] == 5 || poprawnosc[13] == 5 || poprawnosc[14] == 5 || poprawnosc[15] == 5)
	{
		uklad = 4;//Poker od Waleta
	}
	if(poprawnosc[8] == 5 || poprawnosc[9] == 5 || poprawnosc[10] == 5 || poprawnosc[11] == 5)
	{
		uklad = 3;//Poker od damy
	}
	if(poprawnosc[4] == 5 || poprawnosc[5] == 5 || poprawnosc[6] == 5 || poprawnosc[7] == 5)
	{
		uklad = 2;//Poker od króla
	}
	if(poprawnosc[0] == 5 || poprawnosc[1] == 5 || poprawnosc[2] == 5 || poprawnosc[3] == 5)
	{
		uklad = 1;//Poker Krolewski
	}
	if(uklad == 0)
	{
		new karty2[7];
		karty2[0] = karty[0];
		karty2[1] = karty[1];
		karty2[2] = karty[2];
		karty2[3] = karty[3];
		karty2[4] = karty[4];
		karty2[5] = karty[5];
		karty2[6] = karty[6];
		for(new i = 0; i < 7; i++)
		{
			switch(karty[i])
			{
				case 1,2,3,4:{
					karty[i] = 14;
				}
				case 5,6,7,8:{
					karty[i] = 2;
				}
				case 9,10,11,12:{
					karty[i] = 3;
				}
				case 13,14,15,16:{
					karty[i] = 4;
				}
				case 17,18,19,20:{
					karty[i] = 5;
				}
				case 21,22,23,24:{
					karty[i] = 6;
				}
				case 25,26,27,28:{
					karty[i] = 7;
				}
				case 29,30,31,32:{
					karty[i] = 8;
				}
				case 33,34,35,36:{
					karty[i] = 9;
				}
				case 37,38,39,40:{
					karty[i] = 10;
				}
				case 41,42,43,44:{
					karty[i] = 11;
				}
				case 45,46,47,48:{
					karty[i] = 12;
				}
				case 49,50,51,52:{
					karty[i] = 13;
				}
			}
		}
		for(new i = 0; i < 7; i++)
		{
			switch(karty2[i])
			{
				case 1,5,9,13,17,21,25,29,33,37,41,45,49:{
					karty2[i] = 1;
				}
				case 2,6,10,14,18,22,26,30,34,38,42,46,50:{
					karty2[i] = 2;
				}
				case 3,7,11,15,19,23,27,31,35,39,43,47,51:{
					karty2[i] = 3;
				}
				case 4,8,12,16,20,24,28,32,36,40,44,48,52:{
					karty2[i] = 4;
				}
			}
		}
		kartystrit[0] = karty[0];
		kartystrit[1] = karty[1];
		kartystrit[2] = karty[2];
		kartystrit[3] = karty[3];
		kartystrit[4] = karty[4];
		kartystrit[5] = karty[5];
		kartystrit[6] = karty[6];
		new ilosc[14], kolor[4], karta_kolor1[7], nrkar1, karta_kolor2[7], nrkar2, karta_kolor3[7], nrkar3, karta_kolor4[7], nrkar4;
		for(new i = 0; i < 7; i++)
		{
			if(kartystrit[i] == kartystrit[0] && i != 0 || kartystrit[i] == kartystrit[1] && i != 1 || kartystrit[i] == kartystrit[2] && i != 2 || kartystrit[i] == kartystrit[3] && i != 3 || kartystrit[i] == kartystrit[4] && i != 4 || kartystrit[i] == kartystrit[5] && i != 5 || kartystrit[i] == kartystrit[6] && i != 6)
			{
				kartystrit[i] = 0;
			}
			if(karty[i] == 1)
			{
				ilosc[0]++;
			}
			else if(karty[i] == 2)
			{
				ilosc[1]++;
			}
			else if(karty[i] == 3)
			{
				ilosc[2]++;
			}
			else if(karty[i] == 4)
			{
				ilosc[3]++;
			}
			else if(karty[i] == 5)
			{
				ilosc[4]++;
			}
			else if(karty[i] == 6)
			{
				ilosc[5]++;
			}
			else if(karty[i] == 7)
			{
				ilosc[6]++;
			}
			else if(karty[i] == 8)
			{
				ilosc[7]++;
			}
			else if(karty[i] == 9)
			{
				ilosc[8]++;
			}
			else if(karty[i] == 10)
			{
				ilosc[9]++;
			}
			else if(karty[i] == 11)
			{
				ilosc[10]++;
			}
			else if(karty[i] == 12)
			{
				ilosc[11]++;
			}
			else if(karty[i] == 13)
			{
				ilosc[12]++;
			}
			else if(karty[i] == 14)
			{
				ilosc[13]++;
			}
			if(karty2[i] == 1)
			{
				kolor[0]++;
				karta_kolor1[nrkar1] = karty[i];
				nrkar1++;
			}
			else if(karty2[i] == 2)
			{
				kolor[1]++;
				karta_kolor2[nrkar2] = karty[i];
				nrkar2++;
			}
			else if(karty2[i] == 3)
			{
				kolor[2]++;
				karta_kolor3[nrkar3] = karty[i];
				nrkar3++;
			}
			else if(karty2[i] == 4)
			{
				kolor[3]++;
				karta_kolor4[nrkar4] = karty[i];
				nrkar3++;
			}
		}
		new cztery = 0, trzy[2], dwie[3], jedna[7], nrt = 0, nrd = 0, nrj = 0;
		for(new i = 0; i < 14; i++)
		{
			if(ilosc[i] != 0)
			{
				if(ilosc[i] == 4)
				{
					new d = i+1;
					cztery = d;
				}
				else if(ilosc[i] == 3)
				{
					new d = i+1;
					trzy[nrt] = d;
					nrt++;
				}
				else if(ilosc[i] == 2)
				{
					new d = i+1;
					dwie[nrd] = d;
					nrd++;
				}
				else
				{
					new d = i+1;
					jedna[nrj] = d;
					nrj++;
				}
			}
		}
		if(cztery != 0)
		{
			new reszta[3], nrr = 0, najwyzsza = 0;
			if(trzy[0] != 0)
			{
				for(new i = 0; i < 3; i++)
				{
					reszta[nrr] = trzy[0];
					nrr++;
				}
			}
			if(dwie[0] != 0)
			{
				for(new i = 0; i < 2; i++)
				{
					reszta[nrr] = dwie[0];
					nrr++;
				}
			}
			if(jedna[0] != 0)
			{
				reszta[nrr] = jedna[0];
				nrr++;
			}
			if(jedna[1] != 0)
			{
				reszta[nrr] = jedna[1];
				nrr++;
			}
			if(jedna[2] != 0)
			{
				reszta[nrr] = jedna[2];
				nrr++;
			}
			for(new i = 0; i < 3; i++)
			{
				if(reszta[i] > najwyzsza)
				{
					najwyzsza = reszta[i];
				}
			}
			DaneGracza[id_gracza][gInformacjePoker][1] = cztery;//Twoje piec najmocniejszych kart
			DaneGracza[id_gracza][gInformacjePoker][2] = cztery;
			DaneGracza[id_gracza][gInformacjePoker][3] = cztery;
			DaneGracza[id_gracza][gInformacjePoker][4] = cztery;
			DaneGracza[id_gracza][gInformacjePoker][5] = najwyzsza;
			uklad = 11;
		}
		else if(trzy[0] != 0)
		{
			if(trzy[1] != 0)
			{
				DaneGracza[id_gracza][gInformacjePoker][4] = trzy[1];
				DaneGracza[id_gracza][gInformacjePoker][5] = trzy[1];
				uklad = 12;
			}
			else if(dwie[0] != 0)
			{
				DaneGracza[id_gracza][gInformacjePoker][4] = dwie[0];
				DaneGracza[id_gracza][gInformacjePoker][5] = dwie[0];
				uklad = 12;
			}
			else if(dwie[1] != 0)
			{
				if(dwie[1] > dwie[0])
				{
					DaneGracza[id_gracza][gInformacjePoker][4] = dwie[1];
					DaneGracza[id_gracza][gInformacjePoker][5] = dwie[1];
				}
				else
				{
					DaneGracza[id_gracza][gInformacjePoker][4] = dwie[0];
					DaneGracza[id_gracza][gInformacjePoker][5] = dwie[0];
				}
				uklad = 12;
			}
			else
			{
				new karta1 = 0, karta2 = 0;
				for(new i = 0; i < 3; i++)
				{
					if(jedna[i] > karta1)
					{
						karta1 = jedna[i];
					}
				}
				for(new i = 0; i < 3; i++)
				{
					if(jedna[i] > karta2 && jedna[i] != karta1)
					{
						karta2 = jedna[i];
					}
				}
				DaneGracza[id_gracza][gInformacjePoker][4] = karta1;
				DaneGracza[id_gracza][gInformacjePoker][5] = karta2;
				uklad = 15;
			}
			DaneGracza[id_gracza][gInformacjePoker][1] = trzy[0];
			DaneGracza[id_gracza][gInformacjePoker][2] = trzy[0];
			DaneGracza[id_gracza][gInformacjePoker][3] = trzy[0];
		}
		else if(dwie[0] != 0)
		{
			new najslabsza = 13;
			if(dwie[2] != 0)
			{
				for(new i = 0; i < 3; i++)
				{
					if(dwie[i] < najslabsza)
					{
						najslabsza = dwie[i];
					}
				}
				new nr1 = 1, nr2 = 2;
				for(new i = 0; i < 3; i++)
				{
					if(dwie[i] != najslabsza)
					{
						DaneGracza[id_gracza][gInformacjePoker][nr1] = dwie[i];
						DaneGracza[id_gracza][gInformacjePoker][nr2] = dwie[i];
						nr1+=2;
						nr2+=2;
					}
				}
				new wszystkie[3], nrw = 0;
				for(new i = 0; i < 3; i++)
				{
					if(dwie[i] == najslabsza)
					{
						for(new j = 0; j < 2; j++)
						{
							wszystkie[nrw] = dwie[i];
						}
					}
				}
				wszystkie[2] = jedna[0];
				new najsilniejsza = 0;
				for(new i = 0; i < 3; i++)
				{
					if(wszystkie[i] > najsilniejsza)
					{
						najsilniejsza = wszystkie[i];
					}
				}
				DaneGracza[id_gracza][gInformacjePoker][5] = najsilniejsza;
				uklad = 16;
			}
			else if(dwie[1] != 0)
			{
				new najsilniejsza = 0;
				DaneGracza[id_gracza][gInformacjePoker][1] = dwie[0];
				DaneGracza[id_gracza][gInformacjePoker][2] = dwie[0];
				DaneGracza[id_gracza][gInformacjePoker][3] = dwie[1];
				DaneGracza[id_gracza][gInformacjePoker][4] = dwie[1];
				for(new i = 0; i < 3; i++)
				{
					if(jedna[i] > najsilniejsza)
					{
						najsilniejsza = jedna[i];
					}
				}
				DaneGracza[id_gracza][gInformacjePoker][5] = najsilniejsza;
				uklad = 16;
			}
			else
			{
				new karta1 = 0, karta2 = 0, karta3 = 0;
				DaneGracza[id_gracza][gInformacjePoker][1] = dwie[0];
				DaneGracza[id_gracza][gInformacjePoker][2] = dwie[0];
				for(new i = 0; i < 5; i++)
				{
					if(jedna[i] > karta1)
					{
						karta1 = jedna[i];
					}
				}
				for(new i = 0; i < 5; i++)
				{
					if(jedna[i] > karta2 && jedna[i] != karta1)
					{
						karta2 = jedna[i];
					}
				}
				for(new i = 0; i < 5; i++)
				{
					if(jedna[i] > karta3 && jedna[i] != karta1 && jedna[i] != karta2)
					{
						karta3 = jedna[i];
					}
				}
				DaneGracza[id_gracza][gInformacjePoker][3] = karta1;
				DaneGracza[id_gracza][gInformacjePoker][4] = karta2;
				DaneGracza[id_gracza][gInformacjePoker][5] = karta3;
				uklad = 17;
			}
		}
		if(uklad > 12 || uklad == 0)
		{
			new kolorka = 0;
			SortujTablice(karta_kolor1, 0, 6);
			if(kolor[0] >= 5)
			{
				kolorka = 1;
				uklad = 13;
				DaneGracza[id_gracza][gInformacjePoker][1] = karta_kolor1[0];
				DaneGracza[id_gracza][gInformacjePoker][2] = karta_kolor1[1];
				DaneGracza[id_gracza][gInformacjePoker][3] = karta_kolor1[2];
				DaneGracza[id_gracza][gInformacjePoker][4] = karta_kolor1[3];
				DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor1[4];
				if(kolor[0] > 5)
				{
					for(new sprawdz = 5; sprawdz < kolor[0]; sprawdz++)
					{
						if(karta_kolor1[sprawdz] > karta_kolor1[4])
						{
							DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor1[sprawdz];
						}
					}
				}
			}
			else if(kolor[1] >= 5)
			{
				kolorka = 1;
				uklad = 13;
				DaneGracza[id_gracza][gInformacjePoker][1] = karta_kolor2[0];
				DaneGracza[id_gracza][gInformacjePoker][2] = karta_kolor2[1];
				DaneGracza[id_gracza][gInformacjePoker][3] = karta_kolor2[2];
				DaneGracza[id_gracza][gInformacjePoker][4] = karta_kolor2[3];
				DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor2[4];
				if(kolor[1] > 5)
				{
					for(new sprawdz = 5; sprawdz < kolor[1]; sprawdz++)
					{
						if(karta_kolor2[sprawdz] > karta_kolor2[4])
						{
							DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor2[sprawdz];
						}
					}
				}
			}
			else if(kolor[2] >= 5)
			{
				kolorka = 1;
				uklad = 13;
				DaneGracza[id_gracza][gInformacjePoker][1] = karta_kolor3[0];
				DaneGracza[id_gracza][gInformacjePoker][2] = karta_kolor3[1];
				DaneGracza[id_gracza][gInformacjePoker][3] = karta_kolor3[2];
				DaneGracza[id_gracza][gInformacjePoker][4] = karta_kolor3[3];
				DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor3[4];
				if(kolor[2] > 5)
				{
					for(new sprawdz = 5; sprawdz < kolor[2]; sprawdz++)
					{
						if(karta_kolor3[sprawdz] > karta_kolor3[4])
						{
							DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor3[sprawdz];
						}
					}
				}
			}
			else if(kolor[3] >= 5)
			{
				kolorka = 1;
				uklad = 13;
				DaneGracza[id_gracza][gInformacjePoker][1] = karta_kolor4[0];
				DaneGracza[id_gracza][gInformacjePoker][2] = karta_kolor4[1];
				DaneGracza[id_gracza][gInformacjePoker][3] = karta_kolor4[2];
				DaneGracza[id_gracza][gInformacjePoker][4] = karta_kolor4[3];
				DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor4[4];
				if(kolor[3] > 5)
				{
					for(new sprawdz = 5; sprawdz < kolor[3]; sprawdz++)
					{
						if(karta_kolor4[sprawdz] > karta_kolor4[4])
						{
							DaneGracza[id_gracza][gInformacjePoker][5] = karta_kolor4[sprawdz];
						}
					}
				}
			}
			if(kolorka != 1)
			{
				new strit = 0;
				new kolejnosc[7];
				kolejnosc[0]= kartystrit[0];
				kolejnosc[1]= kartystrit[1];
				kolejnosc[2]= kartystrit[2];
				kolejnosc[3]= kartystrit[3];
				kolejnosc[4]= kartystrit[4];
				kolejnosc[5]= kartystrit[5];
				kolejnosc[6]= kartystrit[6];
				SortujTablice(kolejnosc, 0, 6);
				if(kolejnosc[0] + 1 == kolejnosc[1] && kolejnosc[1] + 1 == kolejnosc[2] && kolejnosc[2] + 1 == kolejnosc[3] && kolejnosc[3] + 1 == kolejnosc[4])
				{
					uklad = 14;
					strit = 1;
					DaneGracza[id_gracza][gInformacjePoker][1] = kolejnosc[0];
					DaneGracza[id_gracza][gInformacjePoker][2] = kolejnosc[1];
					DaneGracza[id_gracza][gInformacjePoker][3] = kolejnosc[2];
					DaneGracza[id_gracza][gInformacjePoker][4] = kolejnosc[3];
					DaneGracza[id_gracza][gInformacjePoker][5] = kolejnosc[4];
				}
				else if(kolejnosc[1] + 1 == kolejnosc[2] && kolejnosc[2] + 1 == kolejnosc[3] && kolejnosc[3] + 1 == kolejnosc[4] && kolejnosc[4] + 1 == kolejnosc[5])
				{
					uklad = 14;
					strit = 1;
					DaneGracza[id_gracza][gInformacjePoker][1] = kolejnosc[1];
					DaneGracza[id_gracza][gInformacjePoker][2] = kolejnosc[2];
					DaneGracza[id_gracza][gInformacjePoker][3] = kolejnosc[3];
					DaneGracza[id_gracza][gInformacjePoker][4] = kolejnosc[4];
					DaneGracza[id_gracza][gInformacjePoker][5] = kolejnosc[5];
				}
				else if(kolejnosc[2] + 1 == kolejnosc[3] && kolejnosc[3] + 1 == kolejnosc[4] && kolejnosc[4] + 1 == kolejnosc[5] && kolejnosc[5] + 1 == kolejnosc[6])
				{
					uklad = 14;
					strit = 1;
					DaneGracza[id_gracza][gInformacjePoker][1] = kolejnosc[2];
					DaneGracza[id_gracza][gInformacjePoker][2] = kolejnosc[3];
					DaneGracza[id_gracza][gInformacjePoker][3] = kolejnosc[4];
					DaneGracza[id_gracza][gInformacjePoker][4] = kolejnosc[5];
					DaneGracza[id_gracza][gInformacjePoker][5] = kolejnosc[6];
				}
				if(strit != 1)
				{
					for(new i = 0; i < 7; i++)
					{
						if(kolejnosc[i] == 13)
						{
							kolejnosc[i] = 1;
						}
					}
					if(kolejnosc[0] + 1 == kolejnosc[1] && kolejnosc[1] + 1 == kolejnosc[2] && kolejnosc[2] + 1 == kolejnosc[3] && kolejnosc[3] + 1 == kolejnosc[4])
					{
						uklad = 14;
						strit = 1;
						DaneGracza[id_gracza][gInformacjePoker][1] = kolejnosc[0];
						DaneGracza[id_gracza][gInformacjePoker][2] = kolejnosc[1];
						DaneGracza[id_gracza][gInformacjePoker][3] = kolejnosc[2];
						DaneGracza[id_gracza][gInformacjePoker][4] = kolejnosc[3];
						DaneGracza[id_gracza][gInformacjePoker][5] = kolejnosc[4];
					}
					else if(kolejnosc[1] + 1 == kolejnosc[2] && kolejnosc[2] + 1 == kolejnosc[3] && kolejnosc[3] + 1 == kolejnosc[4] && kolejnosc[4] + 1 == kolejnosc[5])
					{
						uklad = 14;
						strit = 1;
						DaneGracza[id_gracza][gInformacjePoker][1] = kolejnosc[1];
						DaneGracza[id_gracza][gInformacjePoker][2] = kolejnosc[2];
						DaneGracza[id_gracza][gInformacjePoker][3] = kolejnosc[3];
						DaneGracza[id_gracza][gInformacjePoker][4] = kolejnosc[4];
						DaneGracza[id_gracza][gInformacjePoker][5] = kolejnosc[5];
					}
					else if(kolejnosc[2] + 1 == kolejnosc[3] && kolejnosc[3] + 1 == kolejnosc[4] && kolejnosc[4] + 1 == kolejnosc[5] && kolejnosc[5] + 1 == kolejnosc[6])
					{
						uklad = 14;
						strit = 1;
						DaneGracza[id_gracza][gInformacjePoker][1] = kolejnosc[2];
						DaneGracza[id_gracza][gInformacjePoker][2] = kolejnosc[3];
						DaneGracza[id_gracza][gInformacjePoker][3] = kolejnosc[4];
						DaneGracza[id_gracza][gInformacjePoker][4] = kolejnosc[5];
						DaneGracza[id_gracza][gInformacjePoker][5] = kolejnosc[6];
					}
					if(uklad == 0)
					{
						new karta1 = 0, karta2 = 0, karta3 = 0, karta4 = 0, karta5 = 0;
						for(new i = 0; i < 7; i++)
						{
							if(jedna[i] > karta1)
							{
								karta1 = jedna[i];
							}
						}
						for(new i = 0; i < 7; i++)
						{
							if(jedna[i] > karta2 && jedna[i] != karta1)
							{
								karta2 = jedna[i];
							}
						}
						for(new i = 0; i < 7; i++)
						{
							if(jedna[i] > karta3 && jedna[i] != karta1 && jedna[i] != karta2)
							{
								karta3 = jedna[i];
							}
						}
						for(new i = 0; i < 7; i++)
						{
							if(jedna[i] > karta4 && jedna[i] != karta1 && jedna[i] != karta2 && jedna[i] != karta3)
							{
								karta4 = jedna[i];
							}
						}
						for(new i = 0; i < 7; i++)
						{
							if(jedna[i] > karta5 && jedna[i] != karta1 && jedna[i] != karta2 && jedna[i] != karta3 && jedna[i] != karta4)
							{
								karta5 = jedna[i];
							}
						}
						DaneGracza[id_gracza][gInformacjePoker][1] = karta1;
						DaneGracza[id_gracza][gInformacjePoker][2] = karta2;
						DaneGracza[id_gracza][gInformacjePoker][3] = karta3;
						DaneGracza[id_gracza][gInformacjePoker][4] = karta4;
						DaneGracza[id_gracza][gInformacjePoker][5] = karta5;
						uklad = 18;
					}
				}
			}
		}
	}
	return uklad;
}

stock PorownajKarty(uid_stolu)
{
	OdswiezTexdrawyPoker(uid_stolu, 1);
	new uklady[6];
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
		{
			uklady[i] = SprawdzUklad(ObiektInfo[uid_stolu][gAktualniGracze][i], uid_stolu);
			DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][6] = uklady[i];
		}
	}
	for(new i = 0; i < 6; i++)
	{
		if(uklady[i] > uklady[0] && uklady[0] != 0 || uklady[i] > uklady[1] && uklady[1] != 0 || uklady[i] > uklady[2] && uklady[2] != 0 || uklady[i] > uklady[3] && uklady[3] != 0 || uklady[i] > uklady[4] && uklady[4] != 0 || uklady[i] > uklady[5] && uklady[5] != 0)
		{
			ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
		}
	}
	new ukladow = 0, jakiuklad = 0;
	for(new i = 0; i < 6; i++)
	{
		if(uklady[i] != 0)
		{
			jakiuklad = uklady[i];
			ukladow++;
		}
	}
	if(ukladow > 1)
	{
		if(jakiuklad > 0 && jakiuklad < 11)
		{
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 11)//kareta
		{
			new karty1[6], karty2[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 12)//ful
		{
			new karty1[6], karty2[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 13)//kolor
		{
			new karty1[6], karty2[6], karty3[6], karty4[6],karty5[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][4];
					karty3[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][3];
					karty4[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][2];
					karty5[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
				new ilosc_graczy1 = 0;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
					{
						ilosc_graczy1++;
					}
				}
				if(ilosc_graczy1 > 1)
				{
					for(new i = 0; i < 6; i++)
					{
						if(karty3[i] < karty3[0] && karty3[0] != 0 || karty3[i] < karty3[1] && karty3[1] != 0 || karty3[i] < karty3[2] && karty3[2] != 0 || karty3[i] < karty3[3] && karty3[3] != 0 || karty3[i] < karty3[4] && karty3[4] != 0 || karty3[i] < karty3[5] && karty3[5] != 0)
						{
							ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
						}
					}
					new ilosc_graczy2 = 0;
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
						{
							ilosc_graczy2++;
						}
					}
					if(ilosc_graczy2 > 1)
					{
						for(new i = 0; i < 6; i++)
						{
							if(karty4[i] < karty4[0] && karty4[0] != 0 || karty4[i] < karty4[1] && karty4[1] != 0 || karty4[i] < karty4[2] && karty4[2] != 0 || karty4[i] < karty4[3] && karty4[3] != 0 || karty4[i] < karty4[4] && karty4[4] != 0 || karty4[i] < karty4[5] && karty4[5] != 0)
							{
								ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
							}
						}
						new ilosc_graczy3 = 0;
						for(new i = 0; i < 6; i++)
						{
							if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
							{
								ilosc_graczy3++;
							}
						}
						if(ilosc_graczy3 > 1)
						{
							for(new i = 0; i < 6; i++)
							{
								if(karty5[i] < karty5[0] && karty5[0] != 0 || karty5[i] < karty5[1] && karty5[1] != 0 || karty5[i] < karty5[2] && karty5[2] != 0 || karty5[i] < karty5[3] && karty5[3] != 0 || karty5[i] < karty5[4] && karty5[4] != 0 || karty5[i] < karty5[5] && karty5[5] != 0)
								{
									ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
								}
							}
						}
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 14)//strit
		{
			new karty1[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 15)//trójka
		{
			new karty1[6], karty2[6], karty3[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][4];
					karty3[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
				new ilosc_graczy1 = 0;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
					{
						ilosc_graczy1++;
					}
				}
				if(ilosc_graczy1 > 1)
				{
					for(new i = 0; i < 6; i++)
					{
						if(karty3[i] < karty3[0] && karty3[0] != 0 || karty3[i] < karty3[1] && karty3[1] != 0 || karty3[i] < karty3[2] && karty3[2] != 0 || karty3[i] < karty3[3] && karty3[3] != 0 || karty3[i] < karty3[4] && karty3[4] != 0 || karty3[i] < karty3[5] && karty3[5] != 0)
						{
							ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
						}
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 16)//dwie pary
		{
			new karty1[6], karty2[6], karty3[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][3];
					karty3[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
				new ilosc_graczy2 = 0;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
					{
						ilosc_graczy2++;
					}
				}
				if(ilosc_graczy2 > 1)
				{
					for(new i = 0; i < 6; i++)
					{
						if(karty3[i] < karty3[0] && karty3[0] != 0 || karty3[i] < karty3[1] && karty3[1] != 0 || karty3[i] < karty3[2] && karty3[2] != 0 || karty3[i] < karty3[3] && karty3[3] != 0 || karty3[i] < karty3[4] && karty3[4] != 0 || karty3[i] < karty3[5] && karty3[5] != 0)
						{
							ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
						}
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 17)//para
		{
			new karty1[6], karty2[6], karty3[6],karty4[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][3];
					karty3[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][4];
					karty4[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
				new ilosc_graczy1 = 0;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
					{
						ilosc_graczy1++;
					}
				}
				if(ilosc_graczy1 > 1)
				{
					for(new i = 0; i < 6; i++)
					{
						if(karty3[i] < karty3[0] && karty3[0] != 0 || karty3[i] < karty3[1] && karty3[1] != 0 || karty3[i] < karty3[2] && karty3[2] != 0 || karty3[i] < karty3[3] && karty3[3] != 0 || karty3[i] < karty3[4] && karty3[4] != 0 || karty3[i] < karty3[5] && karty3[5] != 0)
						{
							ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
						}
					}
					new ilosc_graczy2 = 0;
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
						{
							ilosc_graczy2++;
						}
					}
					if(ilosc_graczy2 > 1)
					{
						for(new i = 0; i < 6; i++)
						{
							if(karty4[i] < karty4[0] && karty4[0] != 0 || karty4[i] < karty4[1] && karty4[1] != 0 || karty4[i] < karty4[2] && karty4[2] != 0 || karty4[i] < karty4[3] && karty4[3] != 0 || karty4[i] < karty4[4] && karty4[4] != 0 || karty4[i] < karty4[5] && karty4[5] != 0)
							{
								ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
							}
						}
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
		else if(jakiuklad == 18)//wysoka karta
		{
			new karty1[6], karty2[6], karty3[6], karty4[6],karty5[6];
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					karty1[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][1];
					karty2[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][2];
					karty3[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][3];
					karty4[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][4];
					karty5[i] = DaneGracza[ObiektInfo[uid_stolu][gAktualniGracze][i]][gInformacjePoker][5];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(karty1[i] < karty1[0] && karty1[0] != 0 || karty1[i] < karty1[1] && karty1[1] != 0 || karty1[i] < karty1[2] && karty1[2] != 0 || karty1[i] < karty1[3] && karty1[3] != 0 || karty1[i] < karty1[4] && karty1[4] != 0 || karty1[i] < karty1[5] && karty1[5] != 0)
				{
					ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
				}
			}
			new ilosc_graczy = 0;
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
				{
					ilosc_graczy++;
				}
			}
			if(ilosc_graczy > 1)
			{
				for(new i = 0; i < 6; i++)
				{
					if(karty2[i] < karty2[0] && karty2[0] != 0 || karty2[i] < karty2[1] && karty2[1] != 0 || karty2[i] < karty2[2] && karty2[2] != 0 || karty2[i] < karty2[3] && karty2[3] != 0 || karty2[i] < karty2[4] && karty2[4] != 0 || karty2[i] < karty2[5] && karty2[5] != 0)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
					}
				}
				new ilosc_graczy1 = 0;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
					{
						ilosc_graczy1++;
					}
				}
				if(ilosc_graczy1 > 1)
				{
					for(new i = 0; i < 6; i++)
					{
						if(karty3[i] < karty3[0] && karty3[0] != 0 || karty3[i] < karty3[1] && karty3[1] != 0 || karty3[i] < karty3[2] && karty3[2] != 0 || karty3[i] < karty3[3] && karty3[3] != 0 || karty3[i] < karty3[4] && karty3[4] != 0 || karty3[i] < karty3[5] && karty3[5] != 0)
						{
							ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
						}
					}
					new ilosc_graczy2 = 0;
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
						{
							ilosc_graczy2++;
						}
					}
					if(ilosc_graczy2 > 1)
					{
						for(new i = 0; i < 6; i++)
						{
							if(karty4[i] < karty4[0] && karty4[0] != 0 || karty4[i] < karty4[1] && karty4[1] != 0 || karty4[i] < karty4[2] && karty4[2] != 0 || karty4[i] < karty4[3] && karty4[3] != 0 || karty4[i] < karty4[4] && karty4[4] != 0 || karty4[i] < karty4[5] && karty4[5] != 0)
							{
								ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
							}
						}
						new ilosc_graczy3 = 0;
						for(new i = 0; i < 6; i++)
						{
							if(ObiektInfo[uid_stolu][gAktualniGracze][i] != -1)
							{
								ilosc_graczy3++;
							}
						}
						if(ilosc_graczy3 > 1)
						{
							for(new i = 0; i < 6; i++)
							{
								if(karty5[i] < karty5[0] && karty5[0] != 0 || karty5[i] < karty5[1] && karty5[1] != 0 || karty5[i] < karty5[2] && karty5[2] != 0 || karty5[i] < karty5[3] && karty5[3] != 0 || karty5[i] < karty5[4] && karty5[4] != 0 || karty5[i] < karty5[5] && karty5[5] != 0)
								{
									ObiektInfo[uid_stolu][gAktualniGracze][i] = -1;
								}
							}
						}
					}
				}
			}
			KoniecRundy(uid_stolu);
		}
	}
	else
	{
		KoniecRundy(uid_stolu);
	}
}

stock SprawdzKarte(numer)
{
	new nazwa_karty[50];
	switch(numer)
	{
		case 1:{
			nazwa_karty = "LD_CARD:cd1s";//As Pik
		}
		case 2:{
			nazwa_karty = "LD_CARD:cd1h";//As Kier
		}
		case 3:{
			nazwa_karty = "LD_CARD:cd1c";//As Trefl
		}
		case 4:{
			nazwa_karty = "LD_CARD:cd1d";//As Kara
		}
		case 5:{
			nazwa_karty = "LD_CARD:cd2s";//dwa Pik
		}
		case 6:{
			nazwa_karty = "LD_CARD:cd2h";//dwa Kier
		}
		case 7:{
			nazwa_karty = "LD_CARD:cd2c";//dwa Trefl
		}
		case 8:{
			nazwa_karty = "LD_CARD:cd2d";//dwa Kara
		}
		case 9:{
			nazwa_karty = "LD_CARD:cd3s";//trzy Pik
		}
		case 10:{
			nazwa_karty = "LD_CARD:cd3h";//trzy Kier
		}
		case 11:{
			nazwa_karty = "LD_CARD:cd3c";//trzy Trefl
		}
		case 12:{
			nazwa_karty = "LD_CARD:cd3d";//trzy Kara
		}
		case 13:{
			nazwa_karty = "LD_CARD:cd4s";//cztery Pik
		}
		case 14:{
			nazwa_karty = "LD_CARD:cd4h";//cztery Kier
		}
		case 15:{
			nazwa_karty = "LD_CARD:cd4c";//cztery Trefl
		}
		case 16:{
			nazwa_karty = "LD_CARD:cd4d";//cztery Kara
		}
		case 17:{
			nazwa_karty = "LD_CARD:cd5s";//piec Pik
		}
		case 18:{
			nazwa_karty = "LD_CARD:cd5h";//piec Kier
		}
		case 19:{
			nazwa_karty = "LD_CARD:cd5c";//piec Trefl
		}
		case 20:{
			nazwa_karty = "LD_CARD:cd5d";//piec Kara
		}
		case 21:{
			nazwa_karty = "LD_CARD:cd6s";//szesc Pik
		}
		case 22:{
			nazwa_karty = "LD_CARD:cd6h";//szesc Kier
		}
		case 23:{
			nazwa_karty = "LD_CARD:cd6c";//szesc Trefl
		}
		case 24:{
			nazwa_karty = "LD_CARD:cd6d";//szesc Kara
		}
		case 25:{
			nazwa_karty = "LD_CARD:cd7s";//siedem Pik
		}
		case 26:{
			nazwa_karty = "LD_CARD:cd7h";//siedem Kier
		}
		case 27:{
			nazwa_karty = "LD_CARD:cd7c";//siedem Trefl
		}
		case 28:{
			nazwa_karty = "LD_CARD:cd7d";//siedem Kara
		}
		case 29:{
			nazwa_karty = "LD_CARD:cd8s";//osiem Pik
		}
		case 30:{
			nazwa_karty = "LD_CARD:cd8h";//osiem Kier
		}
		case 31:{
			nazwa_karty = "LD_CARD:cd8c";//osiem Trefl
		}
		case 32:{
			nazwa_karty = "LD_CARD:cd8d";//osiem Kara
		}
		case 33:{
			nazwa_karty = "LD_CARD:cd9s";//dziewiec Pik
		}
		case 34:{
			nazwa_karty = "LD_CARD:cd9h";//dziewiec Kier
		}
		case 35:{
			nazwa_karty = "LD_CARD:cd9c";//dziewiec Trefl
		}
		case 36:{
			nazwa_karty = "LD_CARD:cd9d";//dziewiec Kara
		}
		case 37:{
			nazwa_karty = "LD_CARD:cd10s";//dziesiec Pik
		}
		case 38:{
			nazwa_karty = "LD_CARD:cd10h";//dziesiec Kier
		}
		case 39:{
			nazwa_karty = "LD_CARD:cd10c";//dziesiec Trefl
		}
		case 40:{
			nazwa_karty = "LD_CARD:cd10d";//dziesiec Kara
		}
		case 41:{
			nazwa_karty = "LD_CARD:cd11s";//walet Pik
		}
		case 42:{
			nazwa_karty = "LD_CARD:cd11h";//walet Kier
		}
		case 43:{
			nazwa_karty = "LD_CARD:cd11c";//walet Trefl
		}
		case 44:{
			nazwa_karty = "LD_CARD:cd11d";//walet Kara
		}
		case 45:{
			nazwa_karty = "LD_CARD:cd12s";//dama Pik
		}
		case 46:{
			nazwa_karty = "LD_CARD:cd12h";//dama Kier
		}
		case 47:{
			nazwa_karty = "LD_CARD:cd12c";//dama Trefl
		}
		case 48:{
			nazwa_karty = "LD_CARD:cd12d";//dama Kara
		}
		case 49:{
			nazwa_karty = "LD_CARD:cd13s";//krol Pik
		}
		case 50:{
			nazwa_karty = "LD_CARD:cd13h";//krol Kier
		}
		case 51:{
			nazwa_karty = "LD_CARD:cd13c";//krol Trefl
		}
		case 52:{
			nazwa_karty = "LD_CARD:cd13d";//krol Kara
		}
	}
	return nazwa_karty;
}

forward RozpocznijPokera(playerid, uid_stolu);
public RozpocznijPokera(playerid, uid_stolu)
{
	new ilosc_graczy = 0;
	for(new i = 0; i < 6; i++)
	{
		if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
		{
			ilosc_graczy++;
		}
	}
	if(ilosc_graczy >= 2 && GraWPokera[playerid] != 0)
	{
		if(DaneGracza[playerid][gPokerZetony] == -1)
		{
			GraWPokera[playerid] = 0;
			return 0;
		}
		if(ObiektInfo[uid_stolu][gRundaPoker] == 0)
		{
			for(new i = 0; i < 6; i++)
			{
				if(DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gPokerZetony] != -1 && ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
				{
					TextDrawHideForPlayer(ObiektInfo[uid_stolu][objPoker][i], TextNaDrzwi[ObiektInfo[uid_stolu][objPoker][i]]);
					DaneGracza[ObiektInfo[uid_stolu][objPoker][i]][gRundaPokerCzas] = 20;
				}
			}
			return 0;
		}
		if(ObiektInfo[uid_stolu][gRundaPoker] == 1 && GraWPokera[playerid] != 0)
		{
			if(DaneGracza[playerid][gPokerZetony] < 20)
			{
				new id_pokera = DaneGracza[playerid][gPoker];
				dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "W³asnie opuœci³eœ stolik. Powodem opuszczenia sto³u by³ brak ¿etonów do kontynuacji rozgrywki!!", "Zamknij", "");
				if(DaneGracza[playerid][gPokerZetony] > 0)
				{
					new kasa = DaneGracza[playerid][gPokerZetony] / 10;
					Dodajkase(playerid, kasa);
					DaneGracza[playerid][gPokerZetony] = -1;
				}
				if(ObiektInfo[id_pokera][gPokerInfo][14] == playerid)
				{
					new poprzedni = SprawdzPoprzedniego(DaneGracza[playerid][gPokerStanowisko]);
					new poprzedni2 = DaneGracza[playerid][gPokerStanowisko];
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[id_pokera][gAktualniGracze][poprzedni] == -1 || DaneGracza[ObiektInfo[id_pokera][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1)
						{
							switch(poprzedni2)
							{
								case 0:{
									poprzedni2 = 4;
								}
								case 1:{
									poprzedni2 = 5;
								}
								case 2:{
									poprzedni2 = 0;
								}
								case 3:{
									poprzedni2 = 1;
								}
								case 4:{
									poprzedni2 = 3;
								}
								case 5:{
									poprzedni2 = 2;
								}
							}
							poprzedni = SprawdzPoprzedniego(poprzedni2);
						}
					}
					ObiektInfo[id_pokera][gPokerInfo][14] = ObiektInfo[id_pokera][gAktualniGracze][poprzedni];
				}
				for(new i = 0; i < 30; i++)
				{
					if(DaneGracza[playerid][gPokerObj][i] != 0)
					{
						DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
						DaneGracza[playerid][gPokerObj][i] = 0;
						DaneGracza[playerid][gNumeryObiektowPostawionych][i] = 0;
					}
				}
				CancelSelectTextDraw(playerid);
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] == playerid)
					{
						ObiektInfo[id_pokera][gAktualniGracze][i] = -1;
						ObiektInfo[id_pokera][objPoker][i] = -1;
						DaneGracza[playerid][gPoker] = 0;
						DaneGracza[playerid][gPokerStanowisko] = -1;
						DaneGracza[playerid][gPokerPostawione] = 0;
						DaneGracza[playerid][gPokerKarty][0] = 0;
						DaneGracza[playerid][gPokerKarty][1] = 0;
						break;
					}
				}
				UsunBaryGracz(playerid);
				OdswiezTexdrawyPoker(id_pokera, 0);
				new ilosc = SprawdzIloscGraczy(id_pokera);
				if(ilosc < 2)
				{
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[id_pokera][objPoker][i] != -1)
						{
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza1[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza11[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza2[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza22[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza3[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza33[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza4[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza44[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza5[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza55[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza6[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartyGracza66[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],Poker1[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],Poker2[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],Poker3[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],Poker4[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],Poker5[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],Poker6[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza1[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza2[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza3[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza4[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza5[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza6[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza7[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza8[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza9[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza10[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza11[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza12[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza13[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],KartaGracza14[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],WylosowaneKarty[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],WylosowaneKarty1[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],WylosowaneKarty2[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],WylosowaneKarty3[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],WylosowaneKarty4[ObiektInfo[id_pokera][objPoker][i]]);
							PlayerTextDrawHide(ObiektInfo[id_pokera][objPoker][i],WylosowaneKarty5[ObiektInfo[id_pokera][objPoker][i]]);
						}
					}
					KoniecRundy(id_pokera);
				}
				if(WybralMozliwoscPoker[playerid] != 0)
				{
					WybralMozliwoscPoker[playerid] = 0;
					SprawdzKolejGracza(playerid);
				}
				PlayerTextDrawHide(playerid,KartyGracza[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza11[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza2[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza22[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza3[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza33[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza4[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza44[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza5[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza55[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza6[playerid]);
				PlayerTextDrawHide(playerid,KartyGracza66[playerid]);
				PlayerTextDrawHide(playerid,Poker1[playerid]);
				PlayerTextDrawHide(playerid,Poker2[playerid]);
				PlayerTextDrawHide(playerid,Poker3[playerid]);
				PlayerTextDrawHide(playerid,Poker4[playerid]);
				PlayerTextDrawHide(playerid,Poker5[playerid]);
				PlayerTextDrawHide(playerid,Poker6[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza3[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza4[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza5[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza6[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza7[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza8[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza9[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza10[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza11[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza12[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza13[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza14[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty1[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty2[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty3[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty4[playerid]);
				PlayerTextDrawHide(playerid,WylosowaneKarty5[playerid]);
				TogglePlayerControllable(playerid,1);
				SetCameraBehindPlayer(playerid);
				return 0;
			}
			PlayerTextDrawHide(playerid,WylosowaneKarty1[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty2[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty3[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty4[playerid]);
			PlayerTextDrawHide(playerid,WylosowaneKarty5[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza1[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza2[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza3[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza4[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza5[playerid]);
			PlayerTextDrawHide(playerid,KartyGracza6[playerid]);
			PlayerTextDrawSetString(playerid, WylosowaneKarty1[playerid], "LD_CARD:cdback");
			PlayerTextDrawSetString(playerid, WylosowaneKarty2[playerid], "LD_CARD:cdback");
			PlayerTextDrawSetString(playerid, WylosowaneKarty3[playerid], "LD_CARD:cdback");
			PlayerTextDrawSetString(playerid, WylosowaneKarty4[playerid], "LD_CARD:cdback");
			PlayerTextDrawSetString(playerid, WylosowaneKarty5[playerid], "LD_CARD:cdback");
			PlayerTextDrawSetString(playerid, KartyGracza1[playerid], "Oczekiwanie...");
			PlayerTextDrawSetString(playerid, KartyGracza2[playerid], "Oczekiwanie...");
			PlayerTextDrawSetString(playerid, KartyGracza3[playerid], "Oczekiwanie...");
			PlayerTextDrawSetString(playerid, KartyGracza4[playerid], "Oczekiwanie...");
			PlayerTextDrawSetString(playerid, KartyGracza5[playerid], "Oczekiwanie...");
			PlayerTextDrawSetString(playerid, KartyGracza6[playerid], "Oczekiwanie...");
			if(ObiektInfo[uid_stolu][gPokerInfo][5] == 0)
			{
				ObiektInfo[uid_stolu][gPokerInfo][5] = 1;
				if(ObiektInfo[uid_stolu][objPokerDiler] == -1)
				{
					for(new i = 0; i < 6; i ++)
					{
						if(ObiektInfo[uid_stolu][objPoker][i] != -1)
						{
							ObiektInfo[uid_stolu][objPokerDiler] = i;
							break;
						}
					}
				}
				new aktualny_diler = SprawdzKolejnego(ObiektInfo[uid_stolu][objPokerDiler]);
				new aktualny_diler2 = ObiektInfo[uid_stolu][objPokerDiler];
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][aktualny_diler] == -1)
					{
						switch(aktualny_diler2)
						{
							case 0:{
								aktualny_diler2 = 4;
							}
							case 1:{
								aktualny_diler2 = 5;
							}
							case 2:{
								aktualny_diler2 = 0;
							}
							case 3:{
								aktualny_diler2 = 1;
							}
							case 4:{
								aktualny_diler2 = 3;
							}
							case 5:{
								aktualny_diler2 = 2;
							}
						}
						aktualny_diler = SprawdzKolejnego(aktualny_diler2);
					}
				}
				new small = SprawdzKolejnego(aktualny_diler);
				new small2 = aktualny_diler;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][small] == -1)
					{
						switch(small2)
						{
							case 0:{
								small2 = 4;
							}
							case 1:{
								small2 = 5;
							}
							case 2:{
								small2 = 0;
							}
							case 3:{
								small2 = 1;
							}
							case 4:{
								small2 = 3;
							}
							case 5:{
								small2 = 2;
							}
						}
						small = SprawdzKolejnego(small2);
					}
				}
				new big = SprawdzKolejnego(small);
				new big2 = small;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][big] == -1)
					{
						switch(big2)
						{
							case 0:{
								big2 = 4;
							}
							case 1:{
								big2 = 5;
							}
							case 2:{
								big2 = 0;
							}
							case 3:{
								big2 = 1;
							}
							case 4:{
								big2 = 3;
							}
							case 5:{
								big2 = 2;
							}
						}
						big = SprawdzKolejnego(big2);
					}
				}
				new rozgrywajacy = SprawdzKolejnego(big);
				new rozgrywajacy2 = big;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][rozgrywajacy] == -1)
					{
						switch(rozgrywajacy2)
						{
							case 0:{
								rozgrywajacy2 = 4;
							}
							case 1:{
								rozgrywajacy2 = 5;
							}
							case 2:{
								rozgrywajacy2 = 0;
							}
							case 3:{
								rozgrywajacy2 = 1;
							}
							case 4:{
								rozgrywajacy2 = 3;
							}
							case 5:{
								rozgrywajacy2 = 2;
							}
						}
						rozgrywajacy = SprawdzKolejnego(rozgrywajacy2);
					}
				}
				ObiektInfo[uid_stolu][objPokerDiler] = aktualny_diler;
				ObiektInfo[uid_stolu][gPokerInfo][0] = aktualny_diler;
				ObiektInfo[uid_stolu][gPokerInfo][2] = ObiektInfo[uid_stolu][objPoker][small];
				ObiektInfo[uid_stolu][gPokerInfo][3] = ObiektInfo[uid_stolu][objPoker][big];
				ObiektInfo[uid_stolu][gPokerInfo][4] = ObiektInfo[uid_stolu][objPoker][rozgrywajacy];
			}
			if(ObiektInfo[uid_stolu][gPokerInfo][11] == 0)
			{
				ObiektInfo[uid_stolu][gPokerInfo][11] = 1;
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][objPoker][i] != -1)
					{
						ObiektInfo[uid_stolu][gAktualniGracze][i] = ObiektInfo[uid_stolu][objPoker][i];
					}
				}
			}
			new id_small = ObiektInfo[uid_stolu][gPokerInfo][2];
			new id_big = ObiektInfo[uid_stolu][gPokerInfo][3];
			new id_rozgrywajacy = ObiektInfo[uid_stolu][gPokerInfo][4];
			if(playerid == id_small)
			{
				DaneGracza[playerid][gPokerZetony] -= 10;
				ObiektInfo[uid_stolu][gPokerInfo][1] += 10;
				DaneGracza[playerid][gPokerPostawione] += 10;
				for(new i = 0; i < 30; i++)
				{
					if(DaneGracza[playerid][gPokerObj][i] != 0)
					{
						DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
						DaneGracza[playerid][gPokerObj][i] = 0;
					}
				}
				PrzeliczZetony(playerid, uid_stolu, 0, 0);
				PrzeliczZetony(playerid, uid_stolu, 10, 5);
			}
			else if(playerid == id_big)
			{
				DaneGracza[playerid][gPokerZetony] -= 20;
				ObiektInfo[uid_stolu][gPokerInfo][1] += 20;
				DaneGracza[playerid][gPokerPostawione] += 20;
				for(new i = 0; i < 30; i++)
				{
					if(DaneGracza[playerid][gPokerObj][i] != 0)
					{
						DestroyDynamicObject(DaneGracza[playerid][gPokerObj][i]);
						DaneGracza[playerid][gPokerObj][i] = 0;
					}
				}
				PrzeliczZetony(playerid, uid_stolu, 0, 0);
				PrzeliczZetony(playerid, uid_stolu, 20, 5);
				ObiektInfo[uid_stolu][gPokerInfo][13] = 20;
				ObiektInfo[uid_stolu][gPokerInfo][14] = playerid;
			}
			OdswiezTexdrawyPoker(uid_stolu, 0);
			if(DaneGracza[playerid][gPokerKarty][0] == 0)
			{
				for(new j = 0; j < 2; j++)
				{
					new wylosowana = WylosujKarte(uid_stolu, 52);
					new karta[54];
					karta = SprawdzKarte(wylosowana);
					switch(j)
					{
						case 0: {
							PlayerTextDrawSetString(playerid, KartaGracza1[playerid], karta);
							PlayerTextDrawShow(playerid,KartaGracza1[playerid]);
							DaneGracza[playerid][gPokerKarty][0] = wylosowana;
						}
						case 1: {
							PlayerTextDrawSetString(playerid, KartaGracza2[playerid], karta);
							PlayerTextDrawShow(playerid,KartaGracza2[playerid]);
							DaneGracza[playerid][gPokerKarty][1] = wylosowana;
						}
					}
				}
			}
			if(ObiektInfo[uid_stolu][gPokerInfo][12] == 0)
			{
				ObiektInfo[uid_stolu][gPokerInfo][12] = 1;
				for(new i = 0; i < 5; i++)
				{
					new wylosowana = WylosujKarte(uid_stolu, 52);
					new numer = i+6;
					ObiektInfo[uid_stolu][gPokerInfo][numer] = wylosowana;
				}
			}
			if(id_rozgrywajacy == playerid)
			{
				if(DaneGracza[id_rozgrywajacy][gPokerPostawione] == ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][13])
				{
					PlayerTextDrawSetString(id_rozgrywajacy, Poker3[id_rozgrywajacy], "Czekam");
					PlayerTextDrawSetString(id_rozgrywajacy, Poker4[id_rozgrywajacy], "Stawiam zaklad");
				}
				else
				{
					PlayerTextDrawSetString(id_rozgrywajacy, Poker3[id_rozgrywajacy], "Sprawdzam");
					PlayerTextDrawSetString(id_rozgrywajacy, Poker4[id_rozgrywajacy], "Przebijam");
				}
				WybralMozliwoscPoker[playerid] = 60;
				PlayerTextDrawShow(playerid,Poker2[playerid]);
				PlayerTextDrawShow(playerid,Poker3[playerid]);
				PlayerTextDrawShow(playerid,Poker4[playerid]);
				PlayerTextDrawShow(playerid,Poker5[playerid]);
				PlayerTextDrawShow(playerid,Poker6[playerid]);
				SelectTextDraw(playerid, 0xFFFFFFFF);
			}
		}
		if(ObiektInfo[uid_stolu][gRundaPoker] == 2 && GraWPokera[playerid] != 0)
		{
			if(ObiektInfo[uid_stolu][gPokerInfo][15] == 0)
			{
				ObiektInfo[uid_stolu][gPokerInfo][15] = 1;
				new rozgrywajacy = SprawdzKolejnego(ObiektInfo[uid_stolu][gPokerInfo][0]);
				new rozgrywajacy2 = ObiektInfo[uid_stolu][gPokerInfo][0];
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][rozgrywajacy] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][rozgrywajacy]][gInformacjePoker][0] == 1)
					{
						switch(rozgrywajacy2)
						{
							case 0:{
								rozgrywajacy2 = 4;
							}
							case 1:{
								rozgrywajacy2 = 5;
							}
							case 2:{
								rozgrywajacy2 = 0;
							}
							case 3:{
								rozgrywajacy2 = 1;
							}
							case 4:{
								rozgrywajacy2 = 3;
							}
							case 5:{
								rozgrywajacy2 = 2;
							}
						}
						rozgrywajacy = SprawdzKolejnego(rozgrywajacy2);
					}
				}
				ObiektInfo[uid_stolu][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][ObiektInfo[uid_stolu][gPokerInfo][0]];
				ObiektInfo[uid_stolu][gPokerInfo][4] = ObiektInfo[uid_stolu][gAktualniGracze][rozgrywajacy];
				if(ObiektInfo[uid_stolu][gAktualniGracze][ObiektInfo[uid_stolu][gPokerInfo][0]] == -1)
				{
					new poprzedni = SprawdzPoprzedniego(ObiektInfo[uid_stolu][gPokerInfo][0]);
					new poprzedni2 = ObiektInfo[uid_stolu][gPokerInfo][0];
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1)
						{
							switch(poprzedni2)
							{
								case 0:{
									poprzedni2 = 2;
								}
								case 1:{
									poprzedni2 = 3;
								}
								case 2:{
									poprzedni2 = 5;
								}
								case 3:{
									poprzedni2 = 4;
								}
								case 4:{
									poprzedni2 = 0;
								}
								case 5:{
									poprzedni2 = 1;
								}
							}
							poprzedni = SprawdzPoprzedniego(poprzedni2);
						}
					}
					ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
				{
					new karta1[54], karta2[54], karta3[54];
					karta1 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][6]);
					karta2 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][7]);
					karta3 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][8]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]], karta1);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]], karta2);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]], karta3);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty1[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty2[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty3[ObiektInfo[uid_stolu][objPoker][i]]);
				}
			}
			new stanowisko = DaneGracza[playerid][gPokerStanowisko];
			if(ObiektInfo[uid_stolu][gAktualniGracze][stanowisko] == -1 && ObiektInfo[uid_stolu][objPoker][stanowisko] != -1)
			{
				PlayerTextDrawHide(playerid,KartyGracza[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
			}
			if(ObiektInfo[uid_stolu][gPokerInfo][4] == playerid)
			{
				WybralMozliwoscPoker[playerid] = 60;
				PlayerTextDrawSetString(playerid, Poker3[playerid], "Czekam");
				PlayerTextDrawSetString(playerid, Poker4[playerid], "Stawiam zaklad");
				PlayerTextDrawShow(playerid,Poker2[playerid]);
				PlayerTextDrawShow(playerid,Poker3[playerid]);
				PlayerTextDrawShow(playerid,Poker4[playerid]);
				PlayerTextDrawShow(playerid,Poker5[playerid]);
				PlayerTextDrawShow(playerid,Poker6[playerid]);
				SelectTextDraw(playerid, 0xFFFFFFFF);
			}
		}
		if(ObiektInfo[uid_stolu][gRundaPoker] == 3 && GraWPokera[playerid] != 0)
		{
			if(ObiektInfo[uid_stolu][gPokerInfo][15] == 0)
			{
				ObiektInfo[uid_stolu][gPokerInfo][15] = 1;
				new rozgrywajacy = SprawdzKolejnego(ObiektInfo[uid_stolu][gPokerInfo][0]);
				new rozgrywajacy2 = ObiektInfo[uid_stolu][gPokerInfo][0];
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][rozgrywajacy] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][rozgrywajacy]][gInformacjePoker][0] == 1)
					{
						switch(rozgrywajacy2)
						{
							case 0:{
								rozgrywajacy2 = 4;
							}
							case 1:{
								rozgrywajacy2 = 5;
							}
							case 2:{
								rozgrywajacy2 = 0;
							}
							case 3:{
								rozgrywajacy2 = 1;
							}
							case 4:{
								rozgrywajacy2 = 3;
							}
							case 5:{
								rozgrywajacy2 = 2;
							}
						}
						rozgrywajacy = SprawdzKolejnego(rozgrywajacy2);
					}
				}
				ObiektInfo[uid_stolu][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][ObiektInfo[uid_stolu][gPokerInfo][0]];
				ObiektInfo[uid_stolu][gPokerInfo][4] = ObiektInfo[uid_stolu][gAktualniGracze][rozgrywajacy];
				if(ObiektInfo[uid_stolu][gAktualniGracze][ObiektInfo[uid_stolu][gPokerInfo][0]] == -1)
				{
					new poprzedni = SprawdzPoprzedniego(ObiektInfo[uid_stolu][gPokerInfo][0]);
					new poprzedni2 = ObiektInfo[uid_stolu][gPokerInfo][0];
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1)
						{
							switch(poprzedni2)
							{
								case 0:{
									poprzedni2 = 2;
								}
								case 1:{
									poprzedni2 = 3;
								}
								case 2:{
									poprzedni2 = 5;
								}
								case 3:{
									poprzedni2 = 4;
								}
								case 4:{
									poprzedni2 = 0;
								}
								case 5:{
									poprzedni2 = 1;
								}
							}
							poprzedni = SprawdzPoprzedniego(poprzedni2);
						}
					}
					ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
				{
					new karta4[54];
					karta4 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][9]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]], karta4);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty4[ObiektInfo[uid_stolu][objPoker][i]]);
				}
			}
			new stanowisko = DaneGracza[playerid][gPokerStanowisko];
			if(ObiektInfo[uid_stolu][gAktualniGracze][stanowisko] == -1 && ObiektInfo[uid_stolu][objPoker][stanowisko] != -1)
			{
				PlayerTextDrawHide(playerid,KartyGracza[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
			}
			if(ObiektInfo[uid_stolu][gPokerInfo][4] == playerid)
			{
				WybralMozliwoscPoker[playerid] = 60;
				PlayerTextDrawSetString(playerid, Poker3[playerid], "Czekam");
				PlayerTextDrawSetString(playerid, Poker4[playerid], "Stawiam zaklad");
				PlayerTextDrawShow(playerid,Poker2[playerid]);
				PlayerTextDrawShow(playerid,Poker3[playerid]);
				PlayerTextDrawShow(playerid,Poker4[playerid]);
				PlayerTextDrawShow(playerid,Poker5[playerid]);
				PlayerTextDrawShow(playerid,Poker6[playerid]);
				SelectTextDraw(playerid, 0xFFFFFFFF);
			}
		}
		if(ObiektInfo[uid_stolu][gRundaPoker] == 4 && GraWPokera[playerid] != 0)
		{
			if(ObiektInfo[uid_stolu][gPokerInfo][15] == 0)
			{
				ObiektInfo[uid_stolu][gPokerInfo][15] = 1;
				new rozgrywajacy = SprawdzKolejnego(ObiektInfo[uid_stolu][gPokerInfo][0]);
				new rozgrywajacy2 = ObiektInfo[uid_stolu][gPokerInfo][0];
				for(new i = 0; i < 6; i++)
				{
					if(ObiektInfo[uid_stolu][gAktualniGracze][rozgrywajacy] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][rozgrywajacy]][gInformacjePoker][0] == 1)
					{
						switch(rozgrywajacy2)
						{
							case 0:{
								rozgrywajacy2 = 4;
							}
							case 1:{
								rozgrywajacy2 = 5;
							}
							case 2:{
								rozgrywajacy2 = 0;
							}
							case 3:{
								rozgrywajacy2 = 1;
							}
							case 4:{
								rozgrywajacy2 = 3;
							}
							case 5:{
								rozgrywajacy2 = 2;
							}
						}
						rozgrywajacy = SprawdzKolejnego(rozgrywajacy2);
					}
				}
				ObiektInfo[uid_stolu][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][ObiektInfo[uid_stolu][gPokerInfo][0]];
				ObiektInfo[uid_stolu][gPokerInfo][4] = ObiektInfo[uid_stolu][gAktualniGracze][rozgrywajacy];
				if(ObiektInfo[uid_stolu][gAktualniGracze][ObiektInfo[uid_stolu][gPokerInfo][0]] == -1)
				{
					new poprzedni = SprawdzPoprzedniego(ObiektInfo[uid_stolu][gPokerInfo][0]);
					new poprzedni2 = ObiektInfo[uid_stolu][gPokerInfo][0];
					for(new i = 0; i < 6; i++)
					{
						if(ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni] == -1 || DaneGracza[ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni]][gInformacjePoker][0] == 1)
						{
							switch(poprzedni2)
							{
								case 0:{
									poprzedni2 = 2;
								}
								case 1:{
									poprzedni2 = 3;
								}
								case 2:{
									poprzedni2 = 5;
								}
								case 3:{
									poprzedni2 = 4;
								}
								case 4:{
									poprzedni2 = 0;
								}
								case 5:{
									poprzedni2 = 1;
								}
							}
							poprzedni = SprawdzPoprzedniego(poprzedni2);
						}
					}
					ObiektInfo[DaneGracza[playerid][gPoker]][gPokerInfo][14] = ObiektInfo[DaneGracza[playerid][gPoker]][gAktualniGracze][poprzedni];
				}
			}
			for(new i = 0; i < 6; i++)
			{
				if(ObiektInfo[uid_stolu][objPoker][i] != -1 && GraWPokera[ObiektInfo[uid_stolu][objPoker][i]] != 0)
				{
					new karta5[54];
					karta5 = SprawdzKarte(ObiektInfo[uid_stolu][gPokerInfo][10]);
					PlayerTextDrawHide(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
					PlayerTextDrawSetString(ObiektInfo[uid_stolu][objPoker][i], WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]], karta5);
					PlayerTextDrawShow(ObiektInfo[uid_stolu][objPoker][i],WylosowaneKarty5[ObiektInfo[uid_stolu][objPoker][i]]);
				}
			}
			new stanowisko = DaneGracza[playerid][gPokerStanowisko];
			if(ObiektInfo[uid_stolu][gAktualniGracze][stanowisko] == -1 && ObiektInfo[uid_stolu][objPoker][stanowisko] != -1)
			{
				PlayerTextDrawHide(playerid,KartyGracza[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
				PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
			}
			if(ObiektInfo[uid_stolu][gPokerInfo][4] == playerid)
			{
				WybralMozliwoscPoker[playerid] = 60;
				PlayerTextDrawSetString(playerid, Poker3[playerid], "Czekam");
				PlayerTextDrawSetString(playerid, Poker4[playerid], "Stawiam zaklad");
				PlayerTextDrawShow(playerid,Poker2[playerid]);
				PlayerTextDrawShow(playerid,Poker3[playerid]);
				PlayerTextDrawShow(playerid,Poker4[playerid]);
				PlayerTextDrawShow(playerid,Poker5[playerid]);
				PlayerTextDrawShow(playerid,Poker6[playerid]);
				SelectTextDraw(playerid, 0xFFFFFFFF);
			}
		}
		//ObiektInfo[uid_stolu][gPokerInfo][0] = aktluany diler
		//ObiektInfo[uid_stolu][gPokerInfo][1] = 0; zeruje pule
		//ObiektInfo[uid_stolu][gPokerInfo][2] = small blind
		//ObiektInfo[uid_stolu][gPokerInfo][3] = big blind
		//ObiektInfo[uid_stolu][gPokerInfo][4] = rozgrywajacy
		//ObiektInfo[uid_stolu][gPokerInfo][5] = 1; sprawdza czy diler jest wylosowany;
		//ObiektInfo[uid_stolu][gPokerInfo][6] // wylosowana karta 1
		//ObiektInfo[uid_stolu][gPokerInfo][7] // wylosowana karta 2
		//ObiektInfo[uid_stolu][gPokerInfo][8] // wylosowana karta 3
		//ObiektInfo[uid_stolu][gPokerInfo][9] // wylosowana karta 4
		//ObiektInfo[uid_stolu][gPokerInfo][10] // wylosowana karta 5
		//ObiektInfo[uid_stolu][gPokerInfo][11] // sprawdza czy jest zapiasana aktualna lista graczy
		//ObiektInfo[uid_stolu][gPokerInfo][12] // sprawdza czy sa wylosowane karty
		//ObiektInfo[uid_stolu][gPokerInfo][13] //aktualna kasa na wyrownanie
		//ObiektInfo[uid_stolu][gPokerInfo][14] //aktualny gracz konczacy rozdanie
		//ObiektInfo[uid_stolu][gPokerInfo][15] //sprawdza czy jest wylosowany rozgrywajacy w kolejnej rundzie
		//DaneGracza[playerid][gPokerKarty][0] = 0;//jezeli na 0 to przy pierwszej rundzie bedzie losowac ci karty
	}
	else if(GraWPokera[playerid] != 0)
	{
		PlayerTextDrawHide(playerid,KartyGracza[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza1[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza11[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza2[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza22[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza3[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza33[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza4[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza44[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza5[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza55[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza6[playerid]);
		PlayerTextDrawHide(playerid,KartyGracza66[playerid]);
		PlayerTextDrawHide(playerid,Poker1[playerid]);
		PlayerTextDrawHide(playerid,Poker2[playerid]);
		PlayerTextDrawHide(playerid,Poker3[playerid]);
		PlayerTextDrawHide(playerid,Poker4[playerid]);
		PlayerTextDrawHide(playerid,Poker5[playerid]);
		PlayerTextDrawHide(playerid,Poker6[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza1[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza2[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza3[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza4[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza5[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza6[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza7[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza8[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza9[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza10[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza11[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza12[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza13[playerid]);
		PlayerTextDrawHide(playerid,KartaGracza14[playerid]);
		PlayerTextDrawHide(playerid,WylosowaneKarty[playerid]);
		PlayerTextDrawHide(playerid,WylosowaneKarty1[playerid]);
		PlayerTextDrawHide(playerid,WylosowaneKarty2[playerid]);
		PlayerTextDrawHide(playerid,WylosowaneKarty3[playerid]);
		PlayerTextDrawHide(playerid,WylosowaneKarty4[playerid]);
		PlayerTextDrawHide(playerid,WylosowaneKarty5[playerid]);
		CzasWyswietlaniaTextuNaDrzwiach[playerid] = 10;
		TextDrawHideForPlayer(playerid, TextNaDrzwi[playerid]);
		TextDrawSetString(TextNaDrzwi[playerid], "Liczba graczy ~r~nie jest~w~ wystarczajaca, by gra rozpocze³a sie musi byc minimum 2 graczy.");
		TextDrawShowForPlayer(playerid, TextNaDrzwi[playerid]);
		return 0;
	}
	return 1;
}
CMD:sprawdzampokera(playerid, params[])
{
	if(DaneGracza[playerid][gAdmGroup] == 4)
    {
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(WybralMozliwoscPoker[i] != 0)
			{
				new test[256];
				format(test, sizeof(test), "Teraz ma kolej ID: %d a konczy %d", WybralMozliwoscPoker[i], ObiektInfo[DaneGracza[i][gPoker]][gPokerInfo][14]);
				SendClientMessage(playerid, SZARY, test);
			}
		}
	}
	return 1;
}
CMD:poker(playerid, params[])
{
	//printf("UÅ¼yta komenda poker");
	new id_pokera = PrzyObiekcie(playerid, 19474, 6);
	if(id_pokera != 0)
	{
		if(ObiektInfo[id_pokera][objRotX] <= -1 || ObiektInfo[id_pokera][objRotX] >= 1 || ObiektInfo[id_pokera][objRotY] <= -1 || ObiektInfo[id_pokera][objRotY] >= 1)
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz do³¹czyæ do gry poniewa¿ pozycja tego sto³u posiada z³e parametry.\nPoprawna pozycja X oraz Y to 0.", "Zamknij", "");
			return 0;
		}
		new Float:rot = ObiektInfo[id_pokera][objRotZ];
		if((rot >= -1 && rot <= 1) || (rot >= 44 && rot <= 46) || (rot >= 89 && rot <= 91) || (rot >= 134 && rot <= 136) || (rot >= 179 && rot <= 181) || (rot >= 224 && rot <= 226) || (rot >= 269 && rot <= 271) || (rot >= 314 && rot <= 316) || (rot >= 359 && rot <= 361)
		|| (rot <= -44 && rot >= -46) || (rot <= -89 && rot >= -91) || (rot <= -134 && rot >= -136) || (rot <= -179 && rot >= -181) || (rot <= -224 && rot >= -226) || (rot <= -269 && rot >= -271) || (rot <= -314 && rot >= -316) || (rot <= -359 && rot >= -361))
		{
			new pelny = 1, gra = 0;
			for(new i = 0; i < 3; i++)
			{
				if(ObiektInfo[id_pokera][objPoker][i] == -1)
				{
					pelny = 0;
				}
				if(ObiektInfo[id_pokera][objPoker][i] == playerid)
				{
					gra = 1;
				}
			}
			if(pelny == 1)
			{
				if(gra == 1)
				{
					dShowPlayerDialog(playerid, DIALOG_POKER_OPUSC, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie grasz w pokera, chcesz opuœcic stó³ od pokera?", "Tak", "Nie");
					return 0;
				}
				else
				{
					dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Przy tym stole jest obecnie maksymalna iloœæ graczy, znajdŸ inny lub poczekaj na zwolnienia miejsca.", "Zamknij", "");
					return 0;
				}
			}
			else
			{
				new mozliwe = -1;
				for(new i = 0; i < 3; i++)
				{
					if(ObiektInfo[id_pokera][objPoker][i] == -1 && mozliwe == -1)
					{
						mozliwe = i;
					}
					if(ObiektInfo[id_pokera][objPoker][i] == playerid)
					{
						gra = 1;
					}
				}
				if(gra != 1 && mozliwe != -1)
				{
					PlayerTextDrawSetString(playerid,KartyGracza1[playerid], "Oczekiwanie...");
					PlayerTextDrawSetString(playerid,KartyGracza11[playerid], "$0");
					PlayerTextDrawSetString(playerid,KartyGracza2[playerid], "Oczekiwanie...");
					PlayerTextDrawSetString(playerid,KartyGracza22[playerid], "$0");
					PlayerTextDrawSetString(playerid,KartyGracza3[playerid], "Oczekiwanie...");
					PlayerTextDrawSetString(playerid,KartyGracza33[playerid], "$0");
					PlayerTextDrawSetString(playerid,KartyGracza4[playerid], "Oczekiwanie...");
					PlayerTextDrawSetString(playerid,KartyGracza44[playerid], "$0");
					PlayerTextDrawSetString(playerid,KartyGracza5[playerid], "Oczekiwanie...");
					PlayerTextDrawSetString(playerid,KartyGracza55[playerid], "$0");
					PlayerTextDrawSetString(playerid,KartyGracza6[playerid], "Oczekiwanie...");
					PlayerTextDrawSetString(playerid,KartyGracza66[playerid], "$0");
					new Float:x, Float:y;
					x = ObiektInfo[id_pokera][objPozX];
					y = ObiektInfo[id_pokera][objPozY];
					switch(mozliwe)
						{
							case 0:{
								if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
								{
									DaneGracza[playerid][gPokx] = x+1.2;
									DaneGracza[playerid][gPoky] = y-0.7;
									DaneGracza[playerid][gPokr] = 90;
								}
								else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
								{
									DaneGracza[playerid][gPokx] = x+1.3;
									DaneGracza[playerid][gPoky] = y+0.4;
									DaneGracza[playerid][gPokr] = 135;
								}
								else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
								{
									DaneGracza[playerid][gPokx] = x+0.7;
									DaneGracza[playerid][gPoky] = y+1.2;
									DaneGracza[playerid][gPokr] = 180;
								}
								else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
								{
									DaneGracza[playerid][gPokx] = x+0.4;
									DaneGracza[playerid][gPoky] = y-1.3;
									DaneGracza[playerid][gPokr] = 45;
								}
							}
							case 1:{
								if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
								{
									DaneGracza[playerid][gPokx] = x-1.2;
									DaneGracza[playerid][gPoky] = y+0.7;
									DaneGracza[playerid][gPokr] = 270;
								}
								else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
								{
									DaneGracza[playerid][gPokx] = x-1.3;
									DaneGracza[playerid][gPoky] = y-0.4;
									DaneGracza[playerid][gPokr] = 315;
								}
								else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
								{
									DaneGracza[playerid][gPokx] = x-0.7;
									DaneGracza[playerid][gPoky] = y-1.2;
									DaneGracza[playerid][gPokr] = 0;
								}
								else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
								{
									DaneGracza[playerid][gPokx] = x-0.4;
									DaneGracza[playerid][gPoky] = y+1.3;
									DaneGracza[playerid][gPokr] = 225;
								}
							}
							case 2:{
								if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
								{
									DaneGracza[playerid][gPokx] = x+1.2;
									DaneGracza[playerid][gPoky] = y+0.7;
									DaneGracza[playerid][gPokr] = 90;
								}
								else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
								{
									DaneGracza[playerid][gPokx] = x+0.4;
									DaneGracza[playerid][gPoky] = y+1.3;
									DaneGracza[playerid][gPokr] = 135;
								}
								else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
								{
									DaneGracza[playerid][gPokx] = x-0.7;
									DaneGracza[playerid][gPoky] = y+1.2;
									DaneGracza[playerid][gPokr] = 180;
								}
								else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
								{
									DaneGracza[playerid][gPokx] = x+1.3;
									DaneGracza[playerid][gPoky] = y-0.4;
									DaneGracza[playerid][gPokr] = 45;
								}
							}
							case 3:{
								if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
								{
									DaneGracza[playerid][gPokx] = x-1.2;
									DaneGracza[playerid][gPoky] = y-0.7;
									DaneGracza[playerid][gPokr] = 270;
								}
								else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
								{
									DaneGracza[playerid][gPokx] = x-0.4;
									DaneGracza[playerid][gPoky] = y-1.3;
									DaneGracza[playerid][gPokr] = 315;
								}
								else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
								{
									DaneGracza[playerid][gPokx] = x+0.7;
									DaneGracza[playerid][gPoky] = y-1.2;
									DaneGracza[playerid][gPokr] = 0;
								}
								else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
								{
									DaneGracza[playerid][gPokx] = x-1.3;
									DaneGracza[playerid][gPoky] = y+0.4;
									DaneGracza[playerid][gPokr] = 225;
								}
							}
							case 4:{
								if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
								{
									DaneGracza[playerid][gPokx] = x;
									DaneGracza[playerid][gPoky] = y-2;
									DaneGracza[playerid][gPokr] = 0;
								}
								else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
								{
									DaneGracza[playerid][gPokx] = x+1.3;
									DaneGracza[playerid][gPoky] = y-1.3;
									DaneGracza[playerid][gPokr] = 45;
								}
								else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
								{
									DaneGracza[playerid][gPokx] = x+2;
									DaneGracza[playerid][gPoky] = y;
									DaneGracza[playerid][gPokr] = 90;
								}
								else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
								{
									DaneGracza[playerid][gPokx] = x-1.3;
									DaneGracza[playerid][gPoky] = y-1.3;
									DaneGracza[playerid][gPokr] = 315;
								}
							}
							case 5:{
								if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
								{
									DaneGracza[playerid][gPokx] = x;
									DaneGracza[playerid][gPoky] = y+2;
									DaneGracza[playerid][gPokr] = 180;
								}
								else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
								{
									DaneGracza[playerid][gPokx] = x-1.3;
									DaneGracza[playerid][gPoky] = y+1.3;
									DaneGracza[playerid][gPokr] = 225;
								}
								else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
								{
									DaneGracza[playerid][gPokx] = x-2;
									DaneGracza[playerid][gPoky] = y;
									DaneGracza[playerid][gPokr] = 270;
								}
								else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
								{
									DaneGracza[playerid][gPokx] = x+1.3;
									DaneGracza[playerid][gPoky] = y+1.3;
									DaneGracza[playerid][gPokr] = 135;
								}
							}
						}
					GraWPokera[playerid] = 0;
					DaneGracza[playerid][gPokz] = ObiektInfo[id_pokera][objPozZ];
					ObiektInfo[id_pokera][objPoker][mozliwe] = playerid;
					DaneGracza[playerid][gPoker] = id_pokera;
					DaneGracza[playerid][gPokerStanowisko] = mozliwe;
					WpisalKase[playerid] = 20;
					Teleportuj(playerid, DaneGracza[playerid][gPokx],DaneGracza[playerid][gPoky],DaneGracza[playerid][gPokz]);
					SetPlayerFacingAngle(playerid,DaneGracza[playerid][gPokr]);
					if(rot >= -1 && rot <= 1 || rot >= 359 && rot <= 361 ||rot <= -179 && rot >= -181 || rot >= 179 && rot <= 181 || rot >= -359 && rot <= -361)
					{
						SetPlayerCameraPos(playerid, ObiektInfo[id_pokera][objPozX]-2.5, ObiektInfo[id_pokera][objPozY]+2.5, ObiektInfo[id_pokera][objPozZ]+2.5);
						SetPlayerCameraLookAt(playerid, ObiektInfo[id_pokera][objPozX], ObiektInfo[id_pokera][objPozY], ObiektInfo[id_pokera][objPozZ]);
					}
					else if(rot >= 44 && rot <= 46 || rot <= -314 && rot >= -316 || rot >= 224 && rot <= 226 || rot <= -134 && rot >= -136)
					{
						SetPlayerCameraPos(playerid, ObiektInfo[id_pokera][objPozX]-3.35, ObiektInfo[id_pokera][objPozY], ObiektInfo[id_pokera][objPozZ]+2.5);
						SetPlayerCameraLookAt(playerid, ObiektInfo[id_pokera][objPozX], ObiektInfo[id_pokera][objPozY], ObiektInfo[id_pokera][objPozZ]);
					}
					else if(rot >= 89 && rot <= 91 || rot <= -269 && rot >= -271 || rot >= 269 && rot <= 271 || rot <= -89 && rot >= -91)
					{
						SetPlayerCameraPos(playerid, ObiektInfo[id_pokera][objPozX]-2.35, ObiektInfo[id_pokera][objPozY]-2.35, ObiektInfo[id_pokera][objPozZ]+2.5);
						SetPlayerCameraLookAt(playerid, ObiektInfo[id_pokera][objPozX], ObiektInfo[id_pokera][objPozY], ObiektInfo[id_pokera][objPozZ]);
					}
					else if(rot >= 134 && rot <= 136 || rot <= -224 && rot >= -226 || rot >= 314 && rot <= 316 || rot <= -44 && rot >= -46)
					{
						SetPlayerCameraPos(playerid, ObiektInfo[id_pokera][objPozX], ObiektInfo[id_pokera][objPozY]+3.35, ObiektInfo[id_pokera][objPozZ]+2.5);
						SetPlayerCameraLookAt(playerid, ObiektInfo[id_pokera][objPozX], ObiektInfo[id_pokera][objPozY], ObiektInfo[id_pokera][objPozZ]);
					}
					TogglePlayerControllable(playerid,0);
					dShowPlayerDialog(playerid, DIALOG_POKER_ZETONY, DIALOG_STYLE_INPUT, "• TIP:", "W³asnie do³¹czy³eœ do gry w pokera, w poni¿sze pole wpisz kwotê jaka ma byæ przeznaczona na zakup ¿etonów.\n100$ to 1000$ w ¿etonach, maksymalna iloœæ 2000$.", "Zatwierdz", "Zamknij");
					return 0;
				}
				else if(gra == 1)
				{
					dShowPlayerDialog(playerid, DIALOG_POKER_OPUSC, DIALOG_STYLE_MSGBOX, "• TIP:", "Aktualnie grasz w pokera, chcesz opuœcic stó³ od pokera?", "Tak", "Nie");
					return 0;
				}
			}
		}
		else
		{
			dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie mo¿esz do³¹czyæ do gry poniewa¿ rotacja tego sto³u posiada z³e parametry. (0, 90, 180 itd)", "Zamknij", "");
			return 0;
		}
	}
	else
	{
		dShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, "• TIP:", "Nie znajdujesz sie obok sto³u do pokera (ID obiektu: 19474).", "Zamknij", "");
		return 0;
	}
	return 1;
}
