// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function knockback_enemy(coordination_x,coordination_y,distance,time){
	if (time>=0){
	var angle = point_direction(coordination_x,coordination_y,x,y);
	x+=lengthdir_x(distance,angle);
	y+=lengthdir_y(distance,angle);
	return time-1;}
	else{
		knockback=false;
		return -1;
	}
}