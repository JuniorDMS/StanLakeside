/*
	File: fn_ticketPay.sqf


	Description:
	Pays the ticket.
*/
if(isnil {life_ticket_val} || isNil {life_ticket_cop}) exitWith
{
	["Cos poszlo nie tak",false] spawn domsg;
};
if(cash_in_hand < life_ticket_val) exitWith
{
	if(cash_in_bank < life_ticket_val) exitWith
	{
		hint localize "STR_Cop_Ticket_NotEnough";
		[1,format[localize "STR_Cop_Ticket_NotEnoughNOTF",profileName]] remoteExecCall ["life_fnc_broadcast", -2];
		closeDialog 0;
	};
	hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
	["bank","take",life_ticket_val] call life_fnc_handleCash;
	[6] call SOCK_fnc_updatePartial;
	life_ticket_paid = true;
	[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
	closeDialog 0;
	[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]] remoteExecCall ["life_fnc_broadcast", -2];
	[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];
};

hint format[localize "STR_Cop_Ticket_Paid",[life_ticket_val] call life_fnc_numberText];
["cash","take",life_ticket_val] call life_fnc_handleCash;
[6] call SOCK_fnc_updatePartial;
life_ticket_paid = true;
["Add",10] call fnc_karma;
[getPlayerUID player] remoteExec ["life_fnc_wantedRemove",2];
closeDialog 0;
[1,format[localize "STR_Cop_Ticket_PaidNOTF_2",profileName]] remoteExecCall ["life_fnc_broadcast", -2];
[life_ticket_val,player,life_ticket_cop] remoteExecCall ["life_fnc_ticketPaid",life_ticket_cop];