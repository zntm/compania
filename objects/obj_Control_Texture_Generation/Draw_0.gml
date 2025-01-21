if (base_colour_length != base_colour_length_new) || (edge_colour_length != edge_colour_length_new)
{
    base_colour_length_new = base_colour_length;
    edge_colour_length_new = edge_colour_length;
    
    texture_generation_init_colour("base");
    texture_generation_init_colour("edge");
}

#region Base

if (!surface_exists(surface_base))
{
    surface_base = surface_create(16, 16);
}

surface_set_target(surface_base);

random_set_seed(base_seed);

for (var i = 0; i < TEXTURE_GENERATION_SIZE; ++i)
{
    for (var j = 0; j < TEXTURE_GENERATION_SIZE; ++j)
    {
        var _x = base_stretch_x * i;
        var _y = base_stretch_y * j;
        
        var _fade = min(1, _x / 4, _y / 4, (((TEXTURE_GENERATION_SIZE - 1) * base_stretch_x) - _x) / 4, (((TEXTURE_GENERATION_SIZE - 1) * base_stretch_y) - _y) / 4);
        
        var _noise = noise(i, j, base_colour_length - 1, base_octaves, base_seed);
        
        if (base_falloff > 0)
        {
            _noise *= lerp(1, min(1, i / base_falloff, j / base_falloff, ((TEXTURE_GENERATION_SIZE - 1) - i) / base_falloff, ((TEXTURE_GENERATION_SIZE - 1) - j) / base_falloff), base_falloff_alpha);
        }
        
        _noise += random_range(-base_noise_offset_min, base_noise_offset_max);
        
        var _colour = base_colour[$ string(clamp(round(_noise), 0, base_colour_length - 1))];
        
        draw_point_colour(i, j, _colour);
    }
}

surface_reset_target();

#endregion

#region Edge

texture_generation_edge_init("l");
texture_generation_edge_init("t");
texture_generation_edge_init("r");
texture_generation_edge_init("b");

for (var i = 0; i < TEXTURE_GENERATION_SIZE; ++i)
{
    if (i <= edge_indent_corner_padding) || (i >= (TEXTURE_GENERATION_SIZE - 1) - edge_indent_corner_padding)
    {
        surface_edge_indent_l = 0;
        surface_edge_indent_t = 0;
        surface_edge_indent_r = 0;
        surface_edge_indent_b = 0;
    }
    
    random_set_seed(edge_seed + i);
    
    texture_generation_edge(surface_edge_indent_l, i, "l");
    texture_generation_edge(i, surface_edge_indent_t, "t");
    
    texture_generation_edge((TEXTURE_GENERATION_SIZE - 1) - surface_edge_indent_r, i, "r");
    texture_generation_edge(i, (TEXTURE_GENERATION_SIZE - 1) - surface_edge_indent_b, "b");
}

#endregion

for (var i = 0; i < 3; ++i)
{
    for (var j = 0; j < 3; ++j)
    {
        draw_surface(surface_base, 128 + (i * 16), 128 + (j * 16));
        
        draw_surface(surface_edge_l, 128 + (i * 16), 128 + (j * 16));
        draw_surface(surface_edge_t, 128 + (i * 16), 128 + (j * 16));
        draw_surface(surface_edge_r, 128 + (i * 16), 128 + (j * 16));
        draw_surface(surface_edge_b, 128 + (i * 16), 128 + (j * 16));
    }
}