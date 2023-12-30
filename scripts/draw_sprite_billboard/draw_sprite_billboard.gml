function draw_sprite_billboard(sprite, subimage, xx, yy, zz, scale, clr) {
	shader_set(shader_billboard);
	matrix_set(matrix_world, matrix_build(xx, yy, zz, 0, 0, 0, scale, scale, scale));
	draw_sprite_ext(sprite, subimage, 0, 0, scale, scale, 0, clr, 1);
	matrix_set(matrix_world, matrix_build_identity());
	shader_reset();
}