clr =  make_color_hsv(0, 0, 255 - clamp(point_distance(Player.x, Player.y, x, y), 0, 255));

if(collision_point(Player.x, Player.y, self, 0, 0) && (Player.playerstate == state.Crouch || Player.playerstate == state.Prone))
{ Camera.interact = true; }
else
{ Camera.interact = false; }