if (!enemy_created){
	for (var i=0;i<enemy_number;i++){
		var cx=irandom_range(500,1500);
		var cy=irandom_range(500,1500);
		
		while (place_meeting(cx,cy,obj_rock)){
			cx=irandom_range(500,1500);
			cy=irandom_range(500,1500);
		}
		
		var enemy=instance_create_layer(cx,cy,"Enemy",obj_enemy);
		var gun=instance_create_layer(cx,cy,"Guns",obj_enemy_gun);
		var _shadow=instance_create_layer(x,y,"Shadow",obj_shadow);
		enemy.gun=gun;
		enemy._shadow=_shadow;
		gun.owner=enemy;
		_shadow.owner=enemy;
	}
	enemy_created=true;
}
