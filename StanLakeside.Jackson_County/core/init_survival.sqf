[] spawn
{
	while {true} do
	{
		if(isNull objectParent player) then
		{
			if(life_seatwarn) then {
				life_seatwarn = false;
			};
			if(life_seatbelt) then {
				uiSleep 3;
				life_seatbelt = false;
			};
			uiSleep 5;
		};
		if(vehicle player != player && !(player getVariable ["Escorting", false]) && !(player getVariable ["restrained", false]) && (vehicle player isKindOf "LandVehicle")) then
		{
			if(speed vehicle player > 60 && speed vehicle player < 119 && !life_seatbelt) then
			{
				oldVehVelocity = velocity (vehicle player);
				uiSleep 0.3;
				if(speed vehicle player < 1) then
				{
					playSound "glassbreak";
					moveOut player;
					player setVelocity [(oldVehVelocity select 0) * 0.4,(oldVehVelocity select 1) * 0.4,((oldVehVelocity select 2) * 0.4) + 5];
					uiSleep 2;
					player switchmove "";
					oldVehVelocity = nil;
				};
			} else {
				if(!life_seatwarn) then {
					uiSleep 1;
					if(!life_seatwarn) then {
						["Pamietaj o pasach!", false] spawn domsg;
					};
					playSound "seatwarn";
					life_seatwarn = true;
				};
				uiSleep 2;
			};
		};
	};
};