if(passunder)
{ object = load_model("models/hitbox_pass.gmmod"); }
else
{ object = load_model("models/hitbox.gmmod"); }

if(passunder && Player.playerstate = state.Prone)
{ solid = false; }
else
{ solid = true; }

zrot = image_angle;
image_xscale = xscale;
image_yscale = yscale;

if(Player.playerstate != state.Prone)
{ instance_change(Barrier, 0); }