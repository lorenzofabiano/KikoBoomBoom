x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

if (place_meeting(x,y,oShootable)) {

	with (instance_place(x,y,oShootable)) {
		hp-- ;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}



