if (liquid_contained>=80){
	sprite_index=spr_pool_100;
	image_index=image;
}
else if (liquid_contained>=60){
	sprite_index=spr_pool_80;
	image_index=image;
}
else if (liquid_contained>=40){
	sprite_index=spr_pool_60;
	image_index=image;
}
else if (liquid_contained>=20){
	sprite_index=spr_pool_40;
	image_index=image;
}
else if (liquid_contained>=10){
	sprite_index=spr_pool_20;
	image_index=image;
}
else if (liquid_contained>=0){
	sprite_index=spr_pool_10;
	image_index=image;
}
else{
	instance_destroy(self);
	obj_pool_manager.pooln-=1;
}
	
