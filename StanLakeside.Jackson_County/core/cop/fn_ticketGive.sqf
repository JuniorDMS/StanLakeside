/*
	File: fn_ticketGive.sqf
	
	
	Description:
	Gives a ticket to the targeted player.
*/
private["_val"];
if(isNil {life_ticket_unit}) exitWith {[localize "STR_Cop_TicketNil", false] spawn domsg;};
if(isNull life_ticket_unit) exitWith {[localize "STR_Cop_TicketExist", false] spawn domsg;};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) exitWith {[localize "STR_Cop_TicketNum", false] spawn domsg;};
if((parseNumber _val) > 100000) exitWith {[localize "STR_Cop_TicketOver100", false] spawn domsg;};
[0,format[localize "STR_Cop_TicketGive",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]] remoteExecCall ["life_fnc_broadcast", -2];
[player,(parseNumber _val)] remoteExec ["life_fnc_ticketPrompt",life_ticket_unit];
_playerID = getPlayerUID player;
_playerName = name player;
_byPlayerID = getPlayerUID life_ticket_unit;
_byPlayerName = name life_ticket_unit;
_type = 0;
_amount = _val;
[_playerID,_playerName,_byPlayerID,_byPlayerName,_type,_amount] remoteExecCall ["TON_fnc_copLog", (call life_fnc_HCC)];
closeDialog 0;
