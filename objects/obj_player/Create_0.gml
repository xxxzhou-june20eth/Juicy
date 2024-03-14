x=room_width/2;
y=room_height/2;

Player=import_json("Player.json");
State=import_json("Player_states.json");

spd=Player[?"spd"];
hp=Player[?"hp"];

state=State[?"empty"];
runs=state[?"run"];
idles=state[?"idle"];
attack_chance=state[?"attack_chance"];
