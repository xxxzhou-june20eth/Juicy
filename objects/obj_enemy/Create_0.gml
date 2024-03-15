Enemy=import_json("Enemy.json");
Distance=Enemy[?"distance"]
spd=Enemy[?"spd"];
hp=Enemy[?"hp"];
close_distance=Distance[?"close_distance"];
med_distance=Distance[?"medium_distance"];
far_distance=Distance[?"far_distance"];

coordination_x=undefined;
coordination_y=undefined;
knockback=false;
dead=false;
knew=false;
time=0;


timing=30;
gun="";
_shadow="";
state=EnemyState.Searching;
pass=false;


