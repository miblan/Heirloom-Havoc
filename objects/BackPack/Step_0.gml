clr =  make_color_hsv(0, 0, 255 - clamp(point_distance(Player.x, Player.y, x, y), 0, 255));

if
(
	Player.interactpoint[0] <= x + ((sprite_get_width(sprite_index)*image_xscale)/2)
	&& Player.interactpoint[0] >= x - ((sprite_get_width(sprite_index)*image_xscale)/2)
	&& Player.interactpoint[1] <= y + ((sprite_get_width(sprite_index)*image_xscale)/2)
	&& Player.interactpoint[1] >= y - ((sprite_get_width(sprite_index)*image_xscale)/2)
	&& Player.interactpoint[2] >= z
	&& Player.interactpoint[2] <= z + ((sprite_get_height(sprite_index)*image_xscale)/2)
	&& (Player.playerstate == state.Crouch || Player.playerstate == state.Prone)
	&& !collision_line(Player.x, Player.y, x, y, Solid, 0, 1)
)
{ Camera.interact = true; }
else
{ Camera.interact = false; }