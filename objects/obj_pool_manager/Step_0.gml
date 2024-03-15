while (pooln<pool_number){
	var cx=irandom_range(obj_camera.w/2+80,room_width-obj_camera.w/2-80);
	var cy=irandom_range(obj_camera.h/2+80,room_height-obj_camera.h/2-80);
	
	while (place_meeting(cx,cy,obj_rock)){
		cx=irandom_range(obj_camera.w/2+80,room_width-obj_camera.w/2-80);
		cy=irandom_range(obj_camera.h/2+80,room_height-obj_camera.h/2-80);
	}
	
	instance_create_layer(cx,cy,"Pool",obj_pool);
	pooln+=1;
}