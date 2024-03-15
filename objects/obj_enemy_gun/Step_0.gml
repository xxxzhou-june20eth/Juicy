x=owner.x
y=owner.y;

angle=point_direction(x,y,obj_player.x,obj_player.y)

if (obj_player.x>x){
	image_xscale=-1;
	image_angle=point_direction(x,y,obj_player.x,obj_player.y);
}
else{
	image_xscale=1;
	image_angle=point_direction(obj_player.x,obj_player.y,x,y);
}

timing--;

if (timing<=0){
	var bx=x+lengthdir_x(38,angle);
	var by=y+lengthdir_y(38,angle);
	var bullet=instance_create_layer(bx,by,"Bullets",obj_enemy_bullet);
	var hitbox=instance_create_depth(bx,by,0,obj_enemy_hitbox);;
	var _shadow=instance_create_layer(bx,by,"Shadow",obj_shadow);
	_shadow.owner=bullet;
	hitbox.owner=self;
	bullet._shadow=_shadow;
	audio_play_sound(Enemy_shoot,1,false);
	bullet.direction=point_direction(x,y,obj_player.x,obj_player.y)+irandom_range(-3,3);
	bullet.image_angle=angle;
	CD=irandom_range(120,180);
	timing=CD;
}

