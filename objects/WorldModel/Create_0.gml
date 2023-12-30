z = 0;

xrot = 0;
yrot = 0;
zrot = 0;

issolid = true;
passunder = false;
hitboxsize_x = 1;
hitboxsize_y = 1;

xscale = 1;
yscale = 1;
zscale = 1;

modelname = "models/merry.vbuff";
kind = modelkind.obj
object = -1;
hitbox = -1;
texture = -1;

enum modelkind {
	model,
	obj
}


if(kind = modelkind.obj)
{
	//merry = load_obj("merry.obj", "merry.mtl");
	var merry_data = buffer_load(modelname);
	object = vertex_create_buffer_from_buffer(merry_data, Camera.vertex_format);
	buffer_delete(merry_data);
}
else
{ object = load_model(modelname); }