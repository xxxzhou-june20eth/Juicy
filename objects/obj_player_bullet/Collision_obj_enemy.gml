other.hp-=damage;
instance_create_depth(x,y,0,obj_hitwall);
instance_destroy(_shadow);
instance_destroy(self);
