_extDB = false;
_extDB = [] call compile preprocessfilelinenumbers "koth_server\init\extDB\init.sqf";

if (!_extDB) exitWith {
	server_status = false;
	publicVariable "server_status";

	diag_log "extDB: Failed to Load";
};

//create Playground
[] call compile preprocessfilelinenumbers "koth_server\init\zone\init.sqf";


// EventHandlers
addMissionEventHandler ["HandleDisconnect",{_this call serverEvents_fnc_handleDisconnect; false}];

"client_onPlayerKilled" addPublicVariableEventHandler
{diag_log str(_this); (_this select 1) spawn serverEvents_fnc_onKilled};


sleep 0.01;

TICKETS_BLU = 0;
publicVariable "TICKETS_BLU";
TICKETS_RED = 0;
publicVariable "TICKETS_RED";
TICKETS_IND = 0;
publicVariable "TICKETS_IND";

server_status = true;
publicVariable "server_status";

