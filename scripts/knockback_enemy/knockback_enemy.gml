// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function knockback_enemy(coordination_x,coordination_y,distance,time){
	show_debug_message(string(id)+": "+string(time));
	if (time>=0){
		var angle = point_direction(coordination_x,coordination_y,x,y);
		var nx=x+lengthdir_x(distance,angle);
		var ny=y+lengthdir_y(distance,angle);
		
		while (place_meeting(nx,ny,obj_rock)){
			angle-=irandom_range(70,200);
			var nx=x+lengthdir_x(distance,angle);
			var ny=y+lengthdir_y(distance,angle);
		}
		
		x=nx
		y=ny
		
		return (time-1);
	}
	else{
		knockback=false;
		knew=false;
		return -1;
	}
}