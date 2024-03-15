if (owner!=""){
x=owner.x+owner.image_xscale*lengthdir_x(owner.sprite_width,owner.angle);
y=owner.y+owner.image_xscale*lengthdir_y(owner.sprite_width,owner.angle);
image_angle=owner.angle+270;
}
else{
	instance_destroy(self);
}
