// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_hitbox_on_rock(_self,_other,_hitwall){
	var cx=(_self.x+_other.x)/2;
	var cy=(_self.y+_other.y)/2;
	var ca;
	
	if (point_distance(cx,_other.y,_other.x,_other.y)>=sprite_width/2-2){
		if (cx>_other.x){
			ca=180;
			cx+=5;
		}
		else{
			ca=0;
			cx-=5;
		}
	}
	else if (point_distance(_other.x,cy,_other.x,_other.y)>=sprite_height/2-2){
		if (cy>_other.y){
			ca=90;
		}
		else{
			ca=270;
			cy-=8;
		}
	}
	else{
		return -1
	}
	var _hitwall1=instance_create_depth(cx,cy,0,_hitwall);
	_hitwall1.image_angle=ca;
	return 1;
}