var hmove=keyboard_check(ord("D"))-keyboard_check(ord("A"));
var vmove=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var px=x;
var py=y;

switch (state){
	case PlayerState.running:
		//change sprite
		if (hmove!=0){
			sprite_index=runs;
			image_xscale=hmove;
		}
		else{
			sprite_index=idles;
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

		//change state to sucking
		if (keyboard_check_pressed(vk_space)){
			state=PlayerState.sucking;
		}
		else if (mouse_check_button_pressed(1)){ //change state to attacking
			attacking_time+=1;
			if (attacking_time>=5 && !mouse_check_button_released(1)){
				state=PlayerState.attacking;
			}
		}
			
	break;
	
	case PlayerState.sucking:
		//add liquid to the cups
		liquid_contained++;
		if (keyboard_check_released(vk_space)){
			change_fullness(liquid_contained);
			attack_chance=fuln[?"attack_chance"];
			state=PlayerState.running;
		}
		if (liquid_contained>=100){
			liquid_contained=100;
			change_fullness(liquid_contained);
			attack_chance=fuln[?"attack_chance"];
			state=PlayerState.running;
		}
	break;
		
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
