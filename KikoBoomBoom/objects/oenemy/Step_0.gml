/// @description movement engine
//set keys

if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,oWall)) {
	hsp = -hsp;
}
//every frame increase the vertical speed by 0.2 (grv value)
vsp = vsp + grv;

//for every frame in which there's no vertical collision, assume that 
// the player is airborne
//airborne = 1

//calculate collisions


//Collisions


if place_meeting(x+hsp,y,oWall){
	
	while (!place_meeting(x+sign(hsp),y,oWall)){		
		 x += sign(hsp);
	}
	//every time the enemy meets a wall, make it run in the
	//opposite direction
	hsp = -hsp;
}

x += hsp;

if (place_meeting(x,y+vsp,oWall)){
	while (abs(vsp) > 0.1) {
		vsp *= 0.5; 
		if (!place_meeting(x,y+vsp,oWall)) y += vsp;
	}
	
	vsp = 0;
}

y += vsp;

//Animation

// if there's no collision below the player and therefore he's airborne,
if (!place_meeting(x,y+1,oWall)) {
	
	grounded = false
	// draw his airborne sprite
//	sprite_index = sEnemy_air;
	// don't animate it
	image_speed = 0;
	
	//if he's falling, use the second frame of his sprite, if he's jumping
	//use the first
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
 }
// if there's a collision below the player and therefore he's on the ground,
else {
	 grounded = true
	
	// start animating
	 image_speed = 1;
	 
	 //if the player is still, use the default idle sprite.
	 if (hsp == 0) {
//		 sprite_index = sEnemy_id;
	 }
	 
	 //if the player is moving, use the run sprite animation
	 else {
//		 sprite_index = sEnemy_run;
	 }
}

//Draw the player sprite according to the direction he's moving.
// Draw straight or reverse the object's current sprite when it's moving
//	on the ground.
if (hsp != 0) image_xscale = sign(hsp)


