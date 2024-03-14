x=obj_player.x
y=obj_player.y;

angle=point_direction(x,y,mouse_x,mouse_y);
show_debug_message(angle);

if (mouse_x>x){
	image_xscale=-1;
	image_angle=point_direction(x,y,mouse_x,mouse_y);
}
else{
	image_xscale=1;
	image_angle=point_direction(mouse_x,mouse_y,x,y);
}

timing--;

if (mouse_check_button_pressed(1) && timing<=0 && obj_player.state!=PlayerState.attacking){
	var bx=x+lengthdir_x(38,angle);
	var by=y+lengthdir_y(38,angle);
	var bullet=instance_create_layer(bx,by,"Bullets",obj_player_bullet);
	var hitbox=instance_create_depth(bx,by,0,obj_hitbox);
	var _shadow=instance_create_layer(bx,by,"Shadow",obj_shadow);
	_shadow.owner=bullet;
	hitbox.owner=self;
	bullet._shadow=_shadow;
	audio_play_sound(Player_shoot,1,false);
	bullet.direction=point_direction(x,y,mouse_x,mouse_y)+irandom_range(-3,3);
	bullet.image_angle=angle;
	timing=CD;
}

