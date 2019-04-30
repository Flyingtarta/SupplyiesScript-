//go back to the safe position
_dvr = chof select 0; //make the global variable a local one
dostop _dvr; // stop
waituntil { (speed vehicle _dvr < 1 )}; //wait until is stopped
_dvr domove safe; // move to safe position
_dvr sidechat "volviendo al lz seguro"; // reports he is going back 
