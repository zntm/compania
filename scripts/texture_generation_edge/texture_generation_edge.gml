function texture_generation_edge(_x, _y, _type)
{
    surface_set_target(id[$ $"surface_edge_{_type}"]);
    
    var _noise = floor(noise(_x, _y, edge_colour_length - 1, edge_octaves, edge_seed));
     
    draw_point_colour(_x, _y, edge_colour[$ string(_noise)]);
    
    surface_reset_target();
    
    if (random(1) < edge_indent_chance) && (id[$ $"surface_edge_indent_{_type}"]) || (id[$ $"surface_edge_indent_count_{_type}"] >= edge_indent_chance_step)
    {
        id[$ $"surface_edge_indent_count_{_type}"] = 0;
        id[$ $"surface_edge_indent_{_type}"] = !id[$ $"surface_edge_indent_{_type}"];
        
        exit;
    }
    
    ++id[$ $"surface_edge_indent_count_{_type}"];
}