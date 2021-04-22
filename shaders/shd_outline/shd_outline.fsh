
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texture_Pixel;
uniform vec4 outlineColor;

void main(){	
	// change here thickness of outline 1.0, 2.0 etc.
	vec2 thickness = texture_Pixel * 1.0;
	
	vec4 end_pixel =  v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if ( texture2D( gm_BaseTexture, v_vTexcoord ).a <= 0.0) { 		
		float alpha = 0.0;
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x - thickness.x , v_vTexcoord.y)).a );
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + thickness.x , v_vTexcoord.y)).a );
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y + thickness.y)).a );		
		alpha = max(alpha, texture2D( gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y - thickness.y)).a );		
		 
		if (alpha != 0.0) { 
			end_pixel = outlineColor; 
		}
	}
		
    gl_FragColor = end_pixel;
}
