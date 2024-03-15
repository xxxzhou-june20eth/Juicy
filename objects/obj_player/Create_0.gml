x=room_width/2;
y=room_height/2;

Player=import_json("Player.json");
Fullness=import_json("Player_states.json");

spd=Player[?"spd"];
hp=Player[?"hp"];
fuln=Fullness[?"empty"];
runs=asset_get_index(fuln[?"run"]);
idles=asset_get_index(fuln[?"idle"]);
sucks=asset_get_index(fuln[?"suck"]);
attack_chance=fuln[?"attack_chance"];

state=PlayerState.running;
liquid_contained=0;
attacking_time=0;
suck_next=false;
reverse_ani=false;