#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehTakeItem.sqf
	
	
	Description:
	Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
	if the player has room.
*/
private["_ctrl","_num","_index","_data","_old","_value","_weight","_diff"];
disableSerialization;
if(isNull life_trunk_vehicle OR !alive life_trunk_vehicle) exitWith {[localize "STR_MISC_VehDoesntExist", false] spawn domsg;};
if(deadPlayer) exitwith {closeDialog 0;};
_uid = getPlayerUID player;
if(life_trunk_vehicle getVariable "trunkUsers" != _uid) exitWith
{
    [localize "STR_MISC_VehInvUse", false] spawn domsg;
};
if((lbCurSel 3502) isEqualTo -1) exitWith {[localize "STR_Global_NoSelection", false] spawn domsg;};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
if(!([_num] call fnc_isnumber)) exitWith {[localize "STR_MISC_WrongNumFormat", false] spawn domsg;};
_num = parseNumber(_num);
if(_num < 1) exitWith {[localize "STR_MISC_Under1", false] spawn domsg;};

_index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call fnc_index;
_data = (life_trunk_vehicle getVariable "Trunk") select 0;
_old = life_trunk_vehicle getVariable "Trunk";
if(_index isEqualTo -1) exitWith {};
_value = _data select _index select 1;
if(_num > _value) exitWith {[localize "STR_MISC_NotEnough", false] spawn domsg;};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num isEqualTo 0) exitWith {[localize "STR_NOTF_InvFull", false] spawn domsg;};
_weight = ([_ctrl] call life_fnc_itemWeight) * _num;
if(_ctrl isEqualTo "money") then
{
	if(_num isEqualTo _value) then
	{
		_data set[_index,-1];
		_data = _data - [-1];
	}
		else
	{
		_data set[_index,[_ctrl,(_value - _num)]];
	};
	
	["cash","add",_num] call life_fnc_handleCash; 
	life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if([true,_ctrl,_num] call life_fnc_handleInv) then
	{
		if(_num isEqualTo _value) then
		{
			_data set[_index,-1];
			_data = _data - [-1];
		}
			else
		{
			_data set[_index,[_ctrl,(_value - _num)]];
		};
		life_trunk_vehicle setVariable["Trunk",[_data,(_old select 1) - _weight],true];
		[life_trunk_vehicle] call life_fnc_vehInventory;
	}
		else
	{
		[localize "STR_NOTF_InvFull", false] spawn domsg;;
	};
};