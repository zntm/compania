function color_swap_init()
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
    
    section_preview = dbg_section("Values");
    
    dbg_slider_int(ref_create(id, "strip_length"), 1, 32, "Strip Length");
}