hmove=keyboard_check(ord("D"))-keyboard_check(ord("A"));
vmove=keyboard_check(ord("S"))-keyboard_check(ord("W"));
var suck=keyboard_check(vk_space);
var waterball=mouse_check_button(1);
var waterfall=keyboard_check(ord("K"));
var px=x;
var py=y;
var ps=state;

change_fullness(liquid_contained);

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
		
		//change state
		if (suck){
			if (place_meeting(x,y,obj_pool) && liquid_contained<=90){
				var i=-image_xscale;
				state=PlayerState.suck_ani;
				sprite_index=sucks;
				image_xscale=i;
			}
		}
		else if (waterfall){
			state=PlayerState.attacking;
		}
		
	break;
	
	case PlayerState.suck_ani:
		if (image_index>=3){
			obj_player_gun.visible=false;
		}
		if (keyboard_check_released(vk_space) or waterfall or waterball){
			state=PlayerState.antisuck;
		}
	break;
	
	case PlayerState.sucking:
			
			if (!audio_is_playing(snd_sucking)){
				audio_play_sound(snd_sucking,1,false);
			}
			
			//add liquid to the cups
			liquid_contained++;
			//change sprites while sucking
			change_fullness(liquid_contained);
			sprite_index=sucks;
			image_speed=0;
			image_index=10;

			if (liquid_contained>=100){ //if full
					liquid_contained=100;
					state=PlayerState.antisuck;
					suck_next=false;
			}
			
			if (keyboard_check_released(vk_space) or waterfall or waterball){
				state=PlayerState.antisuck;
			}
			
	break;
	
	case PlayerState.antisuck:
		if (audio_is_playing(snd_sucking)){
			audio_pause_sound(snd_sucking);
		}
		
		reverse_animation(PlayerState.running);
		if (image_index<=3){
			obj_player_gun.visible=true;
		}
	break;
	
	case PlayerState.attacking:
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
		
		//change state
		if (suck){
			if (place_meeting(x,y,obj_pool) && liquid_contained<=90){
				state=PlayerState.suck_ani;
				sprite_index=sucks;
			}
		}
		else if (!waterfall){
			state=PlayerState.running;
		}
	break;
}

if (wet>=0){
	wet--;
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
