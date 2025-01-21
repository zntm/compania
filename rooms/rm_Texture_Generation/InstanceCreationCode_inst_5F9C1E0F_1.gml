text = "Export";

on_press = function()
{
    var _texture_generation_bit = global.texture_generation_bit;
    
    var _surface = surface_create(17 * TEXTURE_GENERATION_SIZE, TEXTURE_GENERATION_SIZE);
    
    var _surface_base = obj_Control_Texture_Generation.surface_base;
    
    var _surface_edge_l = obj_Control_Texture_Generation.surface_edge_l;
    var _surface_edge_t = obj_Control_Texture_Generation.surface_edge_t;
    var _surface_edge_r = obj_Control_Texture_Generation.surface_edge_r;
    var _surface_edge_b = obj_Control_Texture_Generation.surface_edge_b;
    
    surface_set_target(_surface);
    draw_clear_alpha(c_black, 0);
    
    for (var i = 0; i < 17; ++i)
    {
        show_debug_message($"{i} {array_length(_texture_generation_bit)}")
        var _offset = i * TEXTURE_GENERATION_SIZE;
        
        var _ = _texture_generation_bit[i];
        
        draw_surface(_surface_base, _offset, 0);
        
        if (_ & 0b1000)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_line(_offset, 0, _offset, (TEXTURE_GENERATION_SIZE - 1));
            gpu_set_blendmode(bm_normal);
            
            draw_surface(_surface_edge_l, _offset, 0);
        }
        
        if (_ & 0b0100)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_line(_offset, 0, _offset + (TEXTURE_GENERATION_SIZE - 1), 0);
            gpu_set_blendmode(bm_normal);
            
            draw_surface(_surface_edge_t, _offset, 0);
        }
        
        if (_ & 0b0010)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_line(_offset + (TEXTURE_GENERATION_SIZE - 1), 0, _offset + (TEXTURE_GENERATION_SIZE - 1), (TEXTURE_GENERATION_SIZE - 1));
            gpu_set_blendmode(bm_normal);
            
            draw_surface(_surface_edge_r, _offset, 0);
        }
        
        if (_ & 0b0001)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_line(_offset, (TEXTURE_GENERATION_SIZE - 1), _offset + (TEXTURE_GENERATION_SIZE - 1), (TEXTURE_GENERATION_SIZE - 1));
            gpu_set_blendmode(bm_normal);
            
            draw_surface(_surface_edge_b, _offset, 0);
        }
        
        if ((_ & 0b1100) == 0b1100)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_point(_offset, 0);
            gpu_set_blendmode(bm_normal);
        }
        
        if ((_ & 0b0110) == 0b0110)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_point(_offset + (TEXTURE_GENERATION_SIZE - 1), 0);
            gpu_set_blendmode(bm_normal);
        }
        
        if ((_ & 0b0011) == 0b0011)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_point(_offset + (TEXTURE_GENERATION_SIZE - 1), (TEXTURE_GENERATION_SIZE - 1));
            gpu_set_blendmode(bm_normal);
        }
        
        if ((_ & 0b1001) == 0b1001)
        {
            gpu_set_blendmode(bm_eq_subtract);
            draw_point(_offset, (TEXTURE_GENERATION_SIZE - 1));
            gpu_set_blendmode(bm_normal);
        }
    }
    
    surface_reset_target();
    
    var _unix = datetime_to_unix();
    
    surface_save(_surface, $"texture_generation/{_unix}.png");
    
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/texture_generation/{_unix}.png");
    
    surface_free(_surface);
}