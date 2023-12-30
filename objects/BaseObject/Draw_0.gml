draw_sprite_billboard(sprite, image_index, x, y, z, 1, clr);

if(drawline)
{
	var linecolor = c_lime;
	if (point_distance(x, y, Player.x, Player.y) > 255)
	{ linecolor = c_red; }
	
	draw_line_color(x, y, Player.x, Player.y, linecolor, linecolor);
}