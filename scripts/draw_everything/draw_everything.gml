function draw_everything(vbuffer, vertex_format){
	var s = 128;
	for (var i = -(s * 2); i < room_width + (s * 2); i += s)
	{
	    for (var j = -(s * 2); j < room_height + (s * 2); j += s)
		{
			color = c_white;

	        vertex_add_point(vbuffer, i, j, 0,                0, 0, 1,        0, 0,       color, 1);
	        vertex_add_point(vbuffer, i + s, j, 0,            0, 0, 1,        1, 0,       color, 1);
	        vertex_add_point(vbuffer, i + s, j + s, 0,        0, 0, 1,        1, 1,       color, 1);

	        vertex_add_point(vbuffer, i + s, j + s, 0,        0, 0, 1,        1, 1,       color, 1);
	        vertex_add_point(vbuffer, i, j + s, 0,            0, 0, 1,        0, 1,       color, 1);
	        vertex_add_point(vbuffer, i, j, 0,                0, 0, 1,        0, 0,       color, 1);
	    }
	}
}