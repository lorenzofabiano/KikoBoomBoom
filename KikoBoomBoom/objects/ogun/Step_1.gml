x = oPlayer.x;
y = oPlayer.y - 2;

image_angle = point_direction(x,y,mouse_x,mouse_y);
recoil = max(0,recoil - 1);

if ((mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb))) && (firedelay-- < 0) {
	//the higher, the more the gun moves backwards.
	recoil = 4;
	//the higher, the lower is the fire ratio
	firedelay = 5;
	//create the bullet in the Bullet's room layer and apply the following
	//values to it's instance
	//audio_sound_pitch(snShoot,choose(0.95,1,1.05));
	//audio_play_sound(snShoot,5,false);
	with (instance_create_layer(x,y,"Bullet",oBullet)) {
		//number of pixels traveling per frame
		spd = 25;
		//the direction to which the bullets moves. Other refers to 
		//the object that referenced this instance, therefore oGun.
		direction = other.image_angle + random_range(-2, 2);
		//the angle to draw the bullet's sprite at
		image_angle = direction;
	}
	with (oPlayer) {
		gunkickx = lengthdir_x(1.5,other.image_angle-180);
		gunkicky = lengthdir_y(1,other.image_angle-180);
	}
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

//when the gun is pointed in the right half of the screen, draw it straight
//when not, flip it vertically
if (image_angle > 90) && (image_angle < 270) {
	image_yscale = -1
} else image_yscale = 1;


