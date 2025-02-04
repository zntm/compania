function rixa_init()
{
    if (dbg_view_exists(debug_view))
    {
        dbg_view_delete(debug_view);
    }
    
    debug_view = dbg_view("Texture Generation", true);
    
    if (dbg_section_exists(section_preview))
    {
        dbg_section_delete(section_preview);
    }
    
    section_preview = dbg_section("Preview");
    
    dbg_slider_int(ref_create(id, "preview_width"),  3, 15, "Width");
    dbg_slider_int(ref_create(id, "preview_height"), 3, 15, "Height");
    
    dbg_checkbox(ref_create(id, "preview_flip_x"), "Flip X");
    dbg_checkbox(ref_create(id, "preview_flip_y"), "Flip Y");
    
    dbg_colour(ref_create(id, "preview_colour_tl"), "Colour (Top Left)");
    dbg_colour(ref_create(id, "preview_colour_tr"), "Colour (Top Right)");
    dbg_colour(ref_create(id, "preview_colour_bl"), "Colour (Bottom Left)");
    dbg_colour(ref_create(id, "preview_colour_br"), "Colour (Bottom Right)");
    
    if (dbg_section_exists(section_base))
    {
        dbg_section_delete(section_base);
    }
    
    section_base = dbg_section("Base");
    
    #region Base
    
    dbg_slider_int(ref_create(id, "base_colour_length"), 1, 32, "Length");
    
    dbg_slider_int(ref_create(id, "base_seed"), 0, (1 << 24) - 1, "Seed");
    
    dbg_slider(ref_create(id, "base_octaves"), 0.25, 64, "Octaves");
    
    dbg_slider(ref_create(id, "base_noise_offset_min"), 0, 1, "Noise Offset Min");
    dbg_slider(ref_create(id, "base_noise_offset_max"), 0, 1, "Noise Offset Max");
    
    dbg_slider(ref_create(id, "base_stretch_x"), 0, 1, "Stretch X");
    dbg_slider(ref_create(id, "base_stretch_y"), 0, 1, "Stretch Y");
    
    dbg_slider(ref_create(id, "base_falloff"), 0, 8, "Falloff");
    dbg_slider(ref_create(id, "base_falloff_alpha"), 0, 1, "Falloff Alpha");
    
    dbg_colour(ref_create(id, "base_gradient_start"), "Gradient Start");
    dbg_colour(ref_create(id, "base_gradient_end"), "Gradient End");
    
    dbg_button("Set Gradient", function()
    {
        rixa_gradient_set("base_colour", base_gradient_start, base_gradient_end);
    });
    
    dbg_same_line();
    dbg_button("Randomize Gradient", function()
    {
        randomize();
        
        base_gradient_start = irandom(255 * 255 * 255);
        base_gradient_end   = irandom(255 * 255 * 255);
    });
    
    dbg_same_line();
    dbg_button("Get Gradient", function()
    {
        base_gradient_start = base_colour[$ "0"];
        base_gradient_end   = base_colour[$ $"{base_colour_length - 1}"];
    });
    
    #endregion
    
    if (dbg_section_exists(section_edge))
    {
        dbg_section_delete(section_edge);
    }
    
    section_edge = dbg_section("Edge");
    
    #region Edge
    
    dbg_slider_int(ref_create(id, "edge_colour_length"), 1, 32, "Length");
    
    dbg_slider_int(ref_create(id, "edge_seed"), 0, (1 << 24) - 1, "Seed");
    
    dbg_slider(ref_create(id, "edge_octaves"), 0.25, 64, "Octaves");
    
    dbg_slider(ref_create(id, "edge_indent_chance"), 0, 1, "Indent Chance");
    dbg_slider_int(ref_create(id, "edge_indent_chance_step"), 0, 8, "Indent Chance Step");
    
    dbg_slider_int(ref_create(id, "edge_indent_corner_padding"), 0, 8, "Indent Corner Padding");
    
    dbg_colour(ref_create(id, "edge_gradient_start"), "Gradient Start");
    dbg_colour(ref_create(id, "edge_gradient_end"), "Gradient End");
    
    dbg_button("Set Gradient", function()
    {
        rixa_gradient_set("edge_colour", edge_gradient_start, edge_gradient_end);
    });
    
    dbg_same_line();
    dbg_button("Randomize Gradient", function()
    {
        randomize();
        
        edge_gradient_start = irandom(255 * 255 * 255);
        edge_gradient_end   = irandom(255 * 255 * 255);
    });
    
    dbg_same_line();
    dbg_button("Get Gradient", function()
    {
        edge_gradient_start = edge_colour[$ "0"];
        edge_gradient_end   = edge_colour[$ $"{edge_colour_length - 1}"];
    });
    
    #endregion
    
    rixa_init_colour("base");
    rixa_init_colour("edge");
}