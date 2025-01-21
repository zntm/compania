function rixa_init_colour(_name)
{
    with (obj_Control_Texture_Generation)
    {
        if (dbg_section_exists(id[$ $"section_colour_{_name}"]))
        {
            dbg_section_delete(id[$ $"section_colour_{_name}"]);
        }
        
        id[$ $"section_colour_{_name}"] = dbg_section($"{string_upper(string_char_at(_name, 1)) + string_delete(_name, 1, 1)} Colour");
        
        for (var i = 0; i < id[$ $"{_name}_colour_length"]; ++i)
        {
            var _ = string(i);
            
            id[$ $"{_name}_colour"][$ _] ??= c_white;
            
            dbg_colour(ref_create(id[$ $"{_name}_colour"], _));
        }
    }
}