// Camera
if(window_has_focus())
{
	//look_dir = (window_mouse_get_x() - window_get_width() / 2) / camera_speed;//point_direction(x, y, Camera.x, Camera.y)
	
	look_dir = clamp(look_dir, 0, 360);
	look_pitch += (window_mouse_get_y() - window_get_height() / 2) / camera_speed;
	look_pitch = clamp(look_pitch, camera_min_y, camera_max_y);
	
	window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	
	if(!keyboard_check(vk_tab))
	{ window_set_cursor(cr_none); }
	else
	{ window_set_cursor(cr_default); }
}

// Movement
// Run
if (keyboard_check(vk_shift) && playerstate != state.Crouch && playerstate != state.Prone)
{ playerstate = state.Run; }
if (keyboard_check_released(vk_shift) && playerstate != state.Crouch && playerstate != state.Prone)
{ playerstate = state.Idle; }

// Crouch
if (keyboard_check_pressed(vk_control) && !under_solid)
{
	if (playerstate = state.Idle || playerstate = state.Walk || playerstate == state.Prone || playerstate == state.Run)
	{ playerstate = state.Crouch }
	else
	{ playerstate = state.Idle  }
}

// Prone
if (keyboard_check_pressed(ord("C")) && !under_solid)
{
	if (playerstate = state.Idle || playerstate = state.Walk || playerstate == state.Crouch || playerstate == state.Run)
	{ playerstate = state.Prone; }
	else
	{ playerstate = state.Crouch;  }
	
}

// Basic movement
if (keyboard_check(ord("D"))) {
	
	look_dir -= camera_speed;
	//move_and_collide(-dsin(look_dir) * move_speed, -dcos(look_dir) * move_speed, BaseCollision);
	//x-=move_speed;
	
	if(playerstate = state.Idle)
	{ playerstate = state.Walk; }
}
if (keyboard_check(ord("Q"))) {
	
	look_dir += camera_speed;
	//move_and_collide( dsin(look_dir) * move_speed, dcos(look_dir) * move_speed, BaseCollision);
	//x+=move_speed;
	
	if(playerstate = state.Idle)
	{ playerstate = state.Walk; }
}
if (keyboard_check(ord("Z"))) {
	
	move_and_collide(dcos(look_dir) * move_speed, -dsin(look_dir) * move_speed, BaseCollision);
	//y-=move_speed;
	
	if(playerstate = state.Idle)
	{ playerstate = state.Walk; }
}
if (keyboard_check(ord("S"))) {
	
	move_and_collide(-dcos(look_dir) * move_speed, dsin(look_dir) * move_speed, BaseCollision);
	//y+=move_speed;
	
	if(playerstate = state.Idle)
	{ playerstate = state.Walk; }
}

if (!keyboard_check(ord("Q")) && !keyboard_check(ord("D")) && !keyboard_check(ord("Z")) && !keyboard_check(ord("S")))
{
	if (playerstate != state.Crouch && playerstate != state.Prone)
	{ playerstate = state.Idle }
}

// State machine
switch(playerstate)
{
	case state.Idle:
		//headbob = 1 * abs(sin(current_time/1000)) + 5;
		//z = headbob + baselevel + 64;
		break;
		
	case state.Walk:
		//headbob = 2 * abs(sin(current_time/300)) + 1;
		//z = headbob + baselevel + 64;
		move_speed = 2;
		break;
		
	case state.Run:
		//headbob = 5 * abs(sin(current_time/100)) + 3;
		//z = headbob + baselevel + 64;
		move_speed = 4;
		break;
		
	case state.Crouch:
		//headbob = 0;
		//z = headbob + baselevel + 32;
		move_speed = .5;
		break;
		
	case state.Prone:
		//headbob = 0;
		//z = headbob + baselevel + 8;
		move_speed = .25;
		break;
}

under_solid = false; 

// Restart game when pressing "delete"
if(keyboard_check_pressed(vk_delete))
{ game_restart(); }

// Shoot when pressing left mouse
if(mouse_check_button_pressed(mb_left) && !shooting && !reloading)
{
	shooting = true;
	alarm[0] = 2;
}

// Put the lookdir between the boundaries of 360°
while(look_dir >= 360)
{ look_dir -= 360; }

while(look_dir < 0)
{look_dir += 360; }

// Creating an interaction point
var x_offset = lengthdir_x(interact_distance, look_dir);
var y_offset = lengthdir_y(interact_distance, look_dir);
var z_offset = -lengthdir_z(interact_distance, look_pitch);

interactpoint = [x + x_offset, y + y_offset, z + z_offset];

// Not stuck in walls
move_outside_solid(look_dir-180, 1);