AntiDeAMX();
////////////////////////////////////////////////////////////////////////////////
#define ls-life "v1.0"
#define VER "LS-Life • "ls-life""
#define VERSION "LS-Life "ls-life""
#define PROJEKT "LS-Life"
#define GUIOPIS ""
#define STRONAWWW "LS-Life.pl"
#define NAZWASERWERA "[0.3DL] LS-Life • RolePlay (PL) Zapraszamy!"
#define PREFIXAC "LS-Life"
new SerwerPoboczny = 0;// Ustawie by nie zabija³o rekordu online.
new BetaTesty = 0; // Ustawia logowanie gracza na BetaTesty tylko dla postaci z rang¹ TEAM!
new HasloNaSerwer = 0; //Ustawia has³o na serwer
new InfoOSkinach = 0; //Informacje przy pobieraniu skinów na serwerze
new NPCAktywne = 0; //NPC (CJ poruszaj¹cy siê poci¹giem) (B³¹d z aktorami na ten moment wy³¹czone)
new WlaczEuro = 1; // 0 - Waluta euro jest wy³¹czona, 1 - Waluta euro jest w³¹czona
////////////////////////////////////////////////////////////////////////////////
new czasjochym = 0;
new czasHistory = 0;
#define CZAS_LETNI 			-4*3600
#define KOREKTA_CZASOWA		1*3600
////////////////////////////////////////////////////////////////////////////////
#define INT_BUS_VW   		55
#define MAX_KOSZT_BILETU    20
#define MIN_KOSZT_BILETU    5
////////////////////////////////////////////////////////////////////////////////
#define MAX_POSTACI 		1000         //Maksymalna iloœc ³adowanych postaci do spadku jotów i skilla
#define MAX_PLAYERS         100         //Maksymalan iloœæ osób w grze
#define MAX_ANIM            140         //Animacje
#define MAX_GROUP   		250         //Grupy
#define MAX_VEH 			2000        //Pojazdy
#define MAX_NIERUCHOMOSCI   1000		//Budynki
#define MAX_PRZEDMIOT       5000        //Przedmioty
#define MAX_OBIEKT          20000        //Obiekty
#define MAX_TEXTUR          20000        //Tekstury
#define MAX_PRACOWNIK       2000        //Zatrudnienia na /g
#define MAX_WYNAJEM         1000        //Maksymalna iloœæ wynajmów
#define MAX_ZON             1024        //Maksymalana iloœc stref San Andreas
#define MAX_HURT	        1000         //Przedmioty które mo¿na zamówiæ
#define MAX_BANK            2000         //Konta bankowe
#define MAX_WYSCIG			2000         //Wyscigi
#define MAX_KARTOTEKA		5000         //Wpisy w kartotekach
#define MAX_MAGAZYN         5000         //Przedmioty na /g [slot] magazyn
#define MAX_ZONE            365         //Opisane miejsca w Los Santos - Verdant, Down Town.
#define MAX_KONTAKTOW		5000         //V-cardy
#define MAX_BUS				50          //Iloœæ /bus na serwerze
#define MAX_KOLCZATEK		6           //Maksymalna iloœc kolczatek na serwerze
#define MAX_FOTO            50           //Fotoradary
#define MAX_KIEUNKI			8           //Kierunkowskazy w pojazdach
#define MAX_BLOKAD2   		21          //Blokady - barkierki itp.
#define MAX_TATO            1000         //Tatuaze graczy
#define MAX_SMS             5000         //SMSy graczy
#define MAX_OPISY           5000         //Opisy graczy
#define MAX_BOT             100           //Maksymalna iloœæ botów na serwerze
#define MAX_NAGROBEK        100          //Maksymalna iloœæ nagrobków na serwerze
#define MAX_ZGLOSZEN        2000         //Maksymalna ilosc zgloszeñ
#define MAX_DNA             100         //Maksymalna ilosc œladów DNA
#define MAX_CORNER          50          //Maksymalna iloœc cornerów
#define MAX_GAZETY          50         //Maksymalna iloœc miejsc do rozwiezienia gazet
#define MAX_NASION			1000		//Maksymalna iloœæ zasadzonych nasion
#define MAX_ZLOM			50			//Maksymalna iloœc miejsc z z³omem
#define MAX_RYBAK			50			//Masykamalna ilosc miejsc dla rybaka
#define MAX_KOPIA			10000		//Maksymalna iloœæ kopi obiektów
#define MAX_KOPIA_TXT		10000		//Maksymalna iloœc kopi textur dla interioru
#define MAX_MODEL			500			//Maksymalna iloœæ modeli do pobrania lub wyœwietlenia
#define MAX_HISTORY			10000		//Maksymalna iloœæ histori transkacji, przelewów.
#define MAX_DLUG			1000		//Maksymalna iloœæ zad³u¿eñ do za³adowania.
#define MAX_FOREX			1000		//Maksymalna ilosc wystawionych akcji na gie³dzie
////////////////////////////////////////////////////////////////////////////////
#define CAMERA_PERSPECTIVE                  false
#define STREAMER_ENABLED					true
#define STREAMER_ADD                    	CreateDynamicObject
#define STREAMER_REMOVE                     DestroyDynamicObject
#define COLOR_RED 0xFF1E00FF
#define COLOR_GREEN 0x05FF00FF
#define petla(%2,%1) for(new %2 = 0; %2 < %1; %2++)
////////////////////////////////////////////////////////////////////////////////
#define KOLOR   			 0xFFFFFFFF
#define CZARNY   			 0x000000FF
#define FIOLETOWY			 0xC2A2DAFF
#define NIEBIESKI			 0x2B95FFFF
#define BIALY  	   	   	     0xFFFFFFFF
#define CZARNY         		 0x000000FF
#define FIOLETOWY   	     0xC2A2DAFF
#define SZARY          		 0xDEDEDEFF
#define ZIELONY        		 0x88B711FF
#define CZERWONY             0x7b0000FF
#define KOLOR_DO             0x9A9CCDFF

////////////////////////////////////////////////////////////////////////////////
//                     KOLORY IGORA
// #define IGOR_GREEN "{63D075}";
// #define IGOR_LIGHTYELLOW "{FFE5B4}";
// #define IGOR_RED "{ed5a5a}";
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
#define DIALOG_LOGIN		    		1
#define DIALOG_STATS		    		2
#define DIALOG_POMOC		    		3
#define DIALOG_ANIM						4
#define DIALOG_VEH_SPAWN				5
#define DIALOG_DZIALALNOSCI     		6
#define DIALOG_AKC_OFERTY        		7
#define DIALOG_MANIPULATION_VEH			8
#define DIALOG_REJESTR_UNIK         	9
#define DIALOG_VEH_NAMIERZ          	10
#define DIALOG_BUS          			11
#define DIALOG_BUS_BILET        		12
#define DIALOG_NOWYBUS_CZ1				13
#define DIALOG_BUS_EDIT      			14
#define DIALOG_BUS_EDITZAPISZ       	15
#define DIALOG_PODPISZ_VEH          	16
#define DIALOG_PODPISZ_VEH_ACC      	17
#define DIALOG_PRZEDMIOTY_GRACZA    	18
#define DIALOG_PRZEDZMIOTY          	19
#define DIALOG_PRZEDZMIOT_OPCJE     	20
#define DIALOG_PRZEDZMIOTY_PODNIES  	21
#define DIALOG_DZIALALNOSCI_OPCJE   	22
#define DIALOG_PRZEDZMIOTY_MAGAZYN  	23
#define	CAMERA_DIALOG_RANGE         	24
#define DIALOG_PRZEDZMIOTY_PODNIES_VEH  25
#define DIALOG_MAIN 					26
#define DIALOG_RANGE 					27
#define DIALOG_LIMIT 					28
#define DIALOG_EDIT 					29
#define DIALOG_EANGLE 					30
#define DIALOG_ELIMIT 					31
#define DIALOG_ERANGE 					32
#define DIALOG_VEH_SPAWN_DZ             33
#define DIALOG_POJAZD_OPCJE_DZ		    34
#define DIALOG_POJAZD_OPCJE_RESET   	35
#define DIALOG_POJAZD_OPCJE_DEL     	36
#define DIALOG_DRZWI_OPCJE              37
#define DIALOG_POJAZD_OPCJE_ODPISZ      38
#define DIALOG_DRZWI_OPCJE_OB           39
#define DIALOG_DRZWI_OPCJE_NP           40
#define DIALOG_DRZWI_OPCJE_WP           41
#define DIALOG_DRZWI_OPCJE_PP           42
#define DIALOG_DRZWI_OPCJE_PD           43
#define DIALOG_PODPISZ_BUDYNEK          44
#define DIALOG_DRZWI_OPCJE_BP           45
#define DIALOG_DRZWI_OPCJE_WN           46
#define DIALOG_DRZWI_OPCJE_SP           47
#define DIALOG_DRZWI_OPCJE_SP_G         48
#define DIALOG_DRZWI_OPCJE_HIFI         49
#define DIALOG_DRZWI_OPCJE_SZAFA        50
#define DIALOG_DRZWI_OPCJE_WNAJEM       51
#define DIALOG_DRZWI_OPCJE_SWIATLO      52
#define DIALOG_DRZWI_OPCJE_CD           53
#define DIALOG_ITEM_CD                  54
#define DIALOG_ITEM_CD2                 55
#define DIALOG_EDYTOR                   56
#define DIALOG_HURTOWNIA			    57
#define DIALOG_INFO_BP                  58
#define DIALOG_NICK                     59
#define DIALOG_BANKOMAT                 60
#define DIALOG_BANKOMAT_WYPLAC          61
#define DIALOG_BANKOMAT_WPLAC           62
#define DIALOG_HURTOWNIA_NEXT           63
#define DIALOG_HURTOWNIA_KWOTA          64
#define DIALOG_BANK_KONTO               65
#define DIALOG_247_KUP                  66
#define DIALOG_BANKOMAT_PRZELEW         67
#define DIALOG_BANKOMAT_PRZELEW_N       68
#define DIALOG_GASTRO_KUP               69
#define DIALOG_TORBA_WLOZ               70
#define DIALOG_OFFER_NAPRAWE			71
#define DIALOG_TOKKEN					72
#define DIALOG_TOKKEN_V2				73
#define DIALOG_BEZPIECZNIK    			74
#define DIALOG_TORBA_WYCIAGNIJ			75
#define DIALOG_AMMO_NALADUJ				76
#define DIALOG_OFER_GR_ITEM				77
#define DIALOG_OFER_GR_ITEM_CENA		78
#define DIALOG_PRZEDMIOT_DEL			79
#define DIALOG_BANK_GRUPA				80
#define DIALOG_BANK_GRUPA_OPCJE			81
#define DIALOG_BANK_GRUPA_WPLAC			82
#define DIALOG_BANK_GRUPA_WYPLAC		83
#define DIALOG_WEDKA_ZYLKA				84
#define DIALOG_WEDKA_HACZYK				85
#define DIALOG_WEDKA_PRZYNETA			86
#define DIALOG_PRZEBIERZ				87
#define DIALOG_KARTOTEKA_OPCJE			88
#define DIALOG_KARTOTEKA_WPIS			89
#define DIALOG_KARTOTEKA_OPCJE_NEXT		90
#define DIALOG_KARTOTEKA_WPIS_NEXT		91
#define DIALOG_POKER_OPUSC     			92
#define DIALOG_POKER_ZETONY      		93
#define DIALOG_BUDKA  					94
#define DIALOG_BUDKA_SL   				95
#define DIALOG_BUDKA_SL_ZG   			96
#define DIALOG_POKER_PRZEBIJ			97
#define DIALOG_OFFER_TUNING				98
#define DIALOG_SALON_POJAZDOW			99
#define DIALOG_SALON_POJAZDOW_KUP		100
#define DIALOG_SALON_POJAZDOW_KUP_N		101
#define DIALOG_SZAFA					102
#define DIALOG_HOTEL					103
#define DIALOG_HOTEL_CENA				104
#define DIALOG_WYSCIG_OPCJE				105
#define DIALOG_WYSCIG_STWORZ			106
#define DIALOG_WYSCIG_DOLACZ			107
#define DIALOG_PW						108
#define DIALOG_TAG						109
#define DIALOG_WYSCIG_WYRZUC			110
#define DIALOG_CRAFT					111
#define DIALOG_CRAFT_OPCJE				112
#define DIALOG_SWEEPER					113
#define DIALOG_PRACA					114
#define DIALOG_GZ						115
#define DIALOG_GZ_D						116
#define DIALOG_LEK						117
#define DIALOG_TELEFON					118
#define DIALOG_TELEFON_SL   			119
#define DIALOG_TELEFON_SL_ZG   			120
#define DIALOG_TELEFON_SMS_K			121
#define DIALOG_TELEFON_SMS_KL			122
#define DIALOG_TELEFON_SMS_KAL			123
#define DIALOG_KONTAKT_ZAPROS			124
#define DIALOG_TELEFON_USUN				125
#define DIALOG_TELEFON_DZWON_K			126
#define DIALOG_TELEFON_DZWON_KAL		127
#define DIALOG_BUDKA_DZWON_KAL			128
#define DIALOG_PW2						129
#define DIALOG_HOLOWANIE				130
#define DIALOG_ATTACH_INDEX_SELECTION   131
#define DIALOG_ATTACH_EDITREPLACE       132
#define DIALOG_ATTACH_MODEL_SELECTION   133
#define DIALOG_ATTACH_BONE_SELECTION    134
#define DIALOG_STWORZ_DZ				135
#define DIALOG_PALIWKO					136
#define DIALOG_DISC_WL					137
#define DIALOG_ITEM_NOTES				138
#define DIALOG_HOTEL_PRZED				139
#define DIALOG_GRIL						140
#define DIALOG_GRIL_OPCJE				141
#define DIALOG_ZAMOW_PACZKE				142
#define DIALOG_WEZ_PACZKE				143
#define DIALOG_ANIM_CHODZENIA			144
#define DIALOG_ZABIERZ					145
#define DIALOG_WB						146
#define DIALOG_AREA                     147
#define DIALOG_PODPISZ_AREA             148
#define DIALOG_BOOMBOX		            149
#define DIALOG_SWIATLODOM               150
#define DIALOG_DRZWI_OPCJE2             151
#define DIALOG_ZLOMUJ	                152
#define DIALOG_ZLOMUJ_KUP	            153
#define DIALOG_ZLOMUJ_KUP_N	            154
#define DIALOG_CORNER		            155
#define DIALOG_CORNER_S		            156
#define DIALOG_DRZWI_OPCJE_ENERGIA      157
#define DIALOG_KAMERA                   158
#define DIALOG_WYWIAD                   159
#define DIALOG_WYWIAD_CALL              160
#define DIALOG_RADIO                    161
#define DIALOG_CBRADIO                  162
#define DIALOG_RADIO_OPCJE              163
#define DIALOG_CBRADIO_OPCJE            164
#define DIALOG_RADIO_CD                 165
#define DIALOG_CBRADIO_KANAL            166
#define DIALOG_CBRADIO_TEKST            167
#define DIALOG_WYRZUCZVEH               168
#define DIALOG_MAGAZYNG                 169
#define DIALOG_CHANGELOG                170
#define DIALOG_SZYBY_OPCJE              171
#define DIALOG_SZYBY_OPCJE2             172
#define DIALOG_SZYBY_OPCJE3             173
#define DIALOG_SZYBY_OPCJE4             174
#define DIALOG_MASKA_CAR                175
#define DIALOG_BAGAZNIK_CAR             176
#define DIALOG_PRZEDZMIOTY_PODNIES_SZAFA 177
#define DIALOG_LV            			178
#define DIALOG_DRZWI_ROCKSTAR           179
#define DIALOG_OPIS                     180
#define DIALOG_OPIS_ZAPISZ              181
#define DIALOG_OPIS_WCZYTAJ             182
#define DIALOG_OPIS_USTAW               183
#define DIALOG_BANKOMAT_MODEL           184
#define DIALOG_BANK_GRUPA2              185
#define DIALOG_TELEFON_DZWONI           186
#define DIALOG_DRZWI_STWORZ             187
#define DIALOG_DRZWI_STWORZ2            188
#define DIALOG_INTERAKCJA_WYBIERZ       189
#define DIALOG_AREA_ADMIN               190
#define DIALOG_AREA_CENA                191
#define DIALOG_AREA_LIMIT               192
#define DIALOG_DRZWI_NAJEMNICY_WYPROS   193
#define DIALOG_DRZWI_OPCJE_WYNAJEM      194
#define DIALOG_UBRANIE_WYBIERZ          195
#define DIALOG_HARACZ                   196
#define DIALOG_VCARD_ZAPISZ_TELEFON     197
#define DIALOG_ZAMOW_PACZKE_WIZUALNE    198
#define DIALOG_ZAMOW_PACZKE_TUNING      199
#define DIALOG_ZAMOW_PACZKE_MAFIE       200
#define DIALOG_OFER_GR_ITEM_FREE        201
#define DIALOG_AKCES                    202
#define DIALOG_KARTOTEKA_PODGLAD        203
#define DIALOG_USTAWIENIA_P             204
#define DIALOG_TELEFON_OPCJA1           205
#define DIALOG_TELEFON_OPCJA2           206
#define DIALOG_TELEFON_OPCJA3           207
#define DIALOG_TELEFON_OPCJA4           208
#define DIALOG_TELEFON_SIM              209
#define DIALOG_SPRZEDAJPOJAZDOFF        210
#define DIALOG_SPRZEDAJPOJAZDOFF2       211
#define DIALOG_RADIO_OPC                212
#define DIALOG_OPCJE_OPC                213
#define DIALOG_INTERAKCJA_VEH_WYBIERZ   214
#define DIALOG_MASKA_CAR_INTER          215
#define DIALOG_BAGAZNIK_CAR_INTER       216
#define DIALOG_REJBRONI                 217
#define DIALOG_WYMIENPOJAZDOFF          218
#define DIALOG_WYMIENPOJAZDOFF2         219
#define DIALOG_TATUAZ                   220
#define DIALOG_NICK2                    221
#define DIALOG_AREA_METR                222
#define DIALOG_UEDYTOR                  223
#define DIALOG_BETA                     224
#define DIALOG_AREA_OBIEKTY             225
#define DIALOG_OPISY                    226
#define DIALOG_INTERAKCJA_AKTOR         227
#define DIALOG_INTERAKCJA_AKTOR2        228
#define DIALOG_INTERAKCJA_AKTOR3        229
#define DIALOG_INTERAKCJA_AKTOR4        230
#define DIALOG_INTERAKCJA_AKTOR_OPLATA  231
#define DIALOG_INTERAKCJA_AKTOR_D1      232
#define DIALOG_INTERAKCJA_DZIALALNOSC   233
#define DIALOG_PRZEDMIOT_POCHOWAJ       234
#define DIALOG_INTERAKCJA_AKTOR_ROBOTA  235
#define DIALOG_ZAMOW_PACZKE_WIZUALNE2   236
#define DIALOG_AUTOMAT_KUP              237
#define DIALOG_ZGLOSZENIE_OPCJE         238
#define DIALOG_ZGLOSZENIE_OPCJE2        239
#define DIALOG_INTERAKCJA_AKTOR_NARKOTYK    240
#define DIALOG_TUNING_RABUNEK           241
#define DIALOG_PRZEDMIOT_ACTOR          242
#define DIALOG_INTERAKCJA_AKTOR_RYBY    243
#define DIALOG_FREEZE                   244
#define DIALOG_ZAMOW_UBRANIA            245
#define DIALOG_KAJDANKI                 246
#define DIALOG_SZNUR                    247
#define DIALOG_WOREK                    248
#define DIALOG_INTERAKCJA_AKTOR_Z£OMOWISKO 249
#define DIALOG_INTERAKCJA_AKTOR_PRACA   250
#define DIALOG_ANIM_PRZYCISK            251
#define DIALOG_FIRSTPERSON              252
#define DIALOG_DNA                      253
#define DIALOG_PRZEDMIOT_DNA            254
#define DIALOG_POSZUKIWANY_DODAJ        255
#define DIALOG_POSZUKIWANY_USUN         256
#define DIALOG_EDYCJA_AKTORA            257
#define DIALOG_AKTOR_ANIMACJA           258
#define DIALOG_AKTOR_UBRANIE            259
#define DIALOG_AKTOR_INTERAKCJA         260
#define DIALOG_AKTOR_NICK               261
#define DIALOG_CORNER_SELL              262
#define DIALOG_INTERAKCJA_AKTOR_GAZETA  263
#define DIALOG_TRUCIZNA                 264
#define DIALOG_TRUCIZNA2                265
#define DIALOG_DOKUP_M2                 266
#define DIALOG_DOKUP_M2_ACCEPT          267
#define DIALOG_INTERAKCJA_PASER         268
#define DIALOG_PASER_SELL               269
#define DIALOG_INTERAKCJA_RODZINKA      270
#define DIALOG_INTERAKCJA_RODZINKA_D1   271
#define DIALOG_GASTRO_KUP_ILOSC         272
#define	DIALOG_CENNIK_INFORMACJA		273
#define DIALOG_OFERTA_BUT0				274
#define DIALOG_OFERTA_BUT1				275
#define DIALOG_OFERTA_BUT3				276
#define DIALOG_OPISY_OPCJE				277
#define DIALOG_INTERAKCJA_ZWIERZAK		278
#define DIALOG_AKTOR_STWORZONY			279
#define DIALOG_INTERAKCJA_NASIONA		280
#define DIALOG_PROJEKT_WNETRZA			281
#define DIALOG_DYSTRYBUTOR				282
#define DIALOG_DYSTRYBUTOR_TANKUJ		283
#define DIALOG_PROJEKT					284
#define DIALOG_PROJEKT_ZAKONCZ			285
#define DIALOG_MEMBERS					286
#define DIALOG_MEMBERS_UPRAWNIENIA		287
#define DIALOG_INTERAKCJA_CREATE_ORG	288
#define DIALOG_INTERAKCJA_CREATE_OP1	289
#define DIALOG_INTERAKCJA_CREATE_OP2	290
#define DIALOG_INTERAKCJA_CREATE_OP2_2	291
#define DIALOG_RADIOSTACJA				292
#define DIALOG_DRZWI_STWORZ_ADM			293
#define DIALOG_DRZWI_STWORZ2_ADM		294
#define DIALOG_DLUG						295
#define DIALOG_DLUG_SPLAC				296
#define DIALOG_INTERAKCJA_LSMC			297
#define DIALOG_INTERAKCJA_LSMC1			298
#define DIALOG_INTERAKCJA_LSMC2			299
#define DIALOG_INTERAKCJA_LSMC3			300
#define DIALOG_INTERAKCJA_AKTOR_ROSLIN	301
#define DIALOG_ROSLINA_SELL				302
#define DIALOG_INTERAKCJA_AKTOR_R_KUP	303
#define DIALOG_INTERAKCJA_AKTOR_R_KUP1	304
#define DIALOG_FOREX					305
#define DIALOG_FOREX_AKCJE				306
#define DIALOG_FOREX_AKCJE_WYMIEN		307
#define DIALOG_FOREX_WYSTAW				308
#define DIALOG_FOREX_AKCJE_WYMIEN_ILOSC	309
#define DIALOG_FOREX_AKCJE_WYMIEN_ACCEPT 310
#define DIALOG_INFO	    				9999
////////////////////////////////////////////////////////////////////////////////
#define GraczJestAFK(%1) (AFK[%1] == 1)
#define PRESSED(%0) \
	(((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define GetAngleBetweenCoordinates(%1,%2,%3,%4) (atan2(floatabs(%3 - %1), floatabs(%4 - %2)))
#define Dystans(%0,%1,%2,%3,%4) IsPlayerInRangeOfPoint(%1,%0,%2,%3,%4)
#define ForeachEx(%2,%1) for(new %2 = 0; %2 < %1; %2++)
#define isnull(%1) 			((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#define GetDistanceBetweenPoints(%0,%1,%2,%3,%4,%5) (((%0 - %3) * (%0 - %3)) + ((%1 - %4) * (%1 - %4)) + ((%2 - %5) * (%2 - %5)))
#define A_CHAR(%0) for(new i = strlen(%0) - 1; i >= 0; i--)\
        if((%0)[i] == '%')\
                (%0)[i] = ('#')
#define Apostrof(%0) for(new i = strlen(%0) - 1; i >= 0; i--)\
        if((%0)[i] == ''')\
                (%0)[i] = (' ')
#define A_KOL(%0) for(new i = strlen(%0) - 1; i >= 0; i--)\
        if((%0)[i] == '(')\
                (%0)[i] = ('{')
#define A_KOLS(%0) for(new i = strlen(%0) - 1; i >= 0; i--)\
        if((%0)[i] == ')')\
                (%0)[i] = ('}')
#define A_MT(%0) for(new i = strlen(%0) - 1; i >= 0; i--)\
        if((%0)[i] == '*')\
                (%0)[i] = ('\n')
#define HOLDING(%0) \
	((newkeys & (%0)) == (%0))
#define SendWrappedMessageToPlayerFormat(%0,%1,%2,%3) \
do \
{ \
     if(strlen(%2) > 0) \
    { \
        new stringtest[256]; \
        format(stringtest, sizeof(stringtest), %2, %3); \
        SendWrappedMessageToPlayer(%0, %1, stringtest); \
    } \
} \
while(FALSE)
////////////////////////////////////////////////////////////////////////////////
#define RASA_BIALA           "Bia³a"
#define RASA_CZARNA          "Czarna"
#define RASA_ZOLTA           "Zó³ta"
////////////////////////////////////////////////////////////////////////////////
#define TYP_WLASCICIEL      0
#define TYP_ULICA           1
#define TYP_AUTO            2
#define TYP_SZAFA           3
#define TYP_TORBA           4
#define TYP_PLECAK          5
#define TYP_MAGAZYN         6
#define TYP_CRAFT           7
#define TYP_GRIL          	8
#define TYP_REJBRONI        9
#define TYP_ZWLOKIP         10
////////////////////////////////////////////////////////////////////////////////
#define SALON_TANIE					1
#define SALON_POPULARNE_TANIE 		2
#define SALON_POPULARNE				3
#define SALON_POPULARNE_LUKSUSOWE	4
#define SALON_SPORT_EXCLUSIVE		5
#define SALON_LODZIE				6
#define SALON_JEDNOSLADY			7
#define SALON_SAMOLOTY_HELI			8
#define SALON_SPECJALNE				9
////////////////////////////////////////////////////////////////////////////////
#define DZIALALNOSC_POLICYJNA      	1
#define DZIALALNOSC_ZMOTORYZOWANA  	2
#define DZIALALNOSC_WARSZTAT       	3
#define DZIALALNOSC_247      	   	4
#define DZIALALNOSC_SALON           5
#define DZIALALNOSC_CHURCH          6
#define DZIALALNOSC_BANK            7
#define DZIALALNOSC_ELEKTRTYKA      8
#define DZIALALNOSC_GASTRONOMIA     9
#define DZIALALNOSC_SANNEWS			10
#define DZIALALNOSC_MAFIE			11
#define DZIALALNOSC_HOTEL			12
#define DZIALALNOSC_RODZINKA		13
#define DZIALALNOSC_MEDYCZNA		14
#define DZIALALNOSC_TAXI			15
#define DZIALALNOSC_GANGI			16
#define DZIALALNOSC_SILOWNIA		17
#define DZIALALNOSC_BINCO			18
#define DZIALALNOSC_RZADOWA			19
#define DZIALALNOSC_WYPOZYCZALNIA 	20//ochrona
#define DZIALALNOSC_SYNDYKAT		21
#define DZIALALNOSC_ELKA			22
#define DZIALALNOSC_TRANS			23
#define DZIALALNOSC_BRANZA			24
#define DZIALALNOSC_SIEC			25
#define DZIALALNOSC_STRZELNICA		26
#define DZIALALNOSC_AMUNATION		27
#define DZIALALNOSC_TATUAZ          28
////////////////////////////////////////////////////////////////////////////////
#define OFEROWANIE_INVITE   		1
#define OFEROWANIE_POJAZDU  		2
#define OFEROWANIE_BUDYNKU  		3
#define OFEROWANIE_WYNAJMU  		4
#define OFEROWANIE_PODAJ    		5
#define OFEROWANIE_NAP_VEH			6
#define OFEROWANIE_AKC_NAP			7
#define OFEROWANIE_NAP_ENG			8
#define OFEROWANIE_PRZEDMIOTU		9
#define OFEROWANIE_ELEKTRYKI    	10
#define OFEROWANIE_BLOKADY			11
#define OFEROWANIE_MANDATU			12
#define OFEROWANIE_LAKIEROWANIA		13
#define OFEROWANIE_TUNE_VEH			14
#define OFEROWANIE_PJ				15
#define OFEROWANIE_TAXI				16
#define OFEROWANIE_WYSCIG 			17
#define OFEROWANIE_KARNET 			18
#define OFEROWANIE_SZTUKEWALKI		19
#define OFEROWANIE_WYWIAD			20
#define OFEROWANIE_TANKOWANIA   	21
#define OFEROWANIE_DOKUMENTU		22
#define OFEROWANIE_TABLIC			23
#define OFEROWANIE_WYREJ			24	
#define OFEROWANIE_KONTAKT			25
#define OFEROWANIE_HOLOWANIA		26
#define OFEROWANIE_WYPOZYCZENIE 	27
#define OFEROWANIE_YO				28
#define OFEROWANIE_OPLATY			29
#define OFEROWANIE_DZIALA			30
#define OFEROWANIE_OCHRONY      	31
#define OFEROWANIE_STREFY       	32
#define OFEROWANIE_MAGAZYN      	33
#define OFEROWANIE_RP           	34
#define OFEROWANIE_HARACZU      	35
#define OFEROWANIE_REJBRONI     	36
#define OFEROWANIE_POJAZDU2     	37
#define OFEROWANIE_TATUAZU      	38
#define OFEROWANIE_DOKUMENTU2   	39
#define OFEROWANIE_TABLIC2      	40
#define OFEROWANIE_OPLATY2      	41
#define OFEROWANIE_PODAJ_AUTOMAT 	42
#define OFEROWANIE_TERENU			43
#define OFEROWANIE_LAKIERU			44
#define OFEROWANIE_PRZETRZYMANIA 	45
#define OFEROWANIE_DLUG				46	
#define OFEROWANIE_DLUGSPLATA		47
////////////////////////////////////////////////////////////////////////////////
#define BRAMA_OWNER				1
#define BRAMA_DZIALALNOSC		2
#define BRAMA_ALL				3
////////////////////////////////////////////////////////////////////////////////
#define P_WEAPON            1
#define P_PIWO              2
#define P_PACZKA            3
#define P_UBRANIE           4
#define P_REKAWICZKI        5
#define P_CD                6
#define P_MASKA             7
#define P_BAGAZNIK          8
#define P_ZDERZAKP          9
#define P_ZDERZAKT          10
#define P_DRZWIP            11
#define P_DRZWIK            12
#define P_SWIATLOLP         13
#define P_SWIATLOPP         14
#define P_OPONALP           15
#define P_OPONAPP           16
#define P_OPONAPT           17
#define P_OPONALT           18
#define P_AMMO	            19
#define P_PAPIEROSY         20
#define P_ZEGARKI           21
#define P_TELEFONY          22
#define P_KANISTER          23
#define P_TORBA             24
#define P_TECZKA            25
#define P_NOTATNIK          26
#define P_LINA              27
#define P_DISCMAN           28
#define P_WLACZNIK          29
#define P_KABLE             30
#define P_LICZNIK           31
#define P_GNIAZDKO          32
#define P_LAMPY             33
#define P_TUNING			34
#define P_WEDKA				35
#define P_HACZYK			36
#define P_ZYLKA				37
#define P_PRZYNENTA			38
#define P_RYBA				39
#define P_WOREK				40
#define P_ROLKI				41
#define P_ZARCIE			42
#define P_KOGUTPD			43
#define P_WODA				44
#define P_SZNOR				45
#define P_POJAZDY			46
#define P_KOMPONENTY		47	//war 1 - Tempomat, war 2 - Audio, 3 - Alarm, 4 - Immo, 5 - CB, 6 - Gaz, 7 - Szyby przyciemniane, 8 - GPS
#define P_TRUP				48
#define P_BANDANA			49
#define P_NARKOTYKI			50
#define P_SKLADNIK_MARYCHA	51
#define P_SKLADNIK_AMFA		52
#define P_SKLADNIK_KOKA		53
#define P_SKLADNIK_EXTASA	54
#define P_SKLADNIK_LSD		55
#define P_SKLADNIK_GRZYBY	56
#define P_SKLADNIK_HERA		57
#define P_SKLADNIK_MEFEDRON	58
#define P_LEK				59// Lek1 = UNBW, Lek2 = Detox - 5.0 uzale¿nienia, Lek3 = Apap uzupe³nia 15hp, Lek4 = CzasTrwaniaNarko na 0;
#define P_TABLICA			60
#define P_KARTECZKA			61
#define P_KOSTKA			62
#define P_SKLADNIK_KIELBA	63
#define P_SKLADNIK_SASZLYK	64
#define P_SKLADNIK_KARKOWKA	65
#define P_SKLADNIK_KURCZAK	66
#define P_SKLADNIK_TOST		67
#define P_SKLADNIK_BOCZEK	68
#define P_SKLADNIK_STEK		69
#define P_SKLADNIK_ZIEMNIAKI 70
#define P_PILKA_DO_KOSZA	71
#define P_BOOMBOX           72
#define P_C2                73
#define P_LASER_C           74
#define P_LASER_N           75
#define P_LASER_O           76
#define P_LASER_F           77
#define P_LASER_G           78
#define P_ARMOUR            79
#define P_TABLET            80
#define P_NADAJNIK          81
#define P_ZDRAPKA           82
#define P_WYTRYCHHOME       83
#define P_KAJDANKI          84
#define P_DYNIA             85
#define P_KARNET            86
#define P_SZTUKA_BOX        87
#define P_SZTUKA_KUNGFU     88
#define P_SZTUKA_KRAVMAGA   89
#define P_OBIEKTY           90
#define P_SIM               91
#define P_LEZAK1			92
#define P_LEZAK2			93
#define P_GRILL             94
#define P_KRZESLO           95
#define P_RECZNIK1          96
#define P_AZOT              97
#define P_MASZYNKATATO      98
#define P_IGLATATO          99
#define P_TUSZTATO          100
#define P_KROTKOFALOWKA     101
#define P_OGNISKO           102
#define P_DRABINA           103
#define P_UNIKATREJ         104
#define P_WYTRYCH           105
#define P_TRUCIZNA          106
#define P_PASERKA           107
#define P_TASMA_LED         108
#define P_PROCESORY         109
#define P_LAPTOPY           110
#define P_AUDIO             111
#define P_PBUTTON        	112
#define P_AKTOR				113
#define P_ZWIERZAK			114
#define P_NASIONA			115
#define P_ROSLINA			116
#define P_KONEWKA			117
#define P_KOPIAWNETRZ		118
#define P_ARMOUR_MODEL1		119
#define P_ARMOUR_MODEL2		120
/////////////////////////////////////////////////////////////////////////////////////////////////
#define U_ZARZ_TABLICA		0
#define U_ZARZ_WYPLATA		1
#define U_ZARZ_POJAZDAMI	2
#define U_ZARZ_MAGAZYNEM	3
#define U_ZARZ_BUDYNKAMI	4
#define U_ZARZ_RANGAMI		5
#define U_ZARZ_DZIALALN		6
#define U_CZAT_OOC			7
#define U_CZAT_IC			8
#define U_PROWADZ_POJ_W		9
#define U_PROWADZ_POJ_R		10
#define U_ZAMYKANIE_DZRZWI	11
#define U_UZYWANIE_BRAM		12
#define U_ZAMAWIANIE_P		13
#define U_SPRZEDAWANIE_P	14
#define U_UTRZYMYWANIE_POJ	15
#define U_ZARZ_SZAFA		16
#define U_ZARZ_AUDIO		17
#define U_MIKROFON			18
#define U_ZATRUDNIANIE		19
#define U_WYPOZYCZANIE_POJ	20
#define U_MONT_ELEKTRYKI	21
#define U_KARTOTEKA_PD		22
#define U_MONT_CZESCI		23
#define U_ON_OFF_SWIATLO	24
#define U_BLOK_DROGOWYMI	25
#define U_KAJDANKI			26
#define U_BLOK_KOLA			27
#define U_ZM_CENY_BLOK_K	28
#define U_ALKOMAT			29
#define U_ZARZ_KARTOTEKA	30
#define U_LIVE				31
#define U_REKLAM			32
#define U_NEWS				33
#define U_PRZESZUKANIE		34
#define U_DEL_WPIS_KART		35
#define U_MANDAT			36
#define U_PRZETRZYMANIE		37
#define U_ZWALNIANIE_Z_PRZ	38
#define U_ZARZ_KOLCZATKA	39
#define U_ZARZ_KOGUTEM		40
#define U_ZARZ_HOLOWNIKIEM	41
#define U_GPS				42
#define U_ZARZ_SZNUREM		43
#define U_TWORZ_TRAS_WYSCI	44
#define U_ZAP_DOL_WYSCIGU	45
#define U_ROZPOCZYNANIE_WYS	46
#define U_OFEROWAIE_TAXI	47
#define U_ZARZ_TAGAMI		48
#define U_KARNETY			49
#define U_WYWIAD			50
#define U_WYSCIG_WYPROS		51
#define U_WYD_DOK			52
#define U_WYREJEJST			53
#define U_DEPRTAMENTIWY		54
///////////////////////////////////////////////
#define PRACA_BRAK          0
#define PRACA_MECHANIK      1
#define PRACA_WEDKARZ		2
#define PRACA_KURIER  		3
#define PRACA_ZLOM          4
#define PRACA_MAGAZYNIER    5
#define PRACA_WYCINKA       6
#define PRACA_ZAMIATACZ     7
#define PRACA_GAZECIARZ     8
///////////////////////////////////////////////
#define D_PRAWKO_A			0
#define D_PRAWKO_B			1
#define D_BRON				2
#define D_NIEKARALNOSC		3
#define D_DOWOD				4
#define D_NIEPOCZYTALNOSC	5
#define D_WEDKARSKA			6
#define D_PENTLA_SAVE 		15
///////////////////////////////////////////////
#define OSIAGNIECIE_ZALOGOWANIE		0
#define OSIAGNIECIE_PIERWSZA_KASA	1
#define OSIAGNIECIE_PIERWSZY_POJAZD	2
#define OSIAGNIECIE_ZATRUDNIENIE	3
#define OSIAGNIECIE_ZAMELDOWANIE	4
#define OSIAGNIECIE_10H				5
#define OSIAGNIECIE_50H				6
#define OSIAGNIECIE_100H			7
#define OSIAGNIECIE_SPORTOWIEC		8
#define OSIAGNIECIE_5K				9
#define OSIAGNIECIE_25K				10
