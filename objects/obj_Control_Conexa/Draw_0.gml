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

var _x = room_width  / 2;
var _y = room_height / 2;

if (timer % 60 == 0)
{
    randomize();
    
    for (var i = 0; i < preview_width; ++i)
    {
        preview_bit[@ i] = rixa_init_preview();
    }
}

if (sprite_exists(sprite_base)) && (sprite_exists(sprite_edge))
{
    {
        var _x2 = _x - (RIXA_SIZE * 1.5) - 128;
        var _y2 = _y - (RIXA_SIZE * 1.5);
        
        draw_rectangle_colour(_x2 - (RIXA_SIZE * 2), _y2 - (RIXA_SIZE * 2), _x2 + (RIXA_SIZE * 5), _y2 + (RIXA_SIZE * 5), preview_colour_tl, preview_colour_tr, preview_colour_br, preview_colour_bl, false);
        
        conexa_draw(1,  _x2 + (RIXA_SIZE * 3), _y2 + (RIXA_SIZE * 3));
        conexa_draw(16, _x2, _y2);
        
        conexa_draw(2,  _x2, _y2 - RIXA_SIZE);
        conexa_draw(3,  _x2 + RIXA_SIZE, _y2);
        conexa_draw(4,  _x2, _y2 + RIXA_SIZE);
        conexa_draw(5,  _x2 - RIXA_SIZE, _y2);
        
        conexa_draw(6,  _x2 + RIXA_SIZE, _y2 - RIXA_SIZE);
        conexa_draw(7,  _x2 + RIXA_SIZE, _y2 + RIXA_SIZE);
        conexa_draw(8,  _x2 - RIXA_SIZE, _y2 + RIXA_SIZE);
        conexa_draw(9,  _x2 - RIXA_SIZE, _y2 - RIXA_SIZE);
        
        conexa_draw(10, _x2 + (RIXA_SIZE * 3), _y2 - RIXA_SIZE);
        conexa_draw(12, _x2 + (RIXA_SIZE * 3), _y2 + RIXA_SIZE);
        conexa_draw(14, _x2 + (RIXA_SIZE * 3), _y2);
        
        conexa_draw(11, _x2 + RIXA_SIZE, _y2 + (RIXA_SIZE * 3));
        conexa_draw(13, _x2 - RIXA_SIZE, _y2 + (RIXA_SIZE * 3));
        conexa_draw(15, _x2, _y2 + (RIXA_SIZE * 3));
    }
    
    {
        random_set_seed(floor(timer / 60));

        var _x2 = _x - (RIXA_SIZE * (preview_width  / 2)) + 128;
        var _y2 = _y - (RIXA_SIZE * (preview_height / 2));
        
        draw_rectangle_colour(_x2 - RIXA_SIZE, _y2 - RIXA_SIZE, _x2 + (RIXA_SIZE * (preview_width + 1)), _y2 + (RIXA_SIZE * (preview_height + 1)), preview_colour_tl, preview_colour_tr, preview_colour_br, preview_colour_bl, false);
        
        var _rixa_bit_index = global.rixa_bit_index;
        
        for (var i = 0; i < preview_width; ++i)
        {
            var _preview_bit = preview_bit[i];
            
            for (var j = 0; j < preview_height; ++j)
            {
                if (_preview_bit & (1 << j)) continue;
                
                var _x3 = _x2 + (i * RIXA_SIZE);
                var _y3 = _y2 + (j * RIXA_SIZE);
                
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
                    _x3 += RIXA_SIZE;
                }
                
                if (_flip_y)
                {
                    _y3 += RIXA_SIZE;
                }
                
                conexa_draw(_rixa_bit_index[_bit], _x3, _y3, (_flip_x ? -1 : 1), (_flip_y ? -1 : 1));
            }
        }
    }
}

++timer;