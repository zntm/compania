if (dbg_section_exists(section_preview))
{
    dbg_section_delete(section_preview);
}

if (dbg_section_exists(section_base))
{
    dbg_section_delete(section_base);
}

if (dbg_section_exists(section_edge))
{
    dbg_section_delete(section_edge);
}

if (dbg_section_exists(section_colour_base))
{
    dbg_section_delete(section_colour_base);
}

if (dbg_section_exists(section_colour_edge))
{
    dbg_section_delete(section_colour_edge);
}

if (surface_exists(surface_base))
{
    surface_free(surface_base);
}

if (surface_exists(surface_edge_l))
{
    surface_free(surface_edge_l);
}

if (surface_exists(surface_edge_t))
{
    surface_free(surface_edge_t);
}

if (surface_exists(surface_edge_r))
{
    surface_free(surface_edge_r);
}

if (surface_exists(surface_edge_b))
{
    surface_free(surface_edge_b);
}