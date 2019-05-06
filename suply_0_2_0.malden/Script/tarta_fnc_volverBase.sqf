//go back to the base
hint "volvemo";
_dvr = chof select 0; //make the global variable a local one

_caller = _this select 1;
_id = _this select 2;

_caller removeAction _id;

vehicle _dvr setfuel 1;

dostop _dvr; // stop

waituntil { (speed vehicle _dvr < 3 )}; //wait until is stopped

_dvr domove base; // move to safe position
_dvr sidechat "RTB"; // reports he is going back

waituntil {_dvr distance2d base < 50};
_dvr setbehaviour "SAFE";
_dvr setSpeedMode "NORMAL";
