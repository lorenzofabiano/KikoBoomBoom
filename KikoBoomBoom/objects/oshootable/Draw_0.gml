/// @description 
draw_self();

//when the entity gets shot, the flash value rises to 3 (oBullet)
//from then, decrease the flash variable once every frame untill it gets
//back to 0.

//when flash = true, draw the white shader over the enemy sprite.
if (flash > 0) {
	flash-- ;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
