var hmove=keyboard_check(ord("D"))-keyboard_check(ord("A"));
var vmove=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var px=x;
var py=y;

switch (state){
	case PlayerState.running:
		//change sprite
		if (hmove!=0){
			sprite_index=runs;
			image_xscale=-hmove;
		}
		else if (vmove!=0){
			sprite_index=runs;
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
		if (keyboard_check_pressed(vk_space) && place_meeting(x,y,obj_pool)){
			state=PlayerState.sucking;
			sprite_index=sucks;
		}
		else if (mouse_check_button_pressed(2)){ //change state to attacking
			attacking_time+=1;
			if (attacking_time>=5 && !mouse_check_button_released(1)){
				state=PlayerState.attacking;
			}
		}
			
	break;
	
	case PlayerState.sucking:
	
		if (keyboard_check_pressed(vk_space)){//continuously press spacebar to suck
			image_speed=1;
		}
		else{
			image_speed=0;
		}
		
		if (suck_next){ //animation done
			//add liquid to the cups
			liquid_contained++;
			
			//change sprites while sucking
			change_fullness(liquid_contained);
			sprite_index=sucks;
			image_speed=0;
			image_index=11;
			
			//if attacks
			if (keyboard_check(ord("J"))){
				suck_next=false;
			}
				
			//if finish sucking
			if (keyboard_check_released(vk_space)){
				attack_chance=fuln[?"attack_chance"];
				reverse_animation(PlayerState.running);
				suck_next=false;
			}
			else{
				if (liquid_contained>=100){ //if full
					liquid_contained=100;
					attack_chance=fuln[?"attack_chance"];
					reverse_animation(PlayerState.running);
					suck_next=false;
				}
			}
		}
		else{ //if animation is not done
			reverse_animation(PlayerState.running);
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
