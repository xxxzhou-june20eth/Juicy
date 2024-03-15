
if (obj_player.hmove!=0 || obj_player.vmove!=0){
	countdown--;
	sound=true;
}

if (obj_player.hmove==0 && obj_player.vmove==0){
	sound=false;
	p=false;
	w=false;
	d=false;
}


if (!place_meeting(obj_player.x,obj_player.y,obj_pool) && obj_player.wet>=0 && obj_player.wet<=115){
	
	state=FootPrintState.wet;
}
	
if (!place_meeting(obj_player.x,obj_player.y,obj_pool) && obj_player.wet<=0){
	state=FootPrintState.dry;
}

if (sound){
if (state==FootPrintState.pool){
	if (!p){
		p=true;
		w=false;
		d=false;
		audio_pause_all();
		audio_play_sound(snd_pool_walk,1,true);
	}
}
if (state==FootPrintState.wet){
	if (!w){
		p=false;
		w=true;
		d=false;
		audio_pause_all();
		audio_play_sound(snd_wet_walk,1,true);
	}
}
if (state==FootPrintState.dry){
	if (!d){
		p=false;
		w=false;
		d=true;
		audio_pause_all();
		audio_play_sound(snd_dry_walk,1,true);
	}
}
}
else{
	if (obj_player.state !=PlayerState.sucking){
		audio_pause_all();
	}
}



if (countdown<=0){
	countdown=10;
	if (state==FootPrintState.dry){
		instance_create_layer(obj_player.x,obj_player.y,"Shadow",obj_dry_footprint);
	}
	if (state==FootPrintState.wet){
		instance_create_layer(obj_player.x,obj_player.y,"Shadow",obj_wet_footprint);
	}
}
			