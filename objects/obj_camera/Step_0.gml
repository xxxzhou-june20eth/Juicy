angle=point_direction(obj_player.x,obj_player.y,mouse_x,mouse_y)
cx=obj_player.x-w/2+lengthdir_x(len,angle);
cy=obj_player.y-h/2+lengthdir_y(len,angle);


camera_set_view_pos(view_camera[0],cx,cy);
