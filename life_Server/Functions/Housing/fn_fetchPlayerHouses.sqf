/*
	
	
	Description:
	Fetches all the players houses and sets them up.
*/
private["_query","_houses"];
if(_this isEqualTo "") exitWith {};

_query = format["SELECT pid, pos, inventory, containers, shared1, shared2, shared3, shared4, shared5 FROM houses WHERE pid='%1' OR shared1='%1' OR shared2='%1' OR shared3='%1' OR shared4='%1' OR shared5='%1' AND owned='1'",_this];

_houses = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
	_pos = call compile format["%1",_x select 1];
	_house = nearestBuilding _pos;
	_house allowDamage false;
	_containers = [];
	_house setVariable["slots",[],true];
	_owner = call compile format["%1",_x select 0];
	_shared1 = call compile format["%1",_x select 4];
	_shared2 = call compile format["%1",_x select 5];
	_shared3 = call compile format["%1",_x select 6];
	_shared4 = call compile format["%1",_x select 7];
	_shared5 = call compile format["%1",_x select 8];

	if(!isNil "_shared1") then {
		_house setVariable["shared1",true,true];	
	};
	if(!isNil "_shared2") then {
		_house setVariable["shared2",true,true];	
	};
	if(!isNil "_shared3") then {
		_house setVariable["shared3",true,true];	
	};
	if(!isNil "_shared4") then {
		_house setVariable["shared4",true,true];	
	};
	if(!isNil "_shared5") then {
		_house setVariable["shared5",true,true];	
	};


	if(!isNil {(_house getVariable "containers")}) then {
	{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
	};

	_trunk = [_x select 2] call DB_fnc_mresToArray;
	if(typeName _trunk isEqualTo "STRING") then {
		_trunk = call compile format["%1", _trunk];
	};
	_containerData = [_x select 3] call DB_fnc_mresToArray;
	if(typeName _containerData isEqualTo "STRING") then {
		_containerData = call compile format["%1", _containerData];
	};
	_house setVariable["Trunk",_trunk,true];

		{
			if(count _x isEqualTo 0) exitWith {}; 
			_className = _x select 0;
			_weapons = (_x select 1) select 0;
			_magazines = (_x select 1) select 1;
			_items = (_x select 1) select 2;
			_backpacks = (_x select 1) select 3;

			_positions = [_house] call life_fnc_getBuildingPositions;
			_pos = [0,0,0];

			{
				_slots = _house getVariable ["slots",[]];
				if(!(_forEachIndex in _slots)) exitWith {
					_slots pushBack _forEachIndex;
					_house setVariable["slots",_slots,true];
					_pos = _x;
				};
			} foreach _positions;

			if(_pos isEqualTo [0,0,0]) exitWith {};

			_container = createVehicle[_className,_pos,[],0,"NONE"];
			waitUntil{!isNil "_container"};
			_container setPosATL _pos;

			_containers pushBack _container;
			clearWeaponCargoGlobal _container;
			clearItemCargoGlobal _container;
			clearMagazineCargoGlobal _container;
			clearBackpackCargoGlobal _container;

			{
				_weaponCount = (_weapons select 1) select _forEachIndex;
				_container addWeaponCargoGlobal [_x,_weaponCount];
			} foreach (_weapons select 0);


			{
				_magazineCount = (_magazines select 1) select _forEachIndex;
				_container addMagazineCargoGlobal [_x,_magazineCount];
			} foreach (_magazines select 0);


			{
				_itemCount = (_items select 1) select _forEachIndex;
				_container addItemCargoGlobal [_x,_itemCount];
			} foreach (_items select 0);


			{
				_backpackCount = (_backpacks select 1) select _forEachIndex;
				_container addBackpackCargoGlobal [_x,_backpackCount];
			} foreach (_backpacks select 0);

		} foreach _containerData;



	_house setVariable["containers",_containers,true];
	_return pushBack [_x select 1,_containers];

} foreach _houses;

missionNamespace setVariable[format["houses_%1",_this],_return];
