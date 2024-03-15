other.hp-=damage;
var _hitwall=instance_create_depth(x,y,0,obj_hitwall);
_hitwall.image_angle=point_direction(x,y,other.x,other.y);
instance_destroy(_shadow);
instance_destroy(self);
