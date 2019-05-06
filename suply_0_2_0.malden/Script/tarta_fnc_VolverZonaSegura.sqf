//en desuso
/*

_caller = _this select 1;
_id = _this select 2;

_caller removeAction _id;

_dvr = chof select 0; //make the global variable a local one
dostop _dvr; // stop
waituntil { (speed vehicle _dvr < 1 )}; //wait until is stopped
_dvr domove safe; // move to safe position
_dvr sidechat "volviendo al punto Seguro";
waituntil {_dvr distance2d safe < 20 && speed vehicle _dvr < 5};

vehicle _dvr setFuel 0;
_dvr action ["EngineOff", vehicle _dvr];

_dvr setbehaviour "SAFE";
_dvr setSpeedMode "NORMAL";
