if(kind = modelkind.obj)
{
	//merry = load_obj("merry.obj", "merry.mtl");
	var object_data = buffer_load(modelname);
	object = vertex_create_buffer_from_buffer(object_data, Camera.vertex_format);
	buffer_delete(object_data);
}
else
{ object = load_model(modelname); }

zrot = image_angle;

if(issolid)
{
	if(hitbox == -1)
	{
		hitbox = instance_create_depth(x, y, depth, Barrier);
		hitbox.passunder = passunder;
		hitbox.xrot = xrot;
		hitbox.yrot = yrot;
		hitbox.image_angle = image_angle;
		
		hitbox.xscale = hitboxsize_x * xscale;
		hitbox.yscale = hitboxsize_y * yscale;
	}
}