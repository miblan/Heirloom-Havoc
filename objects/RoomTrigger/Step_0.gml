if(collision_point(Player.x, Player.y, self, 0, 0))
{
	GameController.nextRoomLocation_x = Player.x;
	GameController.nextRoomLocation_y = Player.y;
	GameController.nextRoomLocation_angle = Player.image_angle;
	GameController.player_location_look_dir = Player.look_dir;
	GameController.player_location_look_pitch = Player.look_pitch;
	if(activated)
	{ room_goto(nextroom); }
}
else
{
	activated = true;
}