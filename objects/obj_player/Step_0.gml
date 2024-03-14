var hmove=keyboard_check(ord("D"))-keyboard_check(ord("A"));
var vmove=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var px=x;
var py=y;

//change sprite
if (hmove!=0){
	sprite_index=spr_player_run;
	image_xscale=hmove;
}
else{
	sprite_index=spr_player_idle;
}

//movement
if (hmove!=0 && vmove!=0){
	x+=hmove*spd*0.7;
	y+=vmove*spd*0.7;
}
else{
	x+=hmove*spd;
	y+=vmove*spd;
}

//collision
if (place_meeting(x+2,y,obj_rock)){
	x=px;
}
if (place_meeting(x,y+2,obj_rock)){
	y=py;
}

if (x<obj_camera.w/2 || x>room_width-obj_camera.w/2){
	x=px;
}
if (y<obj_camera.h/2 || y>room_height-obj_camera.h/2){
	y=py;
}
