x=obj_player.x-obj_player.image_xscale*3;
y=obj_player.y-obj_player.sprite_height/2+1;

angle=point_direction(x,y,mouse_x,mouse_y);

if (mouse_x>x){
	image_xscale=-1;
	image_angle=point_direction(x,y,mouse_x,mouse_y);
}
else{
	image_xscale=1;
	image_angle=point_direction(mouse_x,mouse_y,x,y);
}

timing--;

if (keyboard_check_pressed(ord("J")) && timing<=0 && obj_player.liquid_contained>=Jcost){
	var bx=x+image_xscale*lengthdir_x(sprite_width,angle);
	var by=y+image_xscale*lengthdir_y(sprite_width,angle);
	var bullet=instance_create_layer(bx,by,"Bullets",Jattack);
	var hitbox=instance_create_depth(bx,by,0,Jhitbox);
	var _shadow=instance_create_layer(bx,by,"Shadow",obj_shadow);
	_shadow.owner=bullet;
	hitbox.owner=self;
	bullet._shadow=_shadow;
	audio_play_sound(Player_shoot,1,false);
	bullet.direction=point_direction(x,y,mouse_x,mouse_y)+irandom_range(-3,3);
	bullet.image_angle=angle;
	timing=CD;
	obj_player.liquid_contained-=Jcost;
}

