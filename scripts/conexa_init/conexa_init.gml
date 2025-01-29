function conexa_init()
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
}