function rixa_edge_init(_type)
{
    if (!surface_exists(id[$ $"surface_edge_{_type}"]))
    {
        id[$ $"surface_edge_{_type}"] = surface_create(16, 16);
    }
    
    surface_set_target(id[$ $"surface_edge_{_type}"]);
    
    draw_clear_alpha(c_black, 0);
    
    surface_reset_target();
}