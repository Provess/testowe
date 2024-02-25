			AntyDeAMX();
			//Uprawnienie 1
			forward ZaladujUprawnieniag1u1(playerid);
			public ZaladujUprawnieniag1u1(playerid)
			{
				new sqlg1u1[512];
				format(sqlg1u1, sizeof(sqlg1u1), "SELECT `1` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u1);
				mysql_store_result();
				mysql_fetch_row(sqlg1u1);
				sscanf(sqlg1u1, "p<|>d", DaneGracza[playerid][g1u1]);
				return 1;
			}
			forward ZaladujUprawnieniag2u1(playerid);
			public ZaladujUprawnieniag2u1(playerid)
			{
				new sqlg2u1[512];
				format(sqlg2u1, sizeof(sqlg2u1), "SELECT `1` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u1);
				mysql_store_result();
				mysql_fetch_row(sqlg2u1);
				sscanf(sqlg2u1, "p<|>d", DaneGracza[playerid][g2u1]);
				return 1;
			}
			forward ZaladujUprawnieniag3u1(playerid);
			public ZaladujUprawnieniag3u1(playerid)
			{
				new sqlg3u1[512];
				format(sqlg3u1, sizeof(sqlg3u1), "SELECT `1` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u1);
				mysql_store_result();
				mysql_fetch_row(sqlg3u1);
				sscanf(sqlg3u1, "p<|>d", DaneGracza[playerid][g3u1]);
				return 1;
			}
			forward ZaladujUprawnieniag4u1(playerid);
			public ZaladujUprawnieniag4u1(playerid)
			{
				new sqlg4u1[512];
				format(sqlg4u1, sizeof(sqlg4u1), "SELECT `1` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u1);
				mysql_store_result();
				mysql_fetch_row(sqlg4u1);
				sscanf(sqlg4u1, "p<|>d", DaneGracza[playerid][g4u1]);
				return 1;
			}
			forward ZaladujUprawnieniag5u1(playerid);
			public ZaladujUprawnieniag5u1(playerid)
			{
				new sqlg5u1[512];
				format(sqlg5u1, sizeof(sqlg5u1), "SELECT `1` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u1);
				mysql_store_result();
				mysql_fetch_row(sqlg5u1);
				sscanf(sqlg5u1, "p<|>d", DaneGracza[playerid][g5u1]);
				return 1;
			}
			forward ZaladujUprawnieniag6u1(playerid);
			public ZaladujUprawnieniag6u1(playerid)
			{
				new sqlg6u1[512];
				format(sqlg6u1, sizeof(sqlg6u1), "SELECT `1` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u1);
				mysql_store_result();
				mysql_fetch_row(sqlg6u1);
				sscanf(sqlg6u1, "p<|>d", DaneGracza[playerid][g6u1]);
				return 1;
			}
			//Uprawnienie 2
			forward ZaladujUprawnieniag1u2(playerid);
			public ZaladujUprawnieniag1u2(playerid)
			{
				new sqlg1u2[512];
				format(sqlg1u2, sizeof(sqlg1u2), "SELECT `2` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u2);
				mysql_store_result();
				mysql_fetch_row(sqlg1u2);
				sscanf(sqlg1u2, "p<|>d", DaneGracza[playerid][g1u2]);
				return 1;
			}
			forward ZaladujUprawnieniag2u2(playerid);
			public ZaladujUprawnieniag2u2(playerid)
			{
				new sqlg2u2[512];
				format(sqlg2u2, sizeof(sqlg2u2), "SELECT `2` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u2);
				mysql_store_result();
				mysql_fetch_row(sqlg2u2);
				sscanf(sqlg2u2, "p<|>d", DaneGracza[playerid][g2u2]);
				return 1;
			}
			forward ZaladujUprawnieniag3u2(playerid);
			public ZaladujUprawnieniag3u2(playerid)
			{
				new sqlg3u2[512];
				format(sqlg3u2, sizeof(sqlg3u2), "SELECT `2` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u2);
				mysql_store_result();
				mysql_fetch_row(sqlg3u2);
				sscanf(sqlg3u2, "p<|>d", DaneGracza[playerid][g3u2]);
				return 1;
			}
			forward ZaladujUprawnieniag4u2(playerid);
			public ZaladujUprawnieniag4u2(playerid)
			{
				new sqlg4u2[512];
				format(sqlg4u2, sizeof(sqlg4u2), "SELECT `2` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u2);
				mysql_store_result();
				mysql_fetch_row(sqlg4u2);
				sscanf(sqlg4u2, "p<|>d", DaneGracza[playerid][g4u2]);
				return 1;
			}
			forward ZaladujUprawnieniag5u2(playerid);
			public ZaladujUprawnieniag5u2(playerid)
			{
				new sqlg5u2[512];
				format(sqlg5u2, sizeof(sqlg5u2), "SELECT `2` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u2);
				mysql_store_result();
				mysql_fetch_row(sqlg5u2);
				sscanf(sqlg5u2, "p<|>d", DaneGracza[playerid][g5u2]);
				return 1;
			}
			forward ZaladujUprawnieniag6u2(playerid);
			public ZaladujUprawnieniag6u2(playerid)
			{
				new sqlg6u2[512];
				format(sqlg6u2, sizeof(sqlg6u2), "SELECT `2` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u2);
				mysql_store_result();
				mysql_fetch_row(sqlg6u2);
				sscanf(sqlg6u2, "p<|>d", DaneGracza[playerid][g6u2]);
				return 1;
			}
			//Uprawnienie 3
			forward ZaladujUprawnieniag1u3(playerid);
			public ZaladujUprawnieniag1u3(playerid)
			{
				new sqlg1u3[512];
				format(sqlg1u3, sizeof(sqlg1u3), "SELECT `3` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u3);
				mysql_store_result();
				mysql_fetch_row(sqlg1u3);
				sscanf(sqlg1u3, "p<|>d", DaneGracza[playerid][g1u3]);
				return 1;
			}
			forward ZaladujUprawnieniag2u3(playerid);
			public ZaladujUprawnieniag2u3(playerid)
			{
				new sqlg2u3[512];
				format(sqlg2u3, sizeof(sqlg2u3), "SELECT `3` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u3);
				mysql_store_result();
				mysql_fetch_row(sqlg2u3);
				sscanf(sqlg2u3, "p<|>d", DaneGracza[playerid][g2u3]);
				return 1;
			}
			forward ZaladujUprawnieniag3u3(playerid);
			public ZaladujUprawnieniag3u3(playerid)
			{
				new sqlg3u3[512];
				format(sqlg3u3, sizeof(sqlg3u3), "SELECT `3` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u3);
				mysql_store_result();
				mysql_fetch_row(sqlg3u3);
				sscanf(sqlg3u3, "p<|>d", DaneGracza[playerid][g3u3]);
				return 1;
			}
			forward ZaladujUprawnieniag4u3(playerid);
			public ZaladujUprawnieniag4u3(playerid)
			{
				new sqlg4u3[512];
				format(sqlg4u3, sizeof(sqlg4u3), "SELECT `3` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u3);
				mysql_store_result();
				mysql_fetch_row(sqlg4u3);
				sscanf(sqlg4u3, "p<|>d", DaneGracza[playerid][g4u3]);
				return 1;
			}
			forward ZaladujUprawnieniag5u3(playerid);
			public ZaladujUprawnieniag5u3(playerid)
			{
				new sqlg5u3[512];
				format(sqlg5u3, sizeof(sqlg5u3), "SELECT `3` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u3);
				mysql_store_result();
				mysql_fetch_row(sqlg5u3);
				sscanf(sqlg5u3, "p<|>d", DaneGracza[playerid][g5u3]);
				return 1;
			}
			forward ZaladujUprawnieniag6u3(playerid);
			public ZaladujUprawnieniag6u3(playerid)
			{
				new sqlg6u3[512];
				format(sqlg6u3, sizeof(sqlg6u3), "SELECT `3` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u3);
				mysql_store_result();
				mysql_fetch_row(sqlg6u3);
				sscanf(sqlg6u3, "p<|>d", DaneGracza[playerid][g6u3]);
				return 1;
			}
			//Uprawnienie 4
			forward ZaladujUprawnieniag1u4(playerid);
			public ZaladujUprawnieniag1u4(playerid)
			{
				new sqlg1u4[512];
				format(sqlg1u4, sizeof(sqlg1u4), "SELECT `4` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u4);
				mysql_store_result();
				mysql_fetch_row(sqlg1u4);
				sscanf(sqlg1u4, "p<|>d", DaneGracza[playerid][g1u4]);
				return 1;
			}
			forward ZaladujUprawnieniag2u4(playerid);
			public ZaladujUprawnieniag2u4(playerid)
			{
				new sqlg2u4[512];
				format(sqlg2u4, sizeof(sqlg2u4), "SELECT `4` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u4);
				mysql_store_result();
				mysql_fetch_row(sqlg2u4);
				sscanf(sqlg2u4, "p<|>d", DaneGracza[playerid][g2u4]);
				return 1;
			}
			forward ZaladujUprawnieniag3u4(playerid);
			public ZaladujUprawnieniag3u4(playerid)
			{
				new sqlg3u4[512];
				format(sqlg3u4, sizeof(sqlg3u4), "SELECT `4` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u4);
				mysql_store_result();
				mysql_fetch_row(sqlg3u4);
				sscanf(sqlg3u4, "p<|>d", DaneGracza[playerid][g3u4]);
				return 1;
			}
			forward ZaladujUprawnieniag4u4(playerid);
			public ZaladujUprawnieniag4u4(playerid)
			{
				new sqlg4u4[512];
				format(sqlg4u4, sizeof(sqlg4u4), "SELECT `4` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u4);
				mysql_store_result();
				mysql_fetch_row(sqlg4u4);
				sscanf(sqlg4u4, "p<|>d", DaneGracza[playerid][g4u4]);
				return 1;
			}
			forward ZaladujUprawnieniag5u4(playerid);
			public ZaladujUprawnieniag5u4(playerid)
			{
				new sqlg5u4[512];
				format(sqlg5u4, sizeof(sqlg5u4), "SELECT `4` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u4);
				mysql_store_result();
				mysql_fetch_row(sqlg5u4);
				sscanf(sqlg5u4, "p<|>d", DaneGracza[playerid][g5u4]);
				return 1;
			}
			forward ZaladujUprawnieniag6u4(playerid);
			public ZaladujUprawnieniag6u4(playerid)
			{
				new sqlg6u4[512];
				format(sqlg6u4, sizeof(sqlg6u4), "SELECT `4` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u4);
				mysql_store_result();
				mysql_fetch_row(sqlg6u4);
				sscanf(sqlg6u4, "p<|>d", DaneGracza[playerid][g6u4]);
				return 1;
			}
			//Uprawnienie 5
			forward ZaladujUprawnieniag1u5(playerid);
			public ZaladujUprawnieniag1u5(playerid)
			{
				new sqlg1u5[512];
				format(sqlg1u5, sizeof(sqlg1u5), "SELECT `5` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u5);
				mysql_store_result();
				mysql_fetch_row(sqlg1u5);
				sscanf(sqlg1u5, "p<|>d", DaneGracza[playerid][g1u5]);
				return 1;
			}
			forward ZaladujUprawnieniag2u5(playerid);
			public ZaladujUprawnieniag2u5(playerid)
			{
				new sqlg2u5[512];
				format(sqlg2u5, sizeof(sqlg2u5), "SELECT `5` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u5);
				mysql_store_result();
				mysql_fetch_row(sqlg2u5);
				sscanf(sqlg2u5, "p<|>d", DaneGracza[playerid][g2u5]);
				return 1;
			}
			forward ZaladujUprawnieniag3u5(playerid);
			public ZaladujUprawnieniag3u5(playerid)
			{
				new sqlg3u5[512];
				format(sqlg3u5, sizeof(sqlg3u5), "SELECT `5` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u5);
				mysql_store_result();
				mysql_fetch_row(sqlg3u5);
				sscanf(sqlg3u5, "p<|>d", DaneGracza[playerid][g3u5]);
				return 1;
			}
			forward ZaladujUprawnieniag4u5(playerid);
			public ZaladujUprawnieniag4u5(playerid)
			{
				new sqlg4u5[512];
				format(sqlg4u5, sizeof(sqlg4u5), "SELECT `5` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u5);
				mysql_store_result();
				mysql_fetch_row(sqlg4u5);
				sscanf(sqlg4u5, "p<|>d", DaneGracza[playerid][g4u5]);
				return 1;
			}
			forward ZaladujUprawnieniag5u5(playerid);
			public ZaladujUprawnieniag5u5(playerid)
			{
				new sqlg5u5[512];
				format(sqlg5u5, sizeof(sqlg5u5), "SELECT `5` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u5);
				mysql_store_result();
				mysql_fetch_row(sqlg5u5);
				sscanf(sqlg5u5, "p<|>d", DaneGracza[playerid][g5u5]);
				return 1;
			}
			forward ZaladujUprawnieniag6u5(playerid);
			public ZaladujUprawnieniag6u5(playerid)
			{
				new sqlg6u5[512];
				format(sqlg6u5, sizeof(sqlg6u5), "SELECT `5` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u5);
				mysql_store_result();
				mysql_fetch_row(sqlg6u5);
				sscanf(sqlg6u5, "p<|>d", DaneGracza[playerid][g6u5]);
				return 1;
			}
			//Uprawnienie 6
			forward ZaladujUprawnieniag1u6(playerid);
			public ZaladujUprawnieniag1u6(playerid)
			{
				new sqlg1u6[512];
				format(sqlg1u6, sizeof(sqlg1u6), "SELECT `6` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u6);
				mysql_store_result();
				mysql_fetch_row(sqlg1u6);
				sscanf(sqlg1u6, "p<|>d", DaneGracza[playerid][g1u6]);
				return 1;
			}
			forward ZaladujUprawnieniag2u6(playerid);
			public ZaladujUprawnieniag2u6(playerid)
			{
				new sqlg2u6[512];
				format(sqlg2u6, sizeof(sqlg2u6), "SELECT `6` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u6);
				mysql_store_result();
				mysql_fetch_row(sqlg2u6);
				sscanf(sqlg2u6, "p<|>d", DaneGracza[playerid][g2u6]);
				return 1;
			}
			forward ZaladujUprawnieniag3u6(playerid);
			public ZaladujUprawnieniag3u6(playerid)
			{
				new sqlg3u6[512];
				format(sqlg3u6, sizeof(sqlg3u6), "SELECT `6` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u6);
				mysql_store_result();
				mysql_fetch_row(sqlg3u6);
				sscanf(sqlg3u6, "p<|>d", DaneGracza[playerid][g3u6]);
				return 1;
			}
			forward ZaladujUprawnieniag4u6(playerid);
			public ZaladujUprawnieniag4u6(playerid)
			{
				new sqlg4u6[512];
				format(sqlg4u6, sizeof(sqlg4u6), "SELECT `6` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u6);
				mysql_store_result();
				mysql_fetch_row(sqlg4u6);
				sscanf(sqlg4u6, "p<|>d", DaneGracza[playerid][g4u6]);
				return 1;
			}
			forward ZaladujUprawnieniag5u6(playerid);
			public ZaladujUprawnieniag5u6(playerid)
			{
				new sqlg5u6[512];
				format(sqlg5u6, sizeof(sqlg5u6), "SELECT `6` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u6);
				mysql_store_result();
				mysql_fetch_row(sqlg5u6);
				sscanf(sqlg5u6, "p<|>d", DaneGracza[playerid][g5u6]);
				return 1;
			}
			forward ZaladujUprawnieniag6u6(playerid);
			public ZaladujUprawnieniag6u6(playerid)
			{
				new sqlg6u6[512];
				format(sqlg6u6, sizeof(sqlg6u6), "SELECT `6` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u6);
				mysql_store_result();
				mysql_fetch_row(sqlg6u6);
				sscanf(sqlg6u6, "p<|>d", DaneGracza[playerid][g6u6]);
				return 1;
			}
			//Uprawnienie 7
			forward ZaladujUprawnieniag1u7(playerid);
			public ZaladujUprawnieniag1u7(playerid)
			{
				new sqlg1u7[512];
				format(sqlg1u7, sizeof(sqlg1u7), "SELECT `7` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u7);
				mysql_store_result();
				mysql_fetch_row(sqlg1u7);
				sscanf(sqlg1u7, "p<|>d", DaneGracza[playerid][g1u7]);
				return 1;
			}
			forward ZaladujUprawnieniag2u7(playerid);
			public ZaladujUprawnieniag2u7(playerid)
			{
				new sqlg2u7[512];
				format(sqlg2u7, sizeof(sqlg2u7), "SELECT `7` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u7);
				mysql_store_result();
				mysql_fetch_row(sqlg2u7);
				sscanf(sqlg2u7, "p<|>d", DaneGracza[playerid][g2u7]);
				return 1;
			}
			forward ZaladujUprawnieniag3u7(playerid);
			public ZaladujUprawnieniag3u7(playerid)
			{
				new sqlg3u7[512];
				format(sqlg3u7, sizeof(sqlg3u7), "SELECT `7` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u7);
				mysql_store_result();
				mysql_fetch_row(sqlg3u7);
				sscanf(sqlg3u7, "p<|>d", DaneGracza[playerid][g3u7]);
				return 1;
			}
			forward ZaladujUprawnieniag4u7(playerid);
			public ZaladujUprawnieniag4u7(playerid)
			{
				new sqlg4u7[512];
				format(sqlg4u7, sizeof(sqlg4u7), "SELECT `7` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u7);
				mysql_store_result();
				mysql_fetch_row(sqlg4u7);
				sscanf(sqlg4u7, "p<|>d", DaneGracza[playerid][g4u7]);
				return 1;
			}
			forward ZaladujUprawnieniag5u7(playerid);
			public ZaladujUprawnieniag5u7(playerid)
			{
				new sqlg5u7[512];
				format(sqlg5u7, sizeof(sqlg5u7), "SELECT `7` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u7);
				mysql_store_result();
				mysql_fetch_row(sqlg5u7);
				sscanf(sqlg5u7, "p<|>d", DaneGracza[playerid][g5u7]);
				return 1;
			}
			forward ZaladujUprawnieniag6u7(playerid);
			public ZaladujUprawnieniag6u7(playerid)
			{
				new sqlg6u7[512];
				format(sqlg6u7, sizeof(sqlg6u7), "SELECT `7` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u7);
				mysql_store_result();
				mysql_fetch_row(sqlg6u7);
				sscanf(sqlg6u7, "p<|>d", DaneGracza[playerid][g6u7]);
				return 1;
			}
			//Uprawnienie 8
			forward ZaladujUprawnieniag1u8(playerid);
			public ZaladujUprawnieniag1u8(playerid)
			{
				new sqlg1u8[512];
				format(sqlg1u8, sizeof(sqlg1u8), "SELECT `8` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u8);
				mysql_store_result();
				mysql_fetch_row(sqlg1u8);
				sscanf(sqlg1u8, "p<|>d", DaneGracza[playerid][g1u8]);
				return 1;
			}
			forward ZaladujUprawnieniag2u8(playerid);
			public ZaladujUprawnieniag2u8(playerid)
			{
				new sqlg2u8[512];
				format(sqlg2u8, sizeof(sqlg2u8), "SELECT `8` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u8);
				mysql_store_result();
				mysql_fetch_row(sqlg2u8);
				sscanf(sqlg2u8, "p<|>d", DaneGracza[playerid][g2u8]);
				return 1;
			}
			forward ZaladujUprawnieniag3u8(playerid);
			public ZaladujUprawnieniag3u8(playerid)
			{
				new sqlg3u8[512];
				format(sqlg3u8, sizeof(sqlg3u8), "SELECT `8` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u8);
				mysql_store_result();
				mysql_fetch_row(sqlg3u8);
				sscanf(sqlg3u8, "p<|>d", DaneGracza[playerid][g3u8]);
				return 1;
			}
			forward ZaladujUprawnieniag4u8(playerid);
			public ZaladujUprawnieniag4u8(playerid)
			{
				new sqlg4u8[512];
				format(sqlg4u8, sizeof(sqlg4u8), "SELECT `8` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u8);
				mysql_store_result();
				mysql_fetch_row(sqlg4u8);
				sscanf(sqlg4u8, "p<|>d", DaneGracza[playerid][g4u8]);
				return 1;
			}
			forward ZaladujUprawnieniag5u8(playerid);
			public ZaladujUprawnieniag5u8(playerid)
			{
				new sqlg5u8[512];
				format(sqlg5u8, sizeof(sqlg5u8), "SELECT `8` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u8);
				mysql_store_result();
				mysql_fetch_row(sqlg5u8);
				sscanf(sqlg5u8, "p<|>d", DaneGracza[playerid][g5u8]);
				return 1;
			}
			forward ZaladujUprawnieniag6u8(playerid);
			public ZaladujUprawnieniag6u8(playerid)
			{
				new sqlg6u8[512];
				format(sqlg6u8, sizeof(sqlg6u8), "SELECT `8` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u8);
				mysql_store_result();
				mysql_fetch_row(sqlg6u8);
				sscanf(sqlg6u8, "p<|>d", DaneGracza[playerid][g6u8]);
				return 1;
			}
			//Uprawnienie 9
			forward ZaladujUprawnieniag1u9(playerid);
			public ZaladujUprawnieniag1u9(playerid)
			{
				new sqlg1u9[512];
				format(sqlg1u9, sizeof(sqlg1u9), "SELECT `9` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u9);
				mysql_store_result();
				mysql_fetch_row(sqlg1u9);
				sscanf(sqlg1u9, "p<|>d", DaneGracza[playerid][g1u9]);
				return 1;
			}
			forward ZaladujUprawnieniag2u9(playerid);
			public ZaladujUprawnieniag2u9(playerid)
			{
				new sqlg2u9[512];
				format(sqlg2u9, sizeof(sqlg2u9), "SELECT `9` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u9);
				mysql_store_result();
				mysql_fetch_row(sqlg2u9);
				sscanf(sqlg2u9, "p<|>d", DaneGracza[playerid][g2u9]);
				return 1;
			}
			forward ZaladujUprawnieniag3u9(playerid);
			public ZaladujUprawnieniag3u9(playerid)
			{
				new sqlg3u9[512];
				format(sqlg3u9, sizeof(sqlg3u9), "SELECT `9` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u9);
				mysql_store_result();
				mysql_fetch_row(sqlg3u9);
				sscanf(sqlg3u9, "p<|>d", DaneGracza[playerid][g3u9]);
				return 1;
			}
			forward ZaladujUprawnieniag4u9(playerid);
			public ZaladujUprawnieniag4u9(playerid)
			{
				new sqlg4u9[512];
				format(sqlg4u9, sizeof(sqlg4u9), "SELECT `9` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u9);
				mysql_store_result();
				mysql_fetch_row(sqlg4u9);
				sscanf(sqlg4u9, "p<|>d", DaneGracza[playerid][g4u9]);
				return 1;
			}
			forward ZaladujUprawnieniag5u9(playerid);
			public ZaladujUprawnieniag5u9(playerid)
			{
				new sqlg5u9[512];
				format(sqlg5u9, sizeof(sqlg5u9), "SELECT `9` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u9);
				mysql_store_result();
				mysql_fetch_row(sqlg5u9);
				sscanf(sqlg5u9, "p<|>d", DaneGracza[playerid][g5u9]);
				return 1;
			}
			forward ZaladujUprawnieniag6u9(playerid);
			public ZaladujUprawnieniag6u9(playerid)
			{
				new sqlg6u9[512];
				format(sqlg6u9, sizeof(sqlg6u9), "SELECT `9` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u9);
				mysql_store_result();
				mysql_fetch_row(sqlg6u9);
				sscanf(sqlg6u9, "p<|>d", DaneGracza[playerid][g6u9]);
				return 1;
			}
			//Uprawnienie 10
			forward ZaladujUprawnieniag1u10(playerid);
			public ZaladujUprawnieniag1u10(playerid)
			{
				new sqlg1u10[512];
				format(sqlg1u10, sizeof(sqlg1u10), "SELECT `10` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u10);
				mysql_store_result();
				mysql_fetch_row(sqlg1u10);
				sscanf(sqlg1u10, "p<|>d", DaneGracza[playerid][g1u10]);
				return 1;
			}
			forward ZaladujUprawnieniag2u10(playerid);
			public ZaladujUprawnieniag2u10(playerid)
			{
				new sqlg2u10[512];
				format(sqlg2u10, sizeof(sqlg2u10), "SELECT `10` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u10);
				mysql_store_result();
				mysql_fetch_row(sqlg2u10);
				sscanf(sqlg2u10, "p<|>d", DaneGracza[playerid][g2u10]);
				return 1;
			}
			forward ZaladujUprawnieniag3u10(playerid);
			public ZaladujUprawnieniag3u10(playerid)
			{
				new sqlg3u10[512];
				format(sqlg3u10, sizeof(sqlg3u10), "SELECT `10` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u10);
				mysql_store_result();
				mysql_fetch_row(sqlg3u10);
				sscanf(sqlg3u10, "p<|>d", DaneGracza[playerid][g3u10]);
				return 1;
			}
			forward ZaladujUprawnieniag4u10(playerid);
			public ZaladujUprawnieniag4u10(playerid)
			{
				new sqlg4u10[512];
				format(sqlg4u10, sizeof(sqlg4u10), "SELECT `10` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u10);
				mysql_store_result();
				mysql_fetch_row(sqlg4u10);
				sscanf(sqlg4u10, "p<|>d", DaneGracza[playerid][g4u10]);
				return 1;
			}
			forward ZaladujUprawnieniag5u10(playerid);
			public ZaladujUprawnieniag5u10(playerid)
			{
				new sqlg5u10[512];
				format(sqlg5u10, sizeof(sqlg5u10), "SELECT `10` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u10);
				mysql_store_result();
				mysql_fetch_row(sqlg5u10);
				sscanf(sqlg5u10, "p<|>d", DaneGracza[playerid][g5u10]);
				return 1;
			}
			forward ZaladujUprawnieniag6u10(playerid);
			public ZaladujUprawnieniag6u10(playerid)
			{
				new sqlg6u10[512];
				format(sqlg6u10, sizeof(sqlg6u10), "SELECT `10` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u10);
				mysql_store_result();
				mysql_fetch_row(sqlg6u10);
				sscanf(sqlg6u10, "p<|>d", DaneGracza[playerid][g6u10]);
				return 1;
			}
			//Uprawnienie 11
			forward ZaladujUprawnieniag1u11(playerid);
			public ZaladujUprawnieniag1u11(playerid)
			{
				new sqlg1u11[512];
				format(sqlg1u11, sizeof(sqlg1u11), "SELECT `11` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u11);
				mysql_store_result();
				mysql_fetch_row(sqlg1u11);
				sscanf(sqlg1u11, "p<|>d", DaneGracza[playerid][g1u11]);
				return 1;
			}
			forward ZaladujUprawnieniag2u11(playerid);
			public ZaladujUprawnieniag2u11(playerid)
			{
				new sqlg2u11[512];
				format(sqlg2u11, sizeof(sqlg2u11), "SELECT `11` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u11);
				mysql_store_result();
				mysql_fetch_row(sqlg2u11);
				sscanf(sqlg2u11, "p<|>d", DaneGracza[playerid][g2u11]);
				return 1;
			}
			forward ZaladujUprawnieniag3u11(playerid);
			public ZaladujUprawnieniag3u11(playerid)
			{
				new sqlg3u11[512];
				format(sqlg3u11, sizeof(sqlg3u11), "SELECT `11` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u11);
				mysql_store_result();
				mysql_fetch_row(sqlg3u11);
				sscanf(sqlg3u11, "p<|>d", DaneGracza[playerid][g3u11]);
				return 1;
			}
			forward ZaladujUprawnieniag4u11(playerid);
			public ZaladujUprawnieniag4u11(playerid)
			{
				new sqlg4u11[512];
				format(sqlg4u11, sizeof(sqlg4u11), "SELECT `11` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u11);
				mysql_store_result();
				mysql_fetch_row(sqlg4u11);
				sscanf(sqlg4u11, "p<|>d", DaneGracza[playerid][g4u11]);
				return 1;
			}
			forward ZaladujUprawnieniag5u11(playerid);
			public ZaladujUprawnieniag5u11(playerid)
			{
				new sqlg5u11[512];
				format(sqlg5u11, sizeof(sqlg5u11), "SELECT `11` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u11);
				mysql_store_result();
				mysql_fetch_row(sqlg5u11);
				sscanf(sqlg5u11, "p<|>d", DaneGracza[playerid][g5u11]);
				return 1;
			}
			forward ZaladujUprawnieniag6u11(playerid);
			public ZaladujUprawnieniag6u11(playerid)
			{
				new sqlg6u11[512];
				format(sqlg6u11, sizeof(sqlg6u11), "SELECT `11` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u11);
				mysql_store_result();
				mysql_fetch_row(sqlg6u11);
				sscanf(sqlg6u11, "p<|>d", DaneGracza[playerid][g6u11]);
				return 1;
			}
			//Uprawnienie 12
			forward ZaladujUprawnieniag1u12(playerid);
			public ZaladujUprawnieniag1u12(playerid)
			{
				new sqlg1u12[512];
				format(sqlg1u12, sizeof(sqlg1u12), "SELECT `12` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u12);
				mysql_store_result();
				mysql_fetch_row(sqlg1u12);
				sscanf(sqlg1u12, "p<|>d", DaneGracza[playerid][g1u12]);
				return 1;
			}
			forward ZaladujUprawnieniag2u12(playerid);
			public ZaladujUprawnieniag2u12(playerid)
			{
				new sqlg2u12[512];
				format(sqlg2u12, sizeof(sqlg2u12), "SELECT `12` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u12);
				mysql_store_result();
				mysql_fetch_row(sqlg2u12);
				sscanf(sqlg2u12, "p<|>d", DaneGracza[playerid][g2u12]);
				return 1;
			}
			forward ZaladujUprawnieniag3u12(playerid);
			public ZaladujUprawnieniag3u12(playerid)
			{
				new sqlg3u12[512];
				format(sqlg3u12, sizeof(sqlg3u12), "SELECT `12` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u12);
				mysql_store_result();
				mysql_fetch_row(sqlg3u12);
				sscanf(sqlg3u12, "p<|>d", DaneGracza[playerid][g3u12]);
				return 1;
			}
			forward ZaladujUprawnieniag4u12(playerid);
			public ZaladujUprawnieniag4u12(playerid)
			{
				new sqlg4u12[512];
				format(sqlg4u12, sizeof(sqlg4u12), "SELECT `12` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u12);
				mysql_store_result();
				mysql_fetch_row(sqlg4u12);
				sscanf(sqlg4u12, "p<|>d", DaneGracza[playerid][g4u12]);
				return 1;
			}
			forward ZaladujUprawnieniag5u12(playerid);
			public ZaladujUprawnieniag5u12(playerid)
			{
				new sqlg5u12[512];
				format(sqlg5u12, sizeof(sqlg5u12), "SELECT `12` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u12);
				mysql_store_result();
				mysql_fetch_row(sqlg5u12);
				sscanf(sqlg5u12, "p<|>d", DaneGracza[playerid][g5u12]);
				return 1;
			}
			forward ZaladujUprawnieniag6u12(playerid);
			public ZaladujUprawnieniag6u12(playerid)
			{
				new sqlg6u12[512];
				format(sqlg6u12, sizeof(sqlg6u12), "SELECT `12` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u12);
				mysql_store_result();
				mysql_fetch_row(sqlg6u12);
				sscanf(sqlg6u12, "p<|>d", DaneGracza[playerid][g6u12]);
				return 1;
			}
			//Uprawnienie 13
			forward ZaladujUprawnieniag1u13(playerid);
			public ZaladujUprawnieniag1u13(playerid)
			{
				new sqlg1u13[512];
				format(sqlg1u13, sizeof(sqlg1u13), "SELECT `13` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u13);
				mysql_store_result();
				mysql_fetch_row(sqlg1u13);
				sscanf(sqlg1u13, "p<|>d", DaneGracza[playerid][g1u13]);
				return 1;
			}
			forward ZaladujUprawnieniag2u13(playerid);
			public ZaladujUprawnieniag2u13(playerid)
			{
				new sqlg2u13[512];
				format(sqlg2u13, sizeof(sqlg2u13), "SELECT `13` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u13);
				mysql_store_result();
				mysql_fetch_row(sqlg2u13);
				sscanf(sqlg2u13, "p<|>d", DaneGracza[playerid][g2u13]);
				return 1;
			}
			forward ZaladujUprawnieniag3u13(playerid);
			public ZaladujUprawnieniag3u13(playerid)
			{
				new sqlg3u13[512];
				format(sqlg3u13, sizeof(sqlg3u13), "SELECT `13` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u13);
				mysql_store_result();
				mysql_fetch_row(sqlg3u13);
				sscanf(sqlg3u13, "p<|>d", DaneGracza[playerid][g3u13]);
				return 1;
			}
			forward ZaladujUprawnieniag4u13(playerid);
			public ZaladujUprawnieniag4u13(playerid)
			{
				new sqlg4u13[512];
				format(sqlg4u13, sizeof(sqlg4u13), "SELECT `13` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u13);
				mysql_store_result();
				mysql_fetch_row(sqlg4u13);
				sscanf(sqlg4u13, "p<|>d", DaneGracza[playerid][g4u13]);
				return 1;
			}
			forward ZaladujUprawnieniag5u13(playerid);
			public ZaladujUprawnieniag5u13(playerid)
			{
				new sqlg5u13[512];
				format(sqlg5u13, sizeof(sqlg5u13), "SELECT `13` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u13);
				mysql_store_result();
				mysql_fetch_row(sqlg5u13);
				sscanf(sqlg5u13, "p<|>d", DaneGracza[playerid][g5u13]);
				return 1;
			}
			forward ZaladujUprawnieniag6u13(playerid);
			public ZaladujUprawnieniag6u13(playerid)
			{
				new sqlg6u13[512];
				format(sqlg6u13, sizeof(sqlg6u13), "SELECT `13` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u13);
				mysql_store_result();
				mysql_fetch_row(sqlg6u13);
				sscanf(sqlg6u13, "p<|>d", DaneGracza[playerid][g6u13]);
				return 1;
			}
			//Uprawnienie 14
			forward ZaladujUprawnieniag1u14(playerid);
			public ZaladujUprawnieniag1u14(playerid)
			{
				new sqlg1u14[512];
				format(sqlg1u14, sizeof(sqlg1u14), "SELECT `14` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u14);
				mysql_store_result();
				mysql_fetch_row(sqlg1u14);
				sscanf(sqlg1u14, "p<|>d", DaneGracza[playerid][g1u14]);
				return 1;
			}
			forward ZaladujUprawnieniag2u14(playerid);
			public ZaladujUprawnieniag2u14(playerid)
			{
				new sqlg2u14[512];
				format(sqlg2u14, sizeof(sqlg2u14), "SELECT `14` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u14);
				mysql_store_result();
				mysql_fetch_row(sqlg2u14);
				sscanf(sqlg2u14, "p<|>d", DaneGracza[playerid][g2u14]);
				return 1;
			}
			forward ZaladujUprawnieniag3u14(playerid);
			public ZaladujUprawnieniag3u14(playerid)
			{
				new sqlg3u14[512];
				format(sqlg3u14, sizeof(sqlg3u14), "SELECT `14` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u14);
				mysql_store_result();
				mysql_fetch_row(sqlg3u14);
				sscanf(sqlg3u14, "p<|>d", DaneGracza[playerid][g3u14]);
				return 1;
			}
			forward ZaladujUprawnieniag4u14(playerid);
			public ZaladujUprawnieniag4u14(playerid)
			{
				new sqlg4u14[512];
				format(sqlg4u14, sizeof(sqlg4u14), "SELECT `14` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u14);
				mysql_store_result();
				mysql_fetch_row(sqlg4u14);
				sscanf(sqlg4u14, "p<|>d", DaneGracza[playerid][g4u14]);
				return 1;
			}
			forward ZaladujUprawnieniag5u14(playerid);
			public ZaladujUprawnieniag5u14(playerid)
			{
				new sqlg5u14[512];
				format(sqlg5u14, sizeof(sqlg5u14), "SELECT `14` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u14);
				mysql_store_result();
				mysql_fetch_row(sqlg5u14);
				sscanf(sqlg5u14, "p<|>d", DaneGracza[playerid][g5u14]);
				return 1;
			}
			forward ZaladujUprawnieniag6u14(playerid);
			public ZaladujUprawnieniag6u14(playerid)
			{
				new sqlg6u14[512];
				format(sqlg6u14, sizeof(sqlg6u14), "SELECT `14` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u14);
				mysql_store_result();
				mysql_fetch_row(sqlg6u14);
				sscanf(sqlg6u14, "p<|>d", DaneGracza[playerid][g6u14]);
				return 1;
			}
			//Uprawnienie 15
			forward ZaladujUprawnieniag1u15(playerid);
			public ZaladujUprawnieniag1u15(playerid)
			{
				new sqlg1u15[512];
				format(sqlg1u15, sizeof(sqlg1u15), "SELECT `15` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u15);
				mysql_store_result();
				mysql_fetch_row(sqlg1u15);
				sscanf(sqlg1u15, "p<|>d", DaneGracza[playerid][g1u15]);
				return 1;
			}
			forward ZaladujUprawnieniag2u15(playerid);
			public ZaladujUprawnieniag2u15(playerid)
			{
				new sqlg2u15[512];
				format(sqlg2u15, sizeof(sqlg2u15), "SELECT `15` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u15);
				mysql_store_result();
				mysql_fetch_row(sqlg2u15);
				sscanf(sqlg2u15, "p<|>d", DaneGracza[playerid][g2u15]);
				return 1;
			}
			forward ZaladujUprawnieniag3u15(playerid);
			public ZaladujUprawnieniag3u15(playerid)
			{
				new sqlg3u15[512];
				format(sqlg3u15, sizeof(sqlg3u15), "SELECT `15` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u15);
				mysql_store_result();
				mysql_fetch_row(sqlg3u15);
				sscanf(sqlg3u15, "p<|>d", DaneGracza[playerid][g3u15]);
				return 1;
			}
			forward ZaladujUprawnieniag4u15(playerid);
			public ZaladujUprawnieniag4u15(playerid)
			{
				new sqlg4u15[512];
				format(sqlg4u15, sizeof(sqlg4u15), "SELECT `15` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u15);
				mysql_store_result();
				mysql_fetch_row(sqlg4u15);
				sscanf(sqlg4u15, "p<|>d", DaneGracza[playerid][g4u15]);
				return 1;
			}
			forward ZaladujUprawnieniag5u15(playerid);
			public ZaladujUprawnieniag5u15(playerid)
			{
				new sqlg5u15[512];
				format(sqlg5u15, sizeof(sqlg5u15), "SELECT `15` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u15);
				mysql_store_result();
				mysql_fetch_row(sqlg5u15);
				sscanf(sqlg5u15, "p<|>d", DaneGracza[playerid][g5u15]);
				return 1;
			}
			forward ZaladujUprawnieniag6u15(playerid);
			public ZaladujUprawnieniag6u15(playerid)
			{
				new sqlg6u15[512];
				format(sqlg6u15, sizeof(sqlg6u15), "SELECT `15` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u15);
				mysql_store_result();
				mysql_fetch_row(sqlg6u15);
				sscanf(sqlg6u15, "p<|>d", DaneGracza[playerid][g6u15]);
				return 1;
			}
			//Uprawnienie 16
			forward ZaladujUprawnieniag1u16(playerid);
			public ZaladujUprawnieniag1u16(playerid)
			{
				new sqlg1u16[512];
				format(sqlg1u16, sizeof(sqlg1u16), "SELECT `16` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u16);
				mysql_store_result();
				mysql_fetch_row(sqlg1u16);
				sscanf(sqlg1u16, "p<|>d", DaneGracza[playerid][g1u16]);
				return 1;
			}
			forward ZaladujUprawnieniag2u16(playerid);
			public ZaladujUprawnieniag2u16(playerid)
			{
				new sqlg2u16[512];
				format(sqlg2u16, sizeof(sqlg2u16), "SELECT `16` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u16);
				mysql_store_result();
				mysql_fetch_row(sqlg2u16);
				sscanf(sqlg2u16, "p<|>d", DaneGracza[playerid][g2u16]);
				return 1;
			}
			forward ZaladujUprawnieniag3u16(playerid);
			public ZaladujUprawnieniag3u16(playerid)
			{
				new sqlg3u16[512];
				format(sqlg3u16, sizeof(sqlg3u16), "SELECT `16` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u16);
				mysql_store_result();
				mysql_fetch_row(sqlg3u16);
				sscanf(sqlg3u16, "p<|>d", DaneGracza[playerid][g3u16]);
				return 1;
			}
			forward ZaladujUprawnieniag4u16(playerid);
			public ZaladujUprawnieniag4u16(playerid)
			{
				new sqlg4u16[512];
				format(sqlg4u16, sizeof(sqlg4u16), "SELECT `16` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u16);
				mysql_store_result();
				mysql_fetch_row(sqlg4u16);
				sscanf(sqlg4u16, "p<|>d", DaneGracza[playerid][g4u16]);
				return 1;
			}
			forward ZaladujUprawnieniag5u16(playerid);
			public ZaladujUprawnieniag5u16(playerid)
			{
				new sqlg5u16[512];
				format(sqlg5u16, sizeof(sqlg5u16), "SELECT `16` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u16);
				mysql_store_result();
				mysql_fetch_row(sqlg5u16);
				sscanf(sqlg5u16, "p<|>d", DaneGracza[playerid][g5u16]);
				return 1;
			}
			forward ZaladujUprawnieniag6u16(playerid);
			public ZaladujUprawnieniag6u16(playerid)
			{
				new sqlg6u16[512];
				format(sqlg6u16, sizeof(sqlg6u16), "SELECT `16` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u16);
				mysql_store_result();
				mysql_fetch_row(sqlg6u16);
				sscanf(sqlg6u16, "p<|>d", DaneGracza[playerid][g6u16]);
				return 1;
			}
			//Uprawnienie 17
			forward ZaladujUprawnieniag1u17(playerid);
			public ZaladujUprawnieniag1u17(playerid)
			{
				new sqlg1u17[512];
				format(sqlg1u17, sizeof(sqlg1u17), "SELECT `17` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u17);
				mysql_store_result();
				mysql_fetch_row(sqlg1u17);
				sscanf(sqlg1u17, "p<|>d", DaneGracza[playerid][g1u17]);
				return 1;
			}
			forward ZaladujUprawnieniag2u17(playerid);
			public ZaladujUprawnieniag2u17(playerid)
			{
				new sqlg2u17[512];
				format(sqlg2u17, sizeof(sqlg2u17), "SELECT `17` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u17);
				mysql_store_result();
				mysql_fetch_row(sqlg2u17);
				sscanf(sqlg2u17, "p<|>d", DaneGracza[playerid][g2u17]);
				return 1;
			}
			forward ZaladujUprawnieniag3u17(playerid);
			public ZaladujUprawnieniag3u17(playerid)
			{
				new sqlg3u17[512];
				format(sqlg3u17, sizeof(sqlg3u17), "SELECT `17` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u17);
				mysql_store_result();
				mysql_fetch_row(sqlg3u17);
				sscanf(sqlg3u17, "p<|>d", DaneGracza[playerid][g3u17]);
				return 1;
			}
			forward ZaladujUprawnieniag4u17(playerid);
			public ZaladujUprawnieniag4u17(playerid)
			{
				new sqlg4u17[512];
				format(sqlg4u17, sizeof(sqlg4u17), "SELECT `17` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u17);
				mysql_store_result();
				mysql_fetch_row(sqlg4u17);
				sscanf(sqlg4u17, "p<|>d", DaneGracza[playerid][g4u17]);
				return 1;
			}
			forward ZaladujUprawnieniag5u17(playerid);
			public ZaladujUprawnieniag5u17(playerid)
			{
				new sqlg5u17[512];
				format(sqlg5u17, sizeof(sqlg5u17), "SELECT `17` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u17);
				mysql_store_result();
				mysql_fetch_row(sqlg5u17);
				sscanf(sqlg5u17, "p<|>d", DaneGracza[playerid][g5u17]);
				return 1;
			}
			forward ZaladujUprawnieniag6u17(playerid);
			public ZaladujUprawnieniag6u17(playerid)
			{
				new sqlg6u17[512];
				format(sqlg6u17, sizeof(sqlg6u17), "SELECT `17` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u17);
				mysql_store_result();
				mysql_fetch_row(sqlg6u17);
				sscanf(sqlg6u17, "p<|>d", DaneGracza[playerid][g6u17]);
				return 1;
			}
			//Uprawnienie 18
			forward ZaladujUprawnieniag1u18(playerid);
			public ZaladujUprawnieniag1u18(playerid)
			{
				new sqlg1u18[512];
				format(sqlg1u18, sizeof(sqlg1u18), "SELECT `18` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u18);
				mysql_store_result();
				mysql_fetch_row(sqlg1u18);
				sscanf(sqlg1u18, "p<|>d", DaneGracza[playerid][g1u18]);
				return 1;
			}
			forward ZaladujUprawnieniag2u18(playerid);
			public ZaladujUprawnieniag2u18(playerid)
			{
				new sqlg2u18[512];
				format(sqlg2u18, sizeof(sqlg2u18), "SELECT `18` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u18);
				mysql_store_result();
				mysql_fetch_row(sqlg2u18);
				sscanf(sqlg2u18, "p<|>d", DaneGracza[playerid][g2u18]);
				return 1;
			}
			forward ZaladujUprawnieniag3u18(playerid);
			public ZaladujUprawnieniag3u18(playerid)
			{
				new sqlg3u18[512];
				format(sqlg3u18, sizeof(sqlg3u18), "SELECT `18` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u18);
				mysql_store_result();
				mysql_fetch_row(sqlg3u18);
				sscanf(sqlg3u18, "p<|>d", DaneGracza[playerid][g3u18]);
				return 1;
			}
			forward ZaladujUprawnieniag4u18(playerid);
			public ZaladujUprawnieniag4u18(playerid)
			{
				new sqlg4u18[512];
				format(sqlg4u18, sizeof(sqlg4u18), "SELECT `18` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u18);
				mysql_store_result();
				mysql_fetch_row(sqlg4u18);
				sscanf(sqlg4u18, "p<|>d", DaneGracza[playerid][g4u18]);
				return 1;
			}
			forward ZaladujUprawnieniag5u18(playerid);
			public ZaladujUprawnieniag5u18(playerid)
			{
				new sqlg5u18[512];
				format(sqlg5u18, sizeof(sqlg5u18), "SELECT `18` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u18);
				mysql_store_result();
				mysql_fetch_row(sqlg5u18);
				sscanf(sqlg5u18, "p<|>d", DaneGracza[playerid][g5u18]);
				return 1;
			}
			forward ZaladujUprawnieniag6u18(playerid);
			public ZaladujUprawnieniag6u18(playerid)
			{
				new sqlg6u18[512];
				format(sqlg6u18, sizeof(sqlg6u18), "SELECT `18` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u18);
				mysql_store_result();
				mysql_fetch_row(sqlg6u18);
				sscanf(sqlg6u18, "p<|>d", DaneGracza[playerid][g6u18]);
				return 1;
			}
			//Uprawnienie 19
			forward ZaladujUprawnieniag1u19(playerid);
			public ZaladujUprawnieniag1u19(playerid)
			{
				new sqlg1u19[512];
				format(sqlg1u19, sizeof(sqlg1u19), "SELECT `19` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u19);
				mysql_store_result();
				mysql_fetch_row(sqlg1u19);
				sscanf(sqlg1u19, "p<|>d", DaneGracza[playerid][g1u19]);
				return 1;
			}
			forward ZaladujUprawnieniag2u19(playerid);
			public ZaladujUprawnieniag2u19(playerid)
			{
				new sqlg2u19[512];
				format(sqlg2u19, sizeof(sqlg2u19), "SELECT `19` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u19);
				mysql_store_result();
				mysql_fetch_row(sqlg2u19);
				sscanf(sqlg2u19, "p<|>d", DaneGracza[playerid][g2u19]);
				return 1;
			}
			forward ZaladujUprawnieniag3u19(playerid);
			public ZaladujUprawnieniag3u19(playerid)
			{
				new sqlg3u19[512];
				format(sqlg3u19, sizeof(sqlg3u19), "SELECT `19` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u19);
				mysql_store_result();
				mysql_fetch_row(sqlg3u19);
				sscanf(sqlg3u19, "p<|>d", DaneGracza[playerid][g3u19]);
				return 1;
			}
			forward ZaladujUprawnieniag4u19(playerid);
			public ZaladujUprawnieniag4u19(playerid)
			{
				new sqlg4u19[512];
				format(sqlg4u19, sizeof(sqlg4u19), "SELECT `19` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u19);
				mysql_store_result();
				mysql_fetch_row(sqlg4u19);
				sscanf(sqlg4u19, "p<|>d", DaneGracza[playerid][g4u19]);
				return 1;
			}
			forward ZaladujUprawnieniag5u19(playerid);
			public ZaladujUprawnieniag5u19(playerid)
			{
				new sqlg5u19[512];
				format(sqlg5u19, sizeof(sqlg5u19), "SELECT `19` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u19);
				mysql_store_result();
				mysql_fetch_row(sqlg5u19);
				sscanf(sqlg5u19, "p<|>d", DaneGracza[playerid][g5u19]);
				return 1;
			}
			forward ZaladujUprawnieniag6u19(playerid);
			public ZaladujUprawnieniag6u19(playerid)
			{
				new sqlg6u19[512];
				format(sqlg6u19, sizeof(sqlg6u19), "SELECT `19` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u19);
				mysql_store_result();
				mysql_fetch_row(sqlg6u19);
				sscanf(sqlg6u19, "p<|>d", DaneGracza[playerid][g6u19]);
				return 1;
			}
			//Uprawnienie 20
			forward ZaladujUprawnieniag1u20(playerid);
			public ZaladujUprawnieniag1u20(playerid)
			{
				new sqlg1u20[512];
				format(sqlg1u20, sizeof(sqlg1u20), "SELECT `20` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u20);
				mysql_store_result();
				mysql_fetch_row(sqlg1u20);
				sscanf(sqlg1u20, "p<|>d", DaneGracza[playerid][g1u20]);
				return 1;
			}
			forward ZaladujUprawnieniag2u20(playerid);
			public ZaladujUprawnieniag2u20(playerid)
			{
				new sqlg2u20[512];
				format(sqlg2u20, sizeof(sqlg2u20), "SELECT `20` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u20);
				mysql_store_result();
				mysql_fetch_row(sqlg2u20);
				sscanf(sqlg2u20, "p<|>d", DaneGracza[playerid][g2u20]);
				return 1;
			}
			forward ZaladujUprawnieniag3u20(playerid);
			public ZaladujUprawnieniag3u20(playerid)
			{
				new sqlg3u20[512];
				format(sqlg3u20, sizeof(sqlg3u20), "SELECT `20` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u20);
				mysql_store_result();
				mysql_fetch_row(sqlg3u20);
				sscanf(sqlg3u20, "p<|>d", DaneGracza[playerid][g3u20]);
				return 1;
			}
			forward ZaladujUprawnieniag4u20(playerid);
			public ZaladujUprawnieniag4u20(playerid)
			{
				new sqlg4u20[512];
				format(sqlg4u20, sizeof(sqlg4u20), "SELECT `20` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u20);
				mysql_store_result();
				mysql_fetch_row(sqlg4u20);
				sscanf(sqlg4u20, "p<|>d", DaneGracza[playerid][g4u20]);
				return 1;
			}
			forward ZaladujUprawnieniag5u20(playerid);
			public ZaladujUprawnieniag5u20(playerid)
			{
				new sqlg5u20[512];
				format(sqlg5u20, sizeof(sqlg5u20), "SELECT `20` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u20);
				mysql_store_result();
				mysql_fetch_row(sqlg5u20);
				sscanf(sqlg5u20, "p<|>d", DaneGracza[playerid][g5u20]);
				return 1;
			}
			forward ZaladujUprawnieniag6u20(playerid);
			public ZaladujUprawnieniag6u20(playerid)
			{
				new sqlg6u20[512];
				format(sqlg6u20, sizeof(sqlg6u20), "SELECT `20` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u20);
				mysql_store_result();
				mysql_fetch_row(sqlg6u20);
				sscanf(sqlg6u20, "p<|>d", DaneGracza[playerid][g6u20]);
				return 1;
			}
			//Uprawnienie 21
			forward ZaladujUprawnieniag1u21(playerid);
			public ZaladujUprawnieniag1u21(playerid)
			{
				new sqlg1u21[512];
				format(sqlg1u21, sizeof(sqlg1u21), "SELECT `21` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u21);
				mysql_store_result();
				mysql_fetch_row(sqlg1u21);
				sscanf(sqlg1u21, "p<|>d", DaneGracza[playerid][g1u21]);
				return 1;
			}
			forward ZaladujUprawnieniag2u21(playerid);
			public ZaladujUprawnieniag2u21(playerid)
			{
				new sqlg2u21[512];
				format(sqlg2u21, sizeof(sqlg2u21), "SELECT `21` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u21);
				mysql_store_result();
				mysql_fetch_row(sqlg2u21);
				sscanf(sqlg2u21, "p<|>d", DaneGracza[playerid][g2u21]);
				return 1;
			}
			forward ZaladujUprawnieniag3u21(playerid);
			public ZaladujUprawnieniag3u21(playerid)
			{
				new sqlg3u21[512];
				format(sqlg3u21, sizeof(sqlg3u21), "SELECT `21` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u21);
				mysql_store_result();
				mysql_fetch_row(sqlg3u21);
				sscanf(sqlg3u21, "p<|>d", DaneGracza[playerid][g3u21]);
				return 1;
			}
			forward ZaladujUprawnieniag4u21(playerid);
			public ZaladujUprawnieniag4u21(playerid)
			{
				new sqlg4u21[512];
				format(sqlg4u21, sizeof(sqlg4u21), "SELECT `21` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u21);
				mysql_store_result();
				mysql_fetch_row(sqlg4u21);
				sscanf(sqlg4u21, "p<|>d", DaneGracza[playerid][g4u21]);
				return 1;
			}
			forward ZaladujUprawnieniag5u21(playerid);
			public ZaladujUprawnieniag5u21(playerid)
			{
				new sqlg5u21[512];
				format(sqlg5u21, sizeof(sqlg5u21), "SELECT `21` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u21);
				mysql_store_result();
				mysql_fetch_row(sqlg5u21);
				sscanf(sqlg5u21, "p<|>d", DaneGracza[playerid][g5u21]);
				return 1;
			}
			forward ZaladujUprawnieniag6u21(playerid);
			public ZaladujUprawnieniag6u21(playerid)
			{
				new sqlg6u21[512];
				format(sqlg6u21, sizeof(sqlg6u21), "SELECT `21` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u21);
				mysql_store_result();
				mysql_fetch_row(sqlg6u21);
				sscanf(sqlg6u21, "p<|>d", DaneGracza[playerid][g6u21]);
				return 1;
			}
			//Uprawnienie 22
			forward ZaladujUprawnieniag1u22(playerid);
			public ZaladujUprawnieniag1u22(playerid)
			{
				new sqlg1u22[512];
				format(sqlg1u22, sizeof(sqlg1u22), "SELECT `22` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u22);
				mysql_store_result();
				mysql_fetch_row(sqlg1u22);
				sscanf(sqlg1u22, "p<|>d", DaneGracza[playerid][g1u22]);
				return 1;
			}
			forward ZaladujUprawnieniag2u22(playerid);
			public ZaladujUprawnieniag2u22(playerid)
			{
				new sqlg2u22[512];
				format(sqlg2u22, sizeof(sqlg2u22), "SELECT `22` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u22);
				mysql_store_result();
				mysql_fetch_row(sqlg2u22);
				sscanf(sqlg2u22, "p<|>d", DaneGracza[playerid][g2u22]);
				return 1;
			}
			forward ZaladujUprawnieniag3u22(playerid);
			public ZaladujUprawnieniag3u22(playerid)
			{
				new sqlg3u22[512];
				format(sqlg3u22, sizeof(sqlg3u22), "SELECT `22` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u22);
				mysql_store_result();
				mysql_fetch_row(sqlg3u22);
				sscanf(sqlg3u22, "p<|>d", DaneGracza[playerid][g3u22]);
				return 1;
			}
			forward ZaladujUprawnieniag4u22(playerid);
			public ZaladujUprawnieniag4u22(playerid)
			{
				new sqlg4u22[512];
				format(sqlg4u22, sizeof(sqlg4u22), "SELECT `22` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u22);
				mysql_store_result();
				mysql_fetch_row(sqlg4u22);
				sscanf(sqlg4u22, "p<|>d", DaneGracza[playerid][g4u22]);
				return 1;
			}
			forward ZaladujUprawnieniag5u22(playerid);
			public ZaladujUprawnieniag5u22(playerid)
			{
				new sqlg5u22[512];
				format(sqlg5u22, sizeof(sqlg5u22), "SELECT `22` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u22);
				mysql_store_result();
				mysql_fetch_row(sqlg5u22);
				sscanf(sqlg5u22, "p<|>d", DaneGracza[playerid][g5u22]);
				return 1;
			}
			forward ZaladujUprawnieniag6u22(playerid);
			public ZaladujUprawnieniag6u22(playerid)
			{
				new sqlg6u22[512];
				format(sqlg6u22, sizeof(sqlg6u22), "SELECT `22` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u22);
				mysql_store_result();
				mysql_fetch_row(sqlg6u22);
				sscanf(sqlg6u22, "p<|>d", DaneGracza[playerid][g6u22]);
				return 1;
			}
			//Uprawnienie 23
			forward ZaladujUprawnieniag1u23(playerid);
			public ZaladujUprawnieniag1u23(playerid)
			{
				new sqlg1u23[512];
				format(sqlg1u23, sizeof(sqlg1u23), "SELECT `23` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u23);
				mysql_store_result();
				mysql_fetch_row(sqlg1u23);
				sscanf(sqlg1u23, "p<|>d", DaneGracza[playerid][g1u23]);
				return 1;
			}
			forward ZaladujUprawnieniag2u23(playerid);
			public ZaladujUprawnieniag2u23(playerid)
			{
				new sqlg2u23[512];
				format(sqlg2u23, sizeof(sqlg2u23), "SELECT `23` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u23);
				mysql_store_result();
				mysql_fetch_row(sqlg2u23);
				sscanf(sqlg2u23, "p<|>d", DaneGracza[playerid][g2u23]);
				return 1;
			}
			forward ZaladujUprawnieniag3u23(playerid);
			public ZaladujUprawnieniag3u23(playerid)
			{
				new sqlg3u23[512];
				format(sqlg3u23, sizeof(sqlg3u23), "SELECT `23` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u23);
				mysql_store_result();
				mysql_fetch_row(sqlg3u23);
				sscanf(sqlg3u23, "p<|>d", DaneGracza[playerid][g3u23]);
				return 1;
			}
			forward ZaladujUprawnieniag4u23(playerid);
			public ZaladujUprawnieniag4u23(playerid)
			{
				new sqlg4u23[512];
				format(sqlg4u23, sizeof(sqlg4u23), "SELECT `23` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u23);
				mysql_store_result();
				mysql_fetch_row(sqlg4u23);
				sscanf(sqlg4u23, "p<|>d", DaneGracza[playerid][g4u23]);
				return 1;
			}
			forward ZaladujUprawnieniag5u23(playerid);
			public ZaladujUprawnieniag5u23(playerid)
			{
				new sqlg5u23[512];
				format(sqlg5u23, sizeof(sqlg5u23), "SELECT `23` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u23);
				mysql_store_result();
				mysql_fetch_row(sqlg5u23);
				sscanf(sqlg5u23, "p<|>d", DaneGracza[playerid][g5u23]);
				return 1;
			}
			forward ZaladujUprawnieniag6u23(playerid);
			public ZaladujUprawnieniag6u23(playerid)
			{
				new sqlg6u23[512];
				format(sqlg6u23, sizeof(sqlg6u23), "SELECT `23` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u23);
				mysql_store_result();
				mysql_fetch_row(sqlg6u23);
				sscanf(sqlg6u23, "p<|>d", DaneGracza[playerid][g6u23]);
				return 1;
			}
			//Uprawnienie 24
			forward ZaladujUprawnieniag1u24(playerid);
			public ZaladujUprawnieniag1u24(playerid)
			{
				new sqlg1u24[512];
				format(sqlg1u24, sizeof(sqlg1u24), "SELECT `24` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u24);
				mysql_store_result();
				mysql_fetch_row(sqlg1u24);
				sscanf(sqlg1u24, "p<|>d", DaneGracza[playerid][g1u24]);
				return 1;
			}
			forward ZaladujUprawnieniag2u24(playerid);
			public ZaladujUprawnieniag2u24(playerid)
			{
				new sqlg2u24[512];
				format(sqlg2u24, sizeof(sqlg2u24), "SELECT `24` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u24);
				mysql_store_result();
				mysql_fetch_row(sqlg2u24);
				sscanf(sqlg2u24, "p<|>d", DaneGracza[playerid][g2u24]);
				return 1;
			}
			forward ZaladujUprawnieniag3u24(playerid);
			public ZaladujUprawnieniag3u24(playerid)
			{
				new sqlg3u24[512];
				format(sqlg3u24, sizeof(sqlg3u24), "SELECT `24` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u24);
				mysql_store_result();
				mysql_fetch_row(sqlg3u24);
				sscanf(sqlg3u24, "p<|>d", DaneGracza[playerid][g3u24]);
				return 1;
			}
			forward ZaladujUprawnieniag4u24(playerid);
			public ZaladujUprawnieniag4u24(playerid)
			{
				new sqlg4u24[512];
				format(sqlg4u24, sizeof(sqlg4u24), "SELECT `24` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u24);
				mysql_store_result();
				mysql_fetch_row(sqlg4u24);
				sscanf(sqlg4u24, "p<|>d", DaneGracza[playerid][g4u24]);
				return 1;
			}
			forward ZaladujUprawnieniag5u24(playerid);
			public ZaladujUprawnieniag5u24(playerid)
			{
				new sqlg5u24[512];
				format(sqlg5u24, sizeof(sqlg5u24), "SELECT `24` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u24);
				mysql_store_result();
				mysql_fetch_row(sqlg5u24);
				sscanf(sqlg5u24, "p<|>d", DaneGracza[playerid][g5u24]);
				return 1;
			}
			forward ZaladujUprawnieniag6u24(playerid);
			public ZaladujUprawnieniag6u24(playerid)
			{
				new sqlg6u24[512];
				format(sqlg6u24, sizeof(sqlg6u24), "SELECT `24` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u24);
				mysql_store_result();
				mysql_fetch_row(sqlg6u24);
				sscanf(sqlg6u24, "p<|>d", DaneGracza[playerid][g6u24]);
				return 1;
			}
			//Uprawienie 25
			forward ZaladujUprawnieniag1u25(playerid);
			public ZaladujUprawnieniag1u25(playerid)
			{
				new sqlg1u25[512];
				format(sqlg1u25, sizeof(sqlg1u25), "SELECT `25` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u25);
				mysql_store_result();
				mysql_fetch_row(sqlg1u25);
				sscanf(sqlg1u25, "p<|>d", DaneGracza[playerid][g1u25]);
				return 1;
			}
			forward ZaladujUprawnieniag2u25(playerid);
			public ZaladujUprawnieniag2u25(playerid)
			{
				new sqlg2u25[512];
				format(sqlg2u25, sizeof(sqlg2u25), "SELECT `25` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u25);
				mysql_store_result();
				mysql_fetch_row(sqlg2u25);
				sscanf(sqlg2u25, "p<|>d", DaneGracza[playerid][g2u25]);
				return 1;
			}
			forward ZaladujUprawnieniag3u25(playerid);
			public ZaladujUprawnieniag3u25(playerid)
			{
				new sqlg3u25[512];
				format(sqlg3u25, sizeof(sqlg3u25), "SELECT `25` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u25);
				mysql_store_result();
				mysql_fetch_row(sqlg3u25);
				sscanf(sqlg3u25, "p<|>d", DaneGracza[playerid][g3u25]);
				return 1;
			}
			forward ZaladujUprawnieniag4u25(playerid);
			public ZaladujUprawnieniag4u25(playerid)
			{
				new sqlg4u25[512];
				format(sqlg4u25, sizeof(sqlg4u25), "SELECT `25` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u25);
				mysql_store_result();
				mysql_fetch_row(sqlg4u25);
				sscanf(sqlg4u25, "p<|>d", DaneGracza[playerid][g4u25]);
				return 1;
			}
			forward ZaladujUprawnieniag5u25(playerid);
			public ZaladujUprawnieniag5u25(playerid)
			{
				new sqlg5u25[512];
				format(sqlg5u25, sizeof(sqlg5u25), "SELECT `25` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u25);
				mysql_store_result();
				mysql_fetch_row(sqlg5u25);
				sscanf(sqlg5u25, "p<|>d", DaneGracza[playerid][g5u25]);
				return 1;
			}
			forward ZaladujUprawnieniag6u25(playerid);
			public ZaladujUprawnieniag6u25(playerid)
			{
				new sqlg6u25[512];
				format(sqlg6u25, sizeof(sqlg6u25), "SELECT `25` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u25);
				mysql_store_result();
				mysql_fetch_row(sqlg6u25);
				sscanf(sqlg6u25, "p<|>d", DaneGracza[playerid][g6u25]);
				return 1;
			}
			//Uprawnienie 26
			forward ZaladujUprawnieniag1u26(playerid);
			public ZaladujUprawnieniag1u26(playerid)
			{
				new sqlg1u26[512];
				format(sqlg1u26, sizeof(sqlg1u26), "SELECT `26` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u26);
				mysql_store_result();
				mysql_fetch_row(sqlg1u26);
				sscanf(sqlg1u26, "p<|>d", DaneGracza[playerid][g1u26]);
				return 1;
			}
			forward ZaladujUprawnieniag2u26(playerid);
			public ZaladujUprawnieniag2u26(playerid)
			{
				new sqlg2u26[512];
				format(sqlg2u26, sizeof(sqlg2u26), "SELECT `26` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u26);
				mysql_store_result();
				mysql_fetch_row(sqlg2u26);
				sscanf(sqlg2u26, "p<|>d", DaneGracza[playerid][g2u26]);
				return 1;
			}
			forward ZaladujUprawnieniag3u26(playerid);
			public ZaladujUprawnieniag3u26(playerid)
			{
				new sqlg3u26[512];
				format(sqlg3u26, sizeof(sqlg3u26), "SELECT `26` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u26);
				mysql_store_result();
				mysql_fetch_row(sqlg3u26);
				sscanf(sqlg3u26, "p<|>d", DaneGracza[playerid][g3u26]);
				return 1;
			}
			forward ZaladujUprawnieniag4u26(playerid);
			public ZaladujUprawnieniag4u26(playerid)
			{
				new sqlg4u26[512];
				format(sqlg4u26, sizeof(sqlg4u26), "SELECT `26` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u26);
				mysql_store_result();
				mysql_fetch_row(sqlg4u26);
				sscanf(sqlg4u26, "p<|>d", DaneGracza[playerid][g4u26]);
				return 1;
			}
			forward ZaladujUprawnieniag5u26(playerid);
			public ZaladujUprawnieniag5u26(playerid)
			{
				new sqlg5u26[512];
				format(sqlg5u26, sizeof(sqlg5u26), "SELECT `26` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u26);
				mysql_store_result();
				mysql_fetch_row(sqlg5u26);
				sscanf(sqlg5u26, "p<|>d", DaneGracza[playerid][g5u26]);
				return 1;
			}
			forward ZaladujUprawnieniag6u26(playerid);
			public ZaladujUprawnieniag6u26(playerid)
			{
				new sqlg6u26[512];
				format(sqlg6u26, sizeof(sqlg6u26), "SELECT `26` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u26);
				mysql_store_result();
				mysql_fetch_row(sqlg6u26);
				sscanf(sqlg6u26, "p<|>d", DaneGracza[playerid][g6u26]);
				return 1;
			}
			//Uprawnienie 27
			forward ZaladujUprawnieniag1u27(playerid);
			public ZaladujUprawnieniag1u27(playerid)
			{
				new sqlg1u27[512];
				format(sqlg1u27, sizeof(sqlg1u27), "SELECT `27` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u27);
				mysql_store_result();
				mysql_fetch_row(sqlg1u27);
				sscanf(sqlg1u27, "p<|>d", DaneGracza[playerid][g1u27]);
				return 1;
			}
			forward ZaladujUprawnieniag2u27(playerid);
			public ZaladujUprawnieniag2u27(playerid)
			{
				new sqlg2u27[512];
				format(sqlg2u27, sizeof(sqlg2u27), "SELECT `27` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u27);
				mysql_store_result();
				mysql_fetch_row(sqlg2u27);
				sscanf(sqlg2u27, "p<|>d", DaneGracza[playerid][g2u27]);
				return 1;
			}
			forward ZaladujUprawnieniag3u27(playerid);
			public ZaladujUprawnieniag3u27(playerid)
			{
				new sqlg3u27[512];
				format(sqlg3u27, sizeof(sqlg3u27), "SELECT `27` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u27);
				mysql_store_result();
				mysql_fetch_row(sqlg3u27);
				sscanf(sqlg3u27, "p<|>d", DaneGracza[playerid][g3u27]);
				return 1;
			}
			forward ZaladujUprawnieniag4u27(playerid);
			public ZaladujUprawnieniag4u27(playerid)
			{
				new sqlg4u27[512];
				format(sqlg4u27, sizeof(sqlg4u27), "SELECT `27` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u27);
				mysql_store_result();
				mysql_fetch_row(sqlg4u27);
				sscanf(sqlg4u27, "p<|>d", DaneGracza[playerid][g4u27]);
				return 1;
			}
			forward ZaladujUprawnieniag5u27(playerid);
			public ZaladujUprawnieniag5u27(playerid)
			{
				new sqlg5u27[512];
				format(sqlg5u27, sizeof(sqlg5u27), "SELECT `27` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u27);
				mysql_store_result();
				mysql_fetch_row(sqlg5u27);
				sscanf(sqlg5u27, "p<|>d", DaneGracza[playerid][g5u27]);
				return 1;
			}
			forward ZaladujUprawnieniag6u27(playerid);
			public ZaladujUprawnieniag6u27(playerid)
			{
				new sqlg6u27[512];
				format(sqlg6u27, sizeof(sqlg6u27), "SELECT `27` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u27);
				mysql_store_result();
				mysql_fetch_row(sqlg6u27);
				sscanf(sqlg6u27, "p<|>d", DaneGracza[playerid][g6u27]);
				return 1;
			}
			//Uprawnienie 28
			forward ZaladujUprawnieniag1u28(playerid);
			public ZaladujUprawnieniag1u28(playerid)
			{
				new sqlg1u28[512];
				format(sqlg1u28, sizeof(sqlg1u28), "SELECT `28` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1u28);
				mysql_store_result();
				mysql_fetch_row(sqlg1u28);
				sscanf(sqlg1u28, "p<|>d", DaneGracza[playerid][g1u28]);
				return 1;
			}
			forward ZaladujUprawnieniag2u28(playerid);
			public ZaladujUprawnieniag2u28(playerid)
			{
				new sqlg2u28[512];
				format(sqlg2u28, sizeof(sqlg2u28), "SELECT `28` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2u28);
				mysql_store_result();
				mysql_fetch_row(sqlg2u28);
				sscanf(sqlg2u28, "p<|>d", DaneGracza[playerid][g2u28]);
				return 1;
			}
			forward ZaladujUprawnieniag3u28(playerid);
			public ZaladujUprawnieniag3u28(playerid)
			{
				new sqlg3u28[512];
				format(sqlg3u28, sizeof(sqlg3u28), "SELECT `28` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3u28);
				mysql_store_result();
				mysql_fetch_row(sqlg3u28);
				sscanf(sqlg3u28, "p<|>d", DaneGracza[playerid][g3u28]);
				return 1;
			}
			forward ZaladujUprawnieniag4u28(playerid);
			public ZaladujUprawnieniag4u28(playerid)
			{
				new sqlg4u28[512];
				format(sqlg4u28, sizeof(sqlg4u28), "SELECT `28` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4u28);
				mysql_store_result();
				mysql_fetch_row(sqlg4u28);
				sscanf(sqlg4u28, "p<|>d", DaneGracza[playerid][g4u28]);
				return 1;
			}
			forward ZaladujUprawnieniag5u28(playerid);
			public ZaladujUprawnieniag5u28(playerid)
			{
				new sqlg5u28[512];
				format(sqlg5u28, sizeof(sqlg5u28), "SELECT `28` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5u28);
				mysql_store_result();
				mysql_fetch_row(sqlg5u28);
				sscanf(sqlg5u28, "p<|>d", DaneGracza[playerid][g5u28]);
				return 1;
			}
			forward ZaladujUprawnieniag6u28(playerid);
			public ZaladujUprawnieniag6u28(playerid)
			{
				new sqlg6u28[512];
				format(sqlg6u28, sizeof(sqlg6u28), "SELECT `28` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6u28);
				mysql_store_result();
				mysql_fetch_row(sqlg6u28);
				sscanf(sqlg6u28, "p<|>d", DaneGracza[playerid][g6u28]);
				return 1;
			}
			forward ZaladujWyplateg1(playerid);
			public ZaladujWyplateg1(playerid)
			{
			    new sqlg1[512];
				format(sqlg1, sizeof(sqlg1), "SELECT `CZAS_NA_SLUZBIE` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc1]);
				mysql_query(sqlg1);
				mysql_store_result();
				mysql_fetch_row(sqlg1);
				sscanf(sqlg1, "p<|>d", DaneGracza[playerid][w1]);
				return 1;
			}
			forward ZaladujWyplateg2(playerid);
			public ZaladujWyplateg2(playerid)
			{
			    new sqlg2[512];
				format(sqlg2, sizeof(sqlg2), "SELECT `CZAS_NA_SLUZBIE` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc2]);
				mysql_query(sqlg2);
				mysql_store_result();
				mysql_fetch_row(sqlg2);
				sscanf(sqlg2, "p<|>d", DaneGracza[playerid][w2]);
				return 1;
			}
			forward ZaladujWyplateg3(playerid);
			public ZaladujWyplateg3(playerid)
			{
			    new sqlg3[512];
				format(sqlg3, sizeof(sqlg3), "SELECT `CZAS_NA_SLUZBIE` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc3]);
				mysql_query(sqlg3);
				mysql_store_result();
				mysql_fetch_row(sqlg3);
				sscanf(sqlg3, "p<|>d", DaneGracza[playerid][w3]);
				return 1;
			}
			forward ZaladujWyplateg4(playerid);
			public ZaladujWyplateg4(playerid)
			{
			    new sqlg4[512];
				format(sqlg4, sizeof(sqlg4), "SELECT `CZAS_NA_SLUZBIE` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc4]);
				mysql_query(sqlg4);
				mysql_store_result();
				mysql_fetch_row(sqlg4);
				sscanf(sqlg4, "p<|>d", DaneGracza[playerid][w4]);
				return 1;
			}
			forward ZaladujWyplateg5(playerid);
			public ZaladujWyplateg5(playerid)
			{
			    new sqlg5[512];
				format(sqlg5, sizeof(sqlg5), "SELECT `CZAS_NA_SLUZBIE` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc5]);
				mysql_query(sqlg5);
				mysql_store_result();
				mysql_fetch_row(sqlg5);
				sscanf(sqlg5, "p<|>d", DaneGracza[playerid][w5]);
				return 1;
			}
			forward ZaladujWyplateg6(playerid);
			public ZaladujWyplateg6(playerid)
			{
			    new sqlg6[512];
				format(sqlg6, sizeof(sqlg6), "SELECT `CZAS_NA_SLUZBIE` FROM `jochym_pracownicy` WHERE `UID_POSTACI` = '%d' AND `UID_DZIALALNOSCI` = '%d'", DaneGracza[playerid][gUID], DaneGracza[playerid][gDzialalnosc6]);
				mysql_query(sqlg6);
				mysql_store_result();
				mysql_fetch_row(sqlg6);
				sscanf(sqlg6, "p<|>d", DaneGracza[playerid][w6]);
				return 1;
			}
			
			forward ZaladujUprawnieniaSRP(playerid);
			public ZaladujUprawnieniaSRP(playerid)
			{
			    ZaladujUprawnieniag1u1(playerid);
				ZaladujUprawnieniag2u1(playerid);
				ZaladujUprawnieniag3u1(playerid);
				ZaladujUprawnieniag4u1(playerid);
				ZaladujUprawnieniag5u1(playerid);
                ZaladujUprawnieniag6u1(playerid);
                ZaladujUprawnieniag1u2(playerid);
                ZaladujUprawnieniag2u2(playerid);
                ZaladujUprawnieniag3u2(playerid);
                ZaladujUprawnieniag4u2(playerid);
                ZaladujUprawnieniag5u2(playerid);
                ZaladujUprawnieniag6u2(playerid);
                ZaladujUprawnieniag1u3(playerid);
                ZaladujUprawnieniag2u3(playerid);
                ZaladujUprawnieniag3u3(playerid);
                ZaladujUprawnieniag4u3(playerid);
                ZaladujUprawnieniag5u3(playerid);
                ZaladujUprawnieniag6u3(playerid);
                ZaladujUprawnieniag1u4(playerid);
                ZaladujUprawnieniag2u4(playerid);
                ZaladujUprawnieniag3u4(playerid);
                ZaladujUprawnieniag4u4(playerid);
                ZaladujUprawnieniag5u4(playerid);
                ZaladujUprawnieniag6u4(playerid);
                ZaladujUprawnieniag1u5(playerid);
                ZaladujUprawnieniag2u5(playerid);
                ZaladujUprawnieniag3u5(playerid);
                ZaladujUprawnieniag4u5(playerid);
                ZaladujUprawnieniag5u5(playerid);
                ZaladujUprawnieniag6u5(playerid);
                ZaladujUprawnieniag1u6(playerid);
                ZaladujUprawnieniag2u6(playerid);
                ZaladujUprawnieniag3u6(playerid);
                ZaladujUprawnieniag4u6(playerid);
                ZaladujUprawnieniag5u6(playerid);
                ZaladujUprawnieniag6u6(playerid);
                ZaladujUprawnieniag1u7(playerid);
                ZaladujUprawnieniag2u7(playerid);
                ZaladujUprawnieniag3u7(playerid);
                ZaladujUprawnieniag4u7(playerid);
                ZaladujUprawnieniag5u7(playerid);
                ZaladujUprawnieniag6u7(playerid);
                ZaladujUprawnieniag1u8(playerid);
                ZaladujUprawnieniag2u8(playerid);
                ZaladujUprawnieniag3u8(playerid);
                ZaladujUprawnieniag4u8(playerid);
                ZaladujUprawnieniag5u8(playerid);
                ZaladujUprawnieniag6u8(playerid);
                ZaladujUprawnieniag1u9(playerid);
                ZaladujUprawnieniag2u9(playerid);
                ZaladujUprawnieniag3u9(playerid);
                ZaladujUprawnieniag4u9(playerid);
                ZaladujUprawnieniag5u9(playerid);
                ZaladujUprawnieniag6u9(playerid);
                ZaladujUprawnieniag1u10(playerid);
                ZaladujUprawnieniag2u10(playerid);
                ZaladujUprawnieniag3u10(playerid);
                ZaladujUprawnieniag4u10(playerid);
                ZaladujUprawnieniag5u10(playerid);
                ZaladujUprawnieniag6u10(playerid);
                ZaladujUprawnieniag1u11(playerid);
                ZaladujUprawnieniag2u11(playerid);
                ZaladujUprawnieniag3u11(playerid);
                ZaladujUprawnieniag4u11(playerid);
                ZaladujUprawnieniag5u11(playerid);
                ZaladujUprawnieniag6u11(playerid);
                ZaladujUprawnieniag1u12(playerid);
                ZaladujUprawnieniag2u12(playerid);
                ZaladujUprawnieniag3u12(playerid);
                ZaladujUprawnieniag4u12(playerid);
                ZaladujUprawnieniag5u12(playerid);
                ZaladujUprawnieniag6u12(playerid);
                ZaladujUprawnieniag1u13(playerid);
                ZaladujUprawnieniag2u12(playerid);
                ZaladujUprawnieniag3u12(playerid);
                ZaladujUprawnieniag4u12(playerid);
                ZaladujUprawnieniag5u12(playerid);
                ZaladujUprawnieniag6u12(playerid);
                ZaladujUprawnieniag1u13(playerid);
                ZaladujUprawnieniag2u13(playerid);
                ZaladujUprawnieniag3u13(playerid);
                ZaladujUprawnieniag4u13(playerid);
                ZaladujUprawnieniag5u13(playerid);
                ZaladujUprawnieniag6u13(playerid);
                ZaladujUprawnieniag1u14(playerid);
                ZaladujUprawnieniag2u14(playerid);
                ZaladujUprawnieniag3u14(playerid);
                ZaladujUprawnieniag4u14(playerid);
                ZaladujUprawnieniag5u14(playerid);
                ZaladujUprawnieniag6u14(playerid);
                ZaladujUprawnieniag1u15(playerid);
                ZaladujUprawnieniag2u15(playerid);
                ZaladujUprawnieniag3u15(playerid);
                ZaladujUprawnieniag4u15(playerid);
                ZaladujUprawnieniag5u15(playerid);
                ZaladujUprawnieniag6u15(playerid);
                ZaladujUprawnieniag1u16(playerid);
                ZaladujUprawnieniag2u16(playerid);
                ZaladujUprawnieniag3u16(playerid);
                ZaladujUprawnieniag4u16(playerid);
                ZaladujUprawnieniag5u16(playerid);
                ZaladujUprawnieniag6u16(playerid);
                ZaladujUprawnieniag1u17(playerid);
                ZaladujUprawnieniag2u17(playerid);
                ZaladujUprawnieniag3u17(playerid);
                ZaladujUprawnieniag4u17(playerid);
                ZaladujUprawnieniag5u17(playerid);
                ZaladujUprawnieniag6u17(playerid);
                ZaladujUprawnieniag1u18(playerid);
                ZaladujUprawnieniag2u18(playerid);
                ZaladujUprawnieniag3u18(playerid);
                ZaladujUprawnieniag4u18(playerid);
                ZaladujUprawnieniag5u18(playerid);
                ZaladujUprawnieniag6u18(playerid);
                ZaladujUprawnieniag1u19(playerid);
                ZaladujUprawnieniag2u19(playerid);
                ZaladujUprawnieniag3u19(playerid);
                ZaladujUprawnieniag4u19(playerid);
                ZaladujUprawnieniag5u19(playerid);
                ZaladujUprawnieniag6u19(playerid);
                ZaladujUprawnieniag1u20(playerid);
                ZaladujUprawnieniag2u20(playerid);
                ZaladujUprawnieniag3u20(playerid);
                ZaladujUprawnieniag4u20(playerid);
                ZaladujUprawnieniag5u20(playerid);
                ZaladujUprawnieniag6u20(playerid);
                ZaladujUprawnieniag1u21(playerid);
                ZaladujUprawnieniag2u21(playerid);
                ZaladujUprawnieniag3u21(playerid);
                ZaladujUprawnieniag4u21(playerid);
                ZaladujUprawnieniag5u21(playerid);
                ZaladujUprawnieniag6u21(playerid);
                ZaladujUprawnieniag1u22(playerid);
                ZaladujUprawnieniag2u22(playerid);
                ZaladujUprawnieniag3u22(playerid);
                ZaladujUprawnieniag4u22(playerid);
                ZaladujUprawnieniag5u22(playerid);
                ZaladujUprawnieniag6u22(playerid);
                ZaladujUprawnieniag1u23(playerid);
                ZaladujUprawnieniag2u23(playerid);
                ZaladujUprawnieniag3u23(playerid);
                ZaladujUprawnieniag4u23(playerid);
                ZaladujUprawnieniag5u23(playerid);
                ZaladujUprawnieniag6u23(playerid);
                ZaladujUprawnieniag1u24(playerid);
                ZaladujUprawnieniag2u24(playerid);
                ZaladujUprawnieniag3u24(playerid);
                ZaladujUprawnieniag4u24(playerid);
                ZaladujUprawnieniag5u24(playerid);
                ZaladujUprawnieniag6u24(playerid);
                ZaladujUprawnieniag1u25(playerid);
                ZaladujUprawnieniag2u25(playerid);
                ZaladujUprawnieniag3u25(playerid);
                ZaladujUprawnieniag4u25(playerid);
                ZaladujUprawnieniag5u25(playerid);
                ZaladujUprawnieniag6u25(playerid);
                ZaladujUprawnieniag1u26(playerid);
                ZaladujUprawnieniag2u26(playerid);
                ZaladujUprawnieniag3u26(playerid);
                ZaladujUprawnieniag4u26(playerid);
                ZaladujUprawnieniag5u26(playerid);
                ZaladujUprawnieniag6u26(playerid);
                ZaladujUprawnieniag1u27(playerid);
                ZaladujUprawnieniag2u27(playerid);
                ZaladujUprawnieniag3u27(playerid);
                ZaladujUprawnieniag4u27(playerid);
                ZaladujUprawnieniag5u27(playerid);
                ZaladujUprawnieniag6u27(playerid);
                ZaladujUprawnieniag1u28(playerid);
                ZaladujUprawnieniag2u28(playerid);
                ZaladujUprawnieniag3u28(playerid);
                ZaladujUprawnieniag4u28(playerid);
                ZaladujUprawnieniag5u28(playerid);
                ZaladujUprawnieniag6u28(playerid);
                ZaladujWyplateg1(playerid);
                ZaladujWyplateg2(playerid);
                ZaladujWyplateg3(playerid);
                ZaladujWyplateg4(playerid);
                ZaladujWyplateg5(playerid);
                ZaladujWyplateg6(playerid);
			}
