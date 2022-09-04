/// @description Set up camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

//length of shaking in frames
shake_length = 0;

//maximum power of the shaking, number of pixels in each direction the camera will
//shake
shake_magnitude = 0;

//the power of the shaking that will be decreased over time
shake_remain = 0;

//make sure not to shake the camera outside the room position
buff = 32;




