AntiDeAMX();
forward Tuning(vehicleid);
public Tuning(vehicleid)
{
	UsunCalyTuningZPojazdu(vehicleid);
	new vehicleuid = SprawdzCarUID(vehicleid);
	if(vehicleuid != INVALID_VEHICLE_ID)
	{
		new tune = 0;
	    ForeachEx(itemid, MAX_PRZEDMIOT)
		{
			if(PrzedmiotInfo[itemid][pTyp] == P_TUNING && PrzedmiotInfo[itemid][pTypWlas] == TYP_AUTO && PrzedmiotInfo[itemid][pOwner] == vehicleuid && PrzedmiotInfo[itemid][pWar2] == 1)
			{
				PojazdInfo[vehicleuid][pTuning][tune] = PrzedmiotInfo[itemid][pWar1];
				AddVehicleComponent(vehicleid, PrzedmiotInfo[itemid][pWar1]);
				tune++;
			}
		}
	}
	return 1;
}
stock UsunCalyTuningZPojazdu(vehicleid)
{
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 1));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 2));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 3));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 4));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 5));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 6));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 7));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 8));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 9));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 10));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 11));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 12));
    RemoveVehicleComponent(vehicleid, GetVehicleComponentInSlot(vehicleid, 13));
}