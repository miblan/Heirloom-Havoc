/// @description Set up 3D things

// Bad things happen if you turn off the depth buffer in 3D
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

interact = false;
lightrange = 0;

z = 85;

recoil_x = 0;
recoil_y = 0;
accuracy = 0;

#region vertex format setup
// Vertex format: data must go into vertex buffers in the order defined by this
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();
#endregion

vbuffer = vertex_create_buffer();
buffer_test = vertex_create_buffer();

skybox = load_model("models/skybox.gmmod");

instance_create_depth(x, y, depth, Player);

view_mat = undefined;
proj_mat = undefined;

instance_create_depth(x, y, depth, WorldManager);