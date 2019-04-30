//agrega accion a los lideres
//params [_name1,_script1,_name2,_script2];
// add action to the leaders. 


_name1   = _this select 0;
_script1 = _this select 1;
_name2   = _this select 2;
_script2 = _this select 3;

{
  if (alive _x && leader (group _x) == _x && !(_x in liderVec)) then
{
[ liderVec , _x] call BIS_fnc_arrayPush;

_x addaction [_name1, _script1, nil , 2, false, false, "" ,"" , 0.00001 ,false, "", ""];

_x addaction [_name2, _script2, nil , 2, false, false, "" , "" , 0.00001 ,false, "", ""];

};
} foreach allplayers - entities "HeadlessClient_F";
