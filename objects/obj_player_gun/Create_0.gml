CD=15;
timing=CD;
angle=0;
x=room_width/2;
y=room_height/2;

attack=import_json("Attack.json");

Jattack=asset_get_index(attack[?"WaterBall"][?"obj"]);
Jcost=attack[?"WaterBall"][?"cost"];
Jhitbox=asset_get_index(attack[?"WaterBall"][?"juice_hitbox"]);

Kattack=asset_get_index(attack[?"Waterfall"][?"obj"]);
Kcost=attack[?"Waterfall"][?"cost"];
Khitbox=asset_get_index(attack[?"Waterfall"][?"juice_hitbox"]);



