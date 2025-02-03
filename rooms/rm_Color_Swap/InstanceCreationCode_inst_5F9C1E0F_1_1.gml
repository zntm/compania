text = "Export";

on_press = function()
{
    if (!file_exists("color_swap/import/colour.png"))
    {
        debug_log("[Color Swap] colour.png does not exist!");
        
        exit;
    }
    
    var _files = file_read_directory("color_swap/import/sprite");
    var _length = array_length(_files);
    
    if (_length <= 0)
    {
        debug_log("[Color Swap] There are no existing sprites in import folder!");
        
        exit;
    }
    
    var _unix = datetime_to_unix();
    
    var _colour_replace_amount  = global.colour_replace_amount;
    var _colour_replace_match   = global.colour_replace_match;
    var _colour_replace_replace = global.colour_replace_replace;
    
    var _colour_length = array_length(obj_Control_Color_Swap.colour);
    var _sprite_length = array_length(obj_Control_Color_Swap.sprite);
    
    for (var i = 0; i < _sprite_length; ++i)
    {
        var _sprite = obj_Control_Color_Swap.sprite[i];
        
        var _width  = sprite_get_width(_sprite);
        var _height = sprite_get_height(_sprite);
        var _number = sprite_get_number(_sprite);
        
        var _surface = surface_create(_width * _number, _height);
        
        shader_set(shd_Colour_Replace);
        
        shader_set_uniform_i(_colour_replace_amount, array_length(obj_Control_Color_Swap.colour[0]));
        shader_set_uniform_i_array(_colour_replace_match, obj_Control_Color_Swap.colour[0]);
        
        for (var j = 1; j < _colour_length; ++j)
        {
            shader_set_uniform_i_array(_colour_replace_replace, obj_Control_Color_Swap.colour[j]);
            
            surface_set_target(_surface);
            
            for (var l = 0; l < _number; ++l)
            {
                draw_sprite(_sprite, l, l * _width, 0);
            }
            
            surface_reset_target();
            
            if (obj_Control_Color_Swap.strip_length == 1)
            {
                surface_save(_surface, $"color_swap/export/{_unix}/{j - 1}/{i}.png");
            }
            else
            {
                surface_save(_surface, $"color_swap/export/{_unix}/{j - 1}/{i}_strip{obj_Control_Color_Swap.strip_length}.png");
            }
        }
        
        shader_reset();
        
        surface_free(_surface);
    }
    
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/color_swap/export/{_unix}");
}