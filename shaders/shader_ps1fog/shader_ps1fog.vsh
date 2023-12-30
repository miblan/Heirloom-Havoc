attribute vec3 in_Position;
attribute vec3 in_Normal;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 v_worldPosition;
varying vec3 v_worldNormal;

void main()
{
    // PS1-style graphics
    vec4 object_space_pos = vec4(in_Position, 1.0);
    v_worldPosition = (gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos).xyz;
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;

    // Fog and darkness
    vec4 eye_space = gm_Matrices[MATRIX_WORLD_VIEW] * object_space_pos;
    float snap_amount = 1.0;
    eye_space.xyz = floor(eye_space.xyz / snap_amount) * snap_amount;
    
    gl_Position = gm_Matrices[MATRIX_PROJECTION] * eye_space;

    // Additional features from the second shader
    v_worldNormal = normalize(gm_Matrices[MATRIX_WORLD] * vec4(in_Normal, 0.)).xyz;
}
