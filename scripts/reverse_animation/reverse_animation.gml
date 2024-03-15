// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reverse_animation(next_state){
	image_speed=-1;
	if (image_speed==-1 && image_index<1){
		state=next_state;
		change_fullness(liquid_contained);
		sprite_index=runs;
		image_speed=1;
	}
}