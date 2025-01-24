text = "Refresh";

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
    
    #region Colour
    
    var _sprite_colour = sprite_add("color_swap/import/colour.png", 1, false, false, 0, 0);
    
    var _colour_width  = sprite_get_width(_sprite_colour);
    var _colour_height = sprite_get_height(_sprite_colour);
    
    var _surface_colour = surface_create(_colour_width, _colour_height);
    
    surface_set_target(_surface_colour);
    
    draw_sprite(_sprite_colour, 0, 0, 0);
    
    surface_reset_target();
    
    obj_Control_Color_Swap.colour = array_create(_colour_width);
    
    for (var i = 0; i < _colour_width; ++i)
    {
        obj_Control_Color_Swap.colour[@ i] = array_create(_colour_height);
        
        for (var j = 0; j < _colour_height; ++j)
        {
            obj_Control_Color_Swap.colour[@ i][@ j] = surface_getpixel(_surface_colour, i, j);
        }
    }
    
    surface_free(_surface_colour);
    
    #endregion
    
    #region Sprite
    
    array_foreach(obj_Control_Color_Swap.sprite, sprite_delete);
    
    array_resize(obj_Control_Color_Swap.sprite, _length);
    
    array_foreach(_files, function(_value, _index)
    {
        obj_Control_Color_Swap.sprite[@ _index] = sprite_add($"color_swap/import/sprite/{_value}", 1, false, false, 0, 0);
    });
    
    #endregion
}

call_later(1, time_source_units_frames, on_press);