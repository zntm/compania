if (base_colour_length != base_colour_length_new) || (edge_colour_length != edge_colour_length_new)
{
    base_colour_length_new = base_colour_length;
    edge_colour_length_new = edge_colour_length;
    
    rixa_init_colour("base");
    rixa_init_colour("edge");
}

if (preview_width != preview_width_new) || (preview_height != preview_height_new)
{
    preview_width_new  = preview_width;
    preview_height_new = preview_height;
    
    array_resize(preview_bit, preview_width);
    
    for (var i = 0; i < preview_width; ++i)
    {
        preview_bit[@ i] = rixa_init_preview();
    }
}

#region Base

if (!surface_exists(surface_base))
{
    surface_base = surface_create(16, 16);
}

surface_set_target(surface_base);

random_set_seed(base_seed);

for (var i = 0; i < RIXA_SIZE; ++i)
{
    for (var j = 0; j < RIXA_SIZE; ++j)
    {
        var _x = base_stretch_x * i;
        var _y = base_stretch_y * j;
        
        var _fade = min(1, _x / 4, _y / 4, (((RIXA_SIZE - 1) * base_stretch_x) - _x) / 4, (((RIXA_SIZE - 1) * base_stretch_y) - _y) / 4);
        
        var _noise = noise(i, j, base_colour_length - 1, base_octaves, base_seed);
        
        if (base_falloff > 0)
        {
            _noise *= lerp(1, min(1, i / base_falloff, j / base_falloff, ((RIXA_SIZE - 1) - i) / base_falloff, ((RIXA_SIZE - 1) - j) / base_falloff), base_falloff_alpha);
        }
        
        _noise += random_range(-base_noise_offset_min, base_noise_offset_max);
        
        var _colour = base_colour[$ string(clamp(round(_noise), 0, base_colour_length - 1))];
        
        draw_point_colour(i, j, _colour);
    }
}

surface_reset_target();

#endregion

#region Edge

rixa_edge_init("l");
rixa_edge_init("t");
rixa_edge_init("r");
rixa_edge_init("b");

for (var i = 0; i < RIXA_SIZE; ++i)
{
    if (i <= edge_indent_corner_padding) || (i >= (RIXA_SIZE - 1) - edge_indent_corner_padding)
    {
        surface_edge_indent_l = 0;
        surface_edge_indent_t = 0;
        surface_edge_indent_r = 0;
        surface_edge_indent_b = 0;
    }
    
    random_set_seed(edge_seed + i);
    
    rixa_edge(surface_edge_indent_l, i, "l");
    rixa_edge(i, surface_edge_indent_t, "t");
    
    rixa_edge((RIXA_SIZE - 1) - surface_edge_indent_r, i, "r");
    rixa_edge(i, (RIXA_SIZE - 1) - surface_edge_indent_b, "b");
}

#endregion

var _x = room_width  / 2;
var _y = room_height / 2;

rixa_draw(1,  _x + (RIXA_SIZE * 3), _y + (RIXA_SIZE * 3));
rixa_draw(16, _x, _y);

rixa_draw(2,  _x, _y - RIXA_SIZE);
rixa_draw(3,  _x + RIXA_SIZE, _y);
rixa_draw(4,  _x, _y + RIXA_SIZE);
rixa_draw(5,  _x - RIXA_SIZE, _y);

rixa_draw(6,  _x + RIXA_SIZE, _y - RIXA_SIZE);
rixa_draw(7,  _x + RIXA_SIZE, _y + RIXA_SIZE);
rixa_draw(8,  _x - RIXA_SIZE, _y + RIXA_SIZE);
rixa_draw(9,  _x - RIXA_SIZE, _y - RIXA_SIZE);

rixa_draw(10, _x + (RIXA_SIZE * 3), _y - RIXA_SIZE);
rixa_draw(12, _x + (RIXA_SIZE * 3), _y + RIXA_SIZE);
rixa_draw(14, _x + (RIXA_SIZE * 3), _y);

rixa_draw(11, _x + RIXA_SIZE, _y + (RIXA_SIZE * 3));
rixa_draw(13, _x - RIXA_SIZE, _y + (RIXA_SIZE * 3));
rixa_draw(15, _x, _y + (RIXA_SIZE * 3));

if (timer % 60 == 0)
{
    randomize();
    
    for (var i = 0; i < preview_width; ++i)
    {
        preview_bit[@ i] = rixa_init_preview();
    }
}

var _rixa_bit_index = global.rixa_bit_index;

for (var i = 0; i < preview_width; ++i)
{
    var _preview_bit = preview_bit[i];
    
    for (var j = 0; j < preview_height; ++j)
    {
        if (_preview_bit & (1 << j)) continue;
        
        var _x2 = _x + 256 + (i * RIXA_SIZE);
        var _y2 = _y + (j * RIXA_SIZE);
        
        var _flip_x = (preview_flip_x) && (irandom(1));
        var _flip_y = (preview_flip_y) && (irandom(1));
        
        var _bit = 0;
        
        if (i == 0) || ((preview_bit[i - 1] & (1 << j)))
        {
            _bit |= 1 << 3;
            
            _flip_x = false;
        }
        
        if (j == 0) || ((_preview_bit & (1 << (j - 1))))
        {
            _bit |= 1 << 2;
            
            _flip_y = false;
        }        
        
        if (i == preview_width - 1) || ((preview_bit[i + 1] & (1 << j)))
        {
            _bit |= 1 << 1;
            
            _flip_x = false;
        }
        
        if (j == preview_height - 1) || ((_preview_bit & (1 << (j + 1))))
        {
            _bit |= 1 << 0;
            
            _flip_y = false;
        }
        
        if (_flip_x)
        {
            _x2 += RIXA_SIZE;
        }
        
        if (_flip_y)
        {
            _y2 += RIXA_SIZE;
        }
        
        rixa_draw(_rixa_bit_index[_bit], _x2, _y2, (_flip_x ? -1 : 1), (_flip_y ? -1 : 1));
    }
}

++timer;