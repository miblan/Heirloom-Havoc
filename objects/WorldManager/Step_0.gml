vertex_begin(Camera.buffer_test, Camera.vertex_format);

// Create all solids
for(var i = 0; i < instance_number(Solid); i++)
{
	var wall = instance_find(Solid, i);
	//if(!point_direction(Player.x, Player.y, wall.x + wall.image_xscale/2, wall.y) > Player.look_dir + 90 && !point_direction(Player.x, Player.y, wall.x + wall.image_xscale/2, wall.y) < Player.look_dir + 270 )
	{
		if (wall.image_xscale > wall.image_yscale || (wall.image_xscale == wall.image_yscale && wall.xlong))
		{	
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, (16 * wall.image_xscale) + wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);

			vertex_add_point(Camera.buffer_test, (16 * wall.image_xscale) + wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, (16 * wall.image_xscale) + wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
		}
		else
		{
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, (16 * wall.image_yscale) + wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
		
			vertex_add_point(Camera.buffer_test, wall.x, (16 * wall.image_yscale) + wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, (16 * wall.image_yscale) + wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
		}
	}
}

// Create all facades
for(var i = 0; i < instance_number(Facade); i++)
{
	var wall = instance_find(Facade, i);
	//if(!point_direction(Player.x, Player.y, wall.x + wall.image_xscale/2, wall.y) > Player.look_dir + 90 && !point_direction(Player.x, Player.y, wall.x + wall.image_xscale/2, wall.y) < Player.look_dir + 270 )
	{
		if (wall.image_xscale > wall.image_yscale || (wall.image_xscale == wall.image_yscale && wall.xlong))
		{	
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, (16 * wall.image_xscale) + wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);

			vertex_add_point(Camera.buffer_test, (16 * wall.image_xscale) + wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, (16 * wall.image_xscale) + wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
		}
		else
		{
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, (16 * wall.image_yscale) + wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
		
			vertex_add_point(Camera.buffer_test, wall.x, (16 * wall.image_yscale) + wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, wall.y, wall.hgt, 0, 0, 1, 0, 0, wall.clr, 1);
			vertex_add_point(Camera.buffer_test, wall.x, (16 * wall.image_yscale) + wall.y, wall.z, 0, 0, 1, 0, 0, wall.clr, 1);
		}
	}
}

// Create all roofs
for(var i = 0; i < instance_number(Roof); i++)
{
	var roof = instance_find(Roof, i);
	
	vertex_add_point(Camera.buffer_test, roof.x, roof.y, roof.z, 0, 0, 1, 0, 0, roof.clr, 1);
	vertex_add_point(Camera.buffer_test, roof.x, roof.y + (16* roof.image_yscale), roof.z, 0, 0, 1, 0, 0, roof.clr, 1);
	vertex_add_point(Camera.buffer_test, roof.x + (16 * roof.image_xscale), roof.y, roof.z, 0, 0, 1, 0, 0, roof.clr, 1);
	
	vertex_add_point(Camera.buffer_test, roof.x, roof.y + (16* roof.image_yscale), roof.z, 0, 0, 1, 0, 0, roof.clr, 1);
	vertex_add_point(Camera.buffer_test, roof.x + (16 * roof.image_xscale), roof.y, roof.z, 0, 0, 1, 0, 0, roof.clr, 1);
	vertex_add_point(Camera.buffer_test, roof.x + (16 * roof.image_xscale), roof.y + (16* roof.image_yscale), roof.z, 0, 0, 1, 0, 0, roof.clr, 1);
}

vertex_end(Camera.buffer_test);

// Finish off with drawing the floor
vertex_begin(Camera.vbuffer, Camera.vertex_format);
draw_everything(Camera.vbuffer, Camera.vertex_format);