// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_fullness(liquid_contained){
	
	if (liquid_contained>=85){
		fuln=Fullness[?"full"];
	}
	else if (liquid_contained>=65){
		fuln=Fullness[?"thref"];
	}
	else if (liquid_contained>=35){
		fuln=Fullness[?"half"];
	}
	else if (liquid_contained>=15){
		fuln=Fullness[?"quarter"];
	}
	else{
		fuln=Fullness[?"empty"];
	}
	
	runs=fuln[?"run"];
	idles=fuln[?"idle"];
	sucks=fuln[?"suck"];
	
}