event_inherited();

if(collision_point(Player.x, Player.y, self, 0, 0))
{ open = true; }
else
{ open = false; }

if(open)
{ zrot = image_angle + angle; }
else
{ zrot = image_angle; }