if (dbg_view_exists(debug_view))
{
    dbg_view_delete(debug_view);
}

if (dbg_section_exists(section_preview))
{
    dbg_section_delete(section_preview);
}

if (sprite_exists(sprite_base))
{
    sprite_delete(sprite_base);
}

if (sprite_exists(sprite_edge))
{
    sprite_delete(sprite_edge);
}