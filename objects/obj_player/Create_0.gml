x=room_width/2;
y=room_height/2;

Player=import_json("Player.json");
Fullness=import_json("Player_states.json");

spd=Player[?"spd"];
hp=Player[?"hp"];

fuln=Fullness[?"empty"];
runs=fuln[?"run"];
idles=fuln[?"idle"];
sucks=fuln[?"suck"];
attack_chance=fuln[?"attack_chance"];

state=PlayerState.running;
liquid_contained=0;
attacking_time=0;