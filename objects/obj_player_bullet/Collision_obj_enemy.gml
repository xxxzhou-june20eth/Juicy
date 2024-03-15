other.hp-=damage;
var _hitwall1=instance_create_depth(x,y,0,_hitwall);
_hitwall1.image_angle=point_direction(x,y,other.x,other.y);
instance_destroy(_shadow);
instance_destroy(self);
