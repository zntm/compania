function conexa_draw(_index, _x, _y, _xscale = 1, _yscale = 1)
{
    var _sprite_base = obj_Control_Conexa.sprite_base;
    var _sprite_edge = obj_Control_Conexa.sprite_edge;
    
    var _temp = 3;
    
    var _ = global.rixa_bit[_index];
    
    static __surface = -1;
    
    if (!surface_exists(__surface))
    {
        __surface = surface_create(RIXA_SIZE, RIXA_SIZE);
    }
    
    surface_set_target(__surface);
    draw_clear_alpha(c_black, 0);
    
    draw_sprite(_sprite_base, 0, 0, 0);
    
    if (_ & 0b1000)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        for (var j = 0; j < _temp; ++j)
        {
            var _cut = max(0, j - 1);
            
            draw_line(_cut, j, _cut, RIXA_SIZE - j);
        }
        
        gpu_set_blendmode(bm_normal);
        
        for (var j = 0; j < _temp; ++j)
        {
            draw_sprite_part(_sprite_edge, 0, j, j, 1, RIXA_SIZE - (j * 2), j, j);
        }
    }
    
    if (_ & 0b0100)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        for (var j = 0; j < _temp; ++j)
        {
            var _cut = max(0, j - 1);
            
            draw_line(j, _cut, RIXA_SIZE - j, _cut);
        }
        
        gpu_set_blendmode(bm_normal);
        
        for (var j = 0; j < _temp; ++j)
        {
            draw_sprite_part(_sprite_edge, 0, j, j, RIXA_SIZE - (j * 2), 1, j, j);
        }
    }
    
    if (_ & 0b0010)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        for (var j = 0; j < _temp; ++j)
        {
            var _cut = max(0, j - 1);
            
            draw_line(RIXA_SIZE - _cut - 1, j, RIXA_SIZE - _cut - 1, RIXA_SIZE - j);
        }
        
        gpu_set_blendmode(bm_normal);
        
        for (var j = 0; j < _temp; ++j)
        {
            draw_sprite_part(_sprite_edge, 0, RIXA_SIZE - j - 1, j, 1, RIXA_SIZE - (j * 2), RIXA_SIZE - j - 1, j);
        }
    }
    
    if (_ & 0b0001)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        for (var j = 0; j < _temp; ++j)
        {
            var _cut = max(0, j - 1);
            
            draw_line(j, RIXA_SIZE - _cut - 1, RIXA_SIZE - j, RIXA_SIZE - _cut - 1);
        }
        
        gpu_set_blendmode(bm_normal);
        
        for (var j = 0; j < _temp; ++j)
        {
            draw_sprite_part(_sprite_edge, 0, j, RIXA_SIZE - j - 1, RIXA_SIZE - (j * 2), 1, j, RIXA_SIZE - j - 1);
        }
    }
    
    if ((_ & 0b1100) == 0b1100)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_point(0, 0);
        
        gpu_set_blendmode(bm_normal);
    }
    
    if ((_ & 0b0110) == 0b0110)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_point(RIXA_SIZE - 1, 0);
        
        gpu_set_blendmode(bm_normal);
    }
    
    if ((_ & 0b0011) == 0b0011)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_point(RIXA_SIZE - 1, RIXA_SIZE - 1);
        
        gpu_set_blendmode(bm_normal);
    }
    
    if ((_ & 0b1001) == 0b1001)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_point(0, RIXA_SIZE - 1);
        
        gpu_set_blendmode(bm_normal);
    }
    
    surface_reset_target();
    
    draw_surface_ext(__surface, _x, _y, _xscale, _yscale, 0, c_white, 1);
}