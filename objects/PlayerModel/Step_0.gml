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

// TEMP TEST
x = Player.x;
y = Player.y;
z = Player.z;

//if(lookat && distance_to_object(Camera) > 35 && distance_to_object(Camera) > 10 )
//{ image_angle = point_direction(x,y,Camera.x,Camera.y); }
//else
//{ image_angle = Player.look_dir; }

// Define the view cone angles in degrees
var viewConeStart = -45;
var viewConeEnd = 45;

// Calculate the angle between the object and the camera
var angleToCamera = point_direction(x, y, Camera.x, Camera.y);

// Calculate the angle difference within the view cone
var angleDifference = angle_difference(angleToCamera, Player.look_dir);

// Normalize the angle difference to be within -180 to 180 degrees
while (angleDifference > 180) angleDifference -= 360;
while (angleDifference < -180) angleDifference += 360;

// Check if the camera is within the specified view cone and the object is 35 pixels away
if (lookat && distance_to_object(Camera) > 35 && angleDifference >= viewConeStart && angleDifference <= viewConeEnd)
{
    // Interpolate the image_angle smoothly
    var targetAngle = angleToCamera;

    // Adjust the smoothing factor as needed
    var smoothingFactor = .1;

    // Smoothly interpolate the image_angle using lerp
    image_angle = lerp(image_angle, point_direction(x,y,Camera.x,Camera.y),smoothingFactor);
}
else
{
	image_angle = Player.look_dir;
}
