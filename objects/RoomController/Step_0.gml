if (!instance_exists(GameController))
{
	//Player.x = player_location_x;
	//Player.y = player_location_y;
	//Player.image_angle = player_location_angle;
	instance_create_layer(x, y, 0, GameController);
}
else
{
	Player.x = GameController.nextRoomLocation_x;
	Player.y = GameController.nextRoomLocation_y;
	Player.image_angle = GameController.nextRoomLocation_angle;
	Player.look_dir = GameController.player_location_look_dir;
	Player.look_pitch = GameController.player_location_look_pitch;
}
instance_destroy(self);