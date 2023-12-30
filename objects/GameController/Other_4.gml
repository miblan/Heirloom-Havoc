if(backpack[1] != -1)
{
	if(room == backpack[0])
	{
		bp = instance_create_depth(backpack[1], backpack[2], 0, BackPack);
		bp.image_xscale = 3;
		bp.image_yscale = 3;
		backpack[1] = -1;
		backpack[2] = -1;
	}
}