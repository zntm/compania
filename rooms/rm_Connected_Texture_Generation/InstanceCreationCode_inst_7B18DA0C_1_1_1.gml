text = "Refresh";

on_press = function()
{
    if (!file_exists("conexa/import/base.png"))
    {
        debug_log("[Conexa] base.png does not exist!");
        
        exit;
    }
    
    if (!file_exists("conexa/import/edge.png"))
    {
        debug_log("[Conexa] edge.png does not exist!");
        
        exit;
    }
    
    var _sprite_base = obj_Control_Conexa.sprite_base;
    var _sprite_edge = obj_Control_Conexa.sprite_edge;
    
    if (sprite_exists(_sprite_base))
    {
        sprite_delete(_sprite_base);
    }
    
    if (sprite_exists(_sprite_edge))
    {
        sprite_delete(_sprite_edge);
    }
    
    obj_Control_Conexa.sprite_base = sprite_add("conexa/import/base.png", 1, false, false, 0, 0);
    obj_Control_Conexa.sprite_edge = sprite_add("conexa/import/edge.png", 1, false, false, 0, 0);
}

call_later(1, time_source_units_frames, on_press);