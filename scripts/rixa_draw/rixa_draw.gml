function rixa_draw(_index, _x, _y, _xscale = 1, _yscale = 1)
{
    var _ = global.rixa_bit[_index];
    
    static __surface = -1;
    
    if (!surface_exists(__surface))
    {
        __surface = surface_create(RIXA_SIZE, RIXA_SIZE);
    }
    
    surface_set_target(__surface);
    draw_clear_alpha(c_black, 0);
    
    draw_surface(obj_Control_Rixa.surface_base, 0, 0);
    
    if (_ & 0b1000)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_line(0, 0, 0, (RIXA_SIZE - 1));
        
        gpu_set_blendmode(bm_normal);
        
        draw_surface(obj_Control_Rixa.surface_edge_l, 0, 0);
    }
    
    if (_ & 0b0100)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_line(0, 0, 0 + (RIXA_SIZE - 1), 0);
        
        gpu_set_blendmode(bm_normal);
        
        draw_surface(obj_Control_Rixa.surface_edge_t, 0, 0);
    }
    
    if (_ & 0b0010)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_line(0 + (RIXA_SIZE - 1), 0, 0 + (RIXA_SIZE - 1), (RIXA_SIZE - 1));
        
        gpu_set_blendmode(bm_normal);
        
        draw_surface(obj_Control_Rixa.surface_edge_r, 0, 0);
    }
    
    if (_ & 0b0001)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_line(0, (RIXA_SIZE - 1), 0 + (RIXA_SIZE - 1), (RIXA_SIZE - 1));
        
        gpu_set_blendmode(bm_normal);
        
        draw_surface(obj_Control_Rixa.surface_edge_b, 0, 0);
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
        
        draw_point(0 + (RIXA_SIZE - 1), 0);
        
        gpu_set_blendmode(bm_normal);
    }
    
    if ((_ & 0b0011) == 0b0011)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_point(0 + (RIXA_SIZE - 1), (RIXA_SIZE - 1));
        
        gpu_set_blendmode(bm_normal);
    }
    
    if ((_ & 0b1001) == 0b1001)
    {
        gpu_set_blendmode(bm_eq_subtract);
        
        draw_point(0, (RIXA_SIZE - 1));
        
        gpu_set_blendmode(bm_normal);
    }
    
    surface_reset_target();
    
    draw_surface_ext(__surface, _x, _y, _xscale, _yscale, 0, c_white, 1);
}