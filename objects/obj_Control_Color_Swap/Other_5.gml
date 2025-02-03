array_foreach(sprite, sprite_delete);

if (dbg_view_exists(debug_view))
{
    dbg_view_delete(debug_view);
}

if (dbg_section_exists(section_preview))
{
    dbg_section_delete(section_preview);
}