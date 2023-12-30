/// @description Draw the 3D world
// Fog
draw_clear(c_black);
shader_set(shader_fog);
var uniform_fog_start = shader_get_uniform(shader_fog, "fogStart");
var uniform_fog_end = shader_get_uniform(shader_fog, "fogEnd");
shader_set_uniform_f(uniform_fog_start, lightrange);
shader_set_uniform_f(uniform_fog_end, irandom_range(0,1) * abs(sin(current_time/1000)) + (255 + lightrange));

// 3D projections require a view and projection matrix
var camera = camera_get_active();

var xfrom = x//Player.x;
var yfrom = y//Player.y;
var zfrom = z;
var xto = Player.x;//xfrom + dcos(Player.look_dir);
var yto = Player.y;//yfrom - dsin(Player.look_dir);
var zto = z/2;//zfrom - dsin(Player.look_pitch);

view_mat = matrix_build_lookat(xfrom, yfrom, zfrom, xto, yto, zto, 0, 0, 1);
proj_mat = matrix_build_projection_perspective_fov(-60, -window_get_width() / window_get_height(), 1, 32000);
camera_set_view_mat(camera, view_mat);
camera_set_proj_mat(camera, proj_mat);
camera_apply(camera);

// Everything must be drawn after the 3D projection has been set
/*
gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(xfrom, yfrom, zfrom, 0, 0, 0, 1, 1, 1));
vertex_submit(skybox, pr_trianglelist, sprite_get_texture(spr_skybox, 0));
matrix_set(matrix_world, matrix_build_identity());
gpu_set_zwriteenable(true);
*/

/*
shader_set(shader_ps1fog);
shader_set_uniform_f(shader_get_uniform(shader_ps1fog, "lightDirection"), 1, .2, -1);
*/



vertex_end(vbuffer);
//vertex_submit(vbuffer, pr_trianglelist, sprite_get_texture(spr_grass, 0));
vertex_submit(buffer_test, pr_trianglelist, -1);

// Create all models
for(var i = 0; i < instance_number(WorldModel); i++)
{
	var model = instance_find(WorldModel, i);
	if(point_distance(model.x, model.y, Player.x, Player.y) <= 300)
	{
		matrix_set(matrix_world, matrix_build(model.x, model.y, model.z, model.xrot, model.yrot, model.zrot, model.xscale, model.yscale, model.zscale));
		if (model.texture != -1)
		{ vertex_submit(model.object, pr_trianglelist, sprite_get_texture(model.texture, 0)); }
		else
		{ /*vertex_submit(model.object, pr_trianglelist, model.texture);*/ }
		matrix_set(matrix_world, matrix_build_identity());
	}
}

// Draw the player models
for(var i = 0; i < instance_number(PlayerModel); i++)
{
	var model = instance_find(PlayerModel, i);
	
	matrix_set(matrix_world, matrix_build(model.x, model.y, model.z, model.xrot, model.yrot, model.zrot, model.xscale, model.yscale, model.zscale));
	if (model.texture != -1)
	{ vertex_submit(model.object, pr_trianglelist, sprite_get_texture(model.texture, 0)); }
	else
	{ /*vertex_submit(model.object, pr_trianglelist, model.texture);*/ }
	matrix_set(matrix_world, matrix_build_identity());
}

// Create all doors
//for(var i = 0; i < instance_number(Interactible_Door); i++)
//{
//	var model = instance_find(Interactible_Door, i);
//	if(point_distance(model.x, model.y, Player.x, Player.y) <= 300)
//	{
//		matrix_set(matrix_world, matrix_build(model.x, model.y, model.z, model.xrot, model.yrot, model.zrot, model.xscale, model.yscale, model.zscale));
//		vertex_submit(model.object, pr_trianglelist, sprite_get_texture(model.texture, 0));
//		matrix_set(matrix_world, matrix_build_identity());
//	}
//}

// Draw all hitboxes
if (keyboard_check(vk_tab))
{
	with(BaseObject)
	{ drawline = true; }
	
	for(var i = 0; i < instance_number(Barrier); i++)
	{
		var model = instance_find(Barrier, i);
		matrix_set(matrix_world, matrix_build(model.x, model.y, model.z, model.xrot, model.yrot, model.image_angle, model.xscale, model.yscale, model.zscale));
		vertex_submit(model.object, pr_trianglelist, -1);
		matrix_set(matrix_world, matrix_build_identity());
	}
	
	var interact_box = instance_find(Barrier, i);
	matrix_set(matrix_world, matrix_build(Player.interactpoint[0], Player.interactpoint[1], Player.interactpoint[2], 0, 0, Player.look_dir, .01, .01, .01));
	vertex_submit(load_model("models/skybox.gmmod"), pr_trianglelist, -1);
	matrix_set(matrix_world, matrix_build_identity());
}
else
{
	with(BaseObject)
	{ drawline = false; }
}

shader_reset();

with(BaseObject)
{
	if(point_distance(x, y, Player.x, Player.y) <= 300)
	{ event_perform(ev_draw, 0); }
}