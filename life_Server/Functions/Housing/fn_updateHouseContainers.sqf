/*
	fn_updateHouseContainers.sqf
*/

params [["_house", objNull, [objNull]], "_houseID", "_containers", "_query"];

if(isNull _house) exitWith {systemChat "House null";};
_houseID = _house getVariable["house_id",-1];
if(_houseID isEqualTo -1) exitWith {systemChat "HouseID invalid";};

_containers = _house getVariable ["containers",[]];

_arr = [];
{
	_className = typeOf _x;
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;

	_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
} foreach _containers;

_arr = [_arr] call DB_fnc_mresArray;
_query = format["UPDATE houses SET containers='%1' WHERE id='%2'",_arr,_houseID];
[_query,1] call DB_fnc_asyncCall;