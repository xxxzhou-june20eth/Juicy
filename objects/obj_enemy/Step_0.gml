var dis=point_distance(x,y,obj_player.x,obj_player.y);
var vector_to_player = point_direction(x,y,obj_player.x,obj_player.y);
var px=x;
var py=y;

timing--;
if (!dead){
switch (state)
{
	case EnemyState.Searching:
		
		//random movement
		direction=vector_to_player;
		x+=lengthdir_x(spd,direction);
		y+=lengthdir_y(spd,direction);
		
		//change image_xscale
		if (direction<=90 || direction>=270){
			image_xscale=1;
		}
		else{
			image_xscale=-1;
		}
		
		//change_state
		if (dis<med_distance){
			state=EnemyState.First_move;
			move_towards_point(obj_player.x,obj_player.y,spd);
		}
		
	break
	
	case EnemyState.First_move:
				
		//change image_xscale
		if (vector_to_player<=90 || vector_to_player>=270){
			image_xscale=1;
		}
		else{
			image_xscale=-1;
		}
		
		//change state
		if (dis>close_distance){
			state=EnemyState.Second_move;
			var vari=irandom_range(-45,45);
			direction=vector_to_player+vari;
			if (direction<0){
				direction=360+direction;
			}
		}
		
	break;

	case EnemyState.Second_move:
	
		if (dis>med_distance){
			state=EnemyState.Third_move;
			var low=vector_to_player-45;
			var high=vector_to_player+45;
			if (low<0){
				high=360+low;
				low=vector_to_player+45;
			}
			direction=irandom(359);
			while (direction>low && direction<high){
				direction=irandom(359);
			}
		}
	
	break;
	
	case EnemyState.Third_move:
		
		if (dis>far_distance){
			state=EnemyState.Searching;
		}
		
	break;
	
}
}
//collision
if (place_meeting(x+2,y,obj_rock)){
	x=px;
	direction-=180;
}
if (place_meeting(x,y+2,obj_rock)){
	y=py;
	direction-=180;
}

if (x<obj_camera.w/2 || x>room_width-obj_camera.w/2){
	x=px;
}
if (y<obj_camera.h/2 || y>room_height-obj_camera.h/2){
	y=py;
}

//knock_back
if (knockback){
	if (!dead){
		if (!knew){
		time=2;
		sd=5;
		knew=true;
		}
	time=knockback_enemy(coordination_x,coordination_y,sd,time);
	}
	else{
		direction=point_direction(coordination_x,coordination_y,x,y);
		speed=10;
		timing=3;
	}

}
	

//death
if (hp<=0){
	instance_destroy(gun);
	dead=true;
	image_speed=0;
	
	if (timing<=0){
		speed=0;
	}
}
