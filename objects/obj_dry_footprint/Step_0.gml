countdown--;

if (countdown<=0){
	instance_destroy(self);
}

if (place_meeting(x,y,obj_pool)){
	instance_destroy(self);
}
