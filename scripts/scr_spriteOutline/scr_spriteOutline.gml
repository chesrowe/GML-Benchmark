///Scripts dealing with the outline shader


/// @func sprite_outline_init()
/// @desc Sets up all the vars needed for the sprite outlines

function sprite_outline_init(){
	outlineSurface = -1;		
	outlineSurfaceUpdate = true;
	
	outlineTextureSizeUniform = shader_get_uniform(shd_outline, "texture_Pixel");
	outlineColorUniform = shader_get_uniform(shd_outline, "outlineColor")
}

function sprite_outline_cleanup(){
	if (surface_exists(outlineSurface)){
		surface_free(outlineSurface);	
	}
}

/// @func sprite_outline_draw(color)
/// @desc Draws an outline of an instance's sprite(based on their sprite_index)
/// @param color {color} the color of the outline to be drawn

function sprite_outline_draw(color){
	var colorRed = norm(0, 255, color_get_red(color));
	var colorGreen = norm(0, 255, color_get_green(color));
	var colorBlue = norm(0, 255, color_get_blue(color));
	
	var spriteWidth = sprite_get_width(sprite_index);
	var spriteHeight = sprite_get_height(sprite_index);
	
	if (outlineSurfaceUpdate){
		if (!surface_exists(outlineSurface)){
			outlineSurface = surface_create(spriteWidth * 2, spriteHeight * 2);	
			surface_set_target(outlineSurface);
			draw_clear_alpha(c_black, 0);
			draw_sprite(spr_testSprite, image_index, spriteWidth, ~~(spriteHeight * 1.5));
			surface_reset_target();
		}else{
			surface_set_target(outlineSurface);
			draw_clear_alpha(c_black, 0);
			draw_sprite(spr_testSprite, image_index, spriteWidth, ~~(spriteHeight * 1.5));
			surface_reset_target();	
		}
	}

	if (surface_exists(outlineSurface)){
		shader_set(shd_outline);
		// grab stuff, pointers
		var texture = surface_get_texture(outlineSurface);
		var texture_Width  = texture_get_texel_width(texture);
		var texture_Height = texture_get_texel_height(texture);

		// put stuff in 
		shader_set_uniform_f(outlineTextureSizeUniform, texture_Width, texture_Height);
		shader_set_uniform_f(outlineColorUniform, colorRed, colorGreen, colorBlue, 1);
	
		draw_surface(outlineSurface, x - spriteWidth, y - round(spriteHeight * 1.5));	
		shader_reset();
	}
}
