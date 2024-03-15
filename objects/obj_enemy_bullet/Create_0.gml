Attack=import_json("Attack.json");
Attack=Attack[?"EnemyBullets"];
speed=Attack[?"spd"];
damage=Attack[?"damage"];
_hitbox=asset_get_index(Attack[?"juice_hitbox"]);
_hitwall=asset_get_index(Attack[?"juice_hitwall"]);
_shadow="";

