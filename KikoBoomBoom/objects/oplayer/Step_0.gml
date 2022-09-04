if (hascontrol) {
	//set keys

	//(check every frame if the key is held down)
	var key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	var key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));

	//check if on this frame the key has been pressed (not held)
	var key_jump = keyboard_check_pressed(vk_space);
	
		//jumping
	if (canJump-- > 0) && (key_jump = 1 ) {
		vsp = vspJump;
		canJump = 0;
		//audio_play_sound("da inserire audio",1,false);
	}
}
else {	
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}

var move = key_right - key_left;
hsp = (move * walksp) + gunkickx;
gunkickx = 0;

//every frame increase the vertical speed by 0.2 (grv value)
vsp = (vsp + grv) + gunkicky;
gunkicky = 0;

//if there's a collision with walls on the player's position
// plus hsp value of pixels ahead, completely stop player's movement.
//	But untill the player is not completely close to the wall, take his 
//	 movement speed and cut it in half for every frame untill he's 
//	 just moving at 0.1 pixels per frame, then stop the player's movement.
if (place_meeting(x+hsp,y,oWall)){
	while (abs(hsp) > 0.1) {
		hsp *= 0.5;
		if (!place_meeting(x+hsp,y,oWall)) x += hsp;
	}
	
	hsp = 0;
}

x += hsp;

if (place_meeting(x,y+vsp,oWall)){
	if (vsp > 0) canJump = 5;
	while (abs(vsp) > 0.1) {
		vsp *= 0.5; 
		if (!place_meeting(x,y+vsp,oWall)) y += vsp;
	}
	
	vsp = 0;
}

y += vsp;

