text = "Export";

on_press = function()
{
    var _surface = surface_create(17 * RIXA_SIZE, RIXA_SIZE);
    
    var _sprite_base = obj_Control_Conexa.sprite_base;
    var _sprite_edge = obj_Control_Conexa.sprite_edge;
    
    var _icon_exists = file_exists("conexa/import/icon.png");
    
    var _temp = 4;
    
    surface_set_target(_surface);
    
    for (var i = 0; i < 17; ++i)
    {
        var _ = global.rixa_bit[i];
        
        if (i == 0) && (_icon_exists)
        {
            var _sprite = sprite_add("conexa/import/icon.png", 1, false, false, 0, 0);
            
            draw_sprite(_sprite, 0, 0, 0);
            
            sprite_delete(_sprite);
            
            continue;
        }
        
        var _offset = RIXA_SIZE * i;
        
        draw_sprite(_sprite_base, 0, _offset, 0);
        
#macro CONEXA_CUT var _cut = max(0, j - 1)
        
        if (_ & 0b1000)
        {
            gpu_set_blendmode(bm_eq_subtract);
            
            for (var j = 0; j < _temp; ++j)
            {
                CONEXA_CUT;
                
                draw_line(_offset + _cut, j, _offset + _cut, RIXA_SIZE - j);
            }
            
            gpu_set_blendmode(bm_normal);
            
            for (var j = 0; j < _temp; ++j)
            {
                draw_sprite_part(_sprite_edge, 0, j, j, 1, RIXA_SIZE - (j * 2), _offset + j, j);
            }
        }
        
        if (_ & 0b0100)
        {
            gpu_set_blendmode(bm_eq_subtract);
            
            for (var j = 0; j < _temp; ++j)
            {
                CONEXA_CUT;
                
                draw_line(_offset + j, _cut, _offset + RIXA_SIZE - j, _cut);
            }
            
            gpu_set_blendmode(bm_normal);
            
            for (var j = 0; j < _temp; ++j)
            {
                draw_sprite_part(_sprite_edge, 0, j, j, RIXA_SIZE - (j * 2), 1, _offset + j, j);
            }
        }
        
        if (_ & 0b0010)
        {
            gpu_set_blendmode(bm_eq_subtract);
            
            for (var j = 0; j < _temp; ++j)
            {
                CONEXA_CUT;
                
                draw_line(_offset + RIXA_SIZE - _cut - 1, j, _offset + RIXA_SIZE - _cut - 1, RIXA_SIZE - j);
            }
            
            gpu_set_blendmode(bm_normal);
            
            for (var j = 0; j < _temp; ++j)
            {
                draw_sprite_part(_sprite_edge, 0, RIXA_SIZE - j - 1, j, 1, RIXA_SIZE - (j * 2), _offset + RIXA_SIZE - j - 1, j);
            }
        }
        
        if (_ & 0b0001)
        {
            gpu_set_blendmode(bm_eq_subtract);
            
            for (var j = 0; j < _temp; ++j)
            {
                CONEXA_CUT;
                
                draw_line(_offset + j, RIXA_SIZE - _cut - 1, _offset + RIXA_SIZE - j, RIXA_SIZE - _cut - 1);
            }
            
            gpu_set_blendmode(bm_normal);
            
            for (var j = 0; j < _temp; ++j)
            {
                draw_sprite_part(_sprite_edge, 0, j, RIXA_SIZE - j - 1, RIXA_SIZE - (j * 2), 1, _offset + j, RIXA_SIZE - j - 1);
            }
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
            
            draw_point(_offset + RIXA_SIZE - 1, 0);
            
            gpu_set_blendmode(bm_normal);
        }
        
        if ((_ & 0b0011) == 0b0011)
        {
            gpu_set_blendmode(bm_eq_subtract);
            
            draw_point(_offset + RIXA_SIZE - 1, RIXA_SIZE - 1);
            
            gpu_set_blendmode(bm_normal);
        }
        
        if ((_ & 0b1001) == 0b1001)
        {
            gpu_set_blendmode(bm_eq_subtract);
            
            draw_point(_offset, RIXA_SIZE - 1);
            
            gpu_set_blendmode(bm_normal);
        }
        
    }
    
    surface_reset_target();
    
    var _unix = datetime_to_unix();
    
    surface_save(_surface, $"conexa/export/{_unix}_strip17.png");
    
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/conexa/export/{_unix}_strip17.png");
    
    surface_free(_surface);
}