function lengthdir_z(distance, pitch){
	var rad = degtorad(pitch);
	return distance * sin(rad);
}