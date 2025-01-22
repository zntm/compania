var _colour_replace_amount  = global.colour_replace_amount;
var _colour_replace_match   = global.colour_replace_match;
var _colour_replace_replace = global.colour_replace_replace;

var _colour_index = 1 + (floor(timer / 60) % (array_length(colour) - 1));

var _colour_strip_length = array_length(colour[0]);

var _sprite_length = array_length(sprite);

var _sprite = sprite[floor(timer / 90) % _sprite_length];

var _x = (room_width  / 2) - (sprite_get_width(_sprite)  / 2);
var _y = (room_height / 2) - (sprite_get_height(_sprite) / 2);

draw_sprite(_sprite, 0, _x - 256, _y);

shader_set(shd_Colour_Replace);

shader_set_uniform_i(_colour_replace_amount, _colour_strip_length);

shader_set_uniform_i_array(_colour_replace_match, colour[0]);
shader_set_uniform_i_array(_colour_replace_replace, colour[_colour_index]);

draw_sprite(_sprite, 0, _x + 256, _y);

shader_reset();

draw_set_halign(fa_right);

draw_text(room_width - 16, 16, "Colors");

draw_set_halign(fa_left);

var _colour_length = array_length(colour);

for (var i = 0; i < _colour_length; ++i)
{
    var _colours = colour[i];
    
    for (var j = 0; j < _colour_strip_length; ++j)
    {
        var _colour = _colours[j];
        
        var _x1 = room_width - 16 - (j * 16);
        var _y1 = 16 + 24 + (i * 8);
        
        var _x2 = _x1 - 16 - 1;
        var _y2 = _y1 + 8;
        
        draw_rectangle_colour(_x1, _y1, _x2, _y2, _colour, _colour, _colour, _colour, false);
    }
}

var _x1 = room_width - 16 - (_colour_strip_length * 16);
var _y1 = 16 + 24 + (_colour_index * 8);

var _x2 = _x1 - 1 - 4;
var _y2 = _y1 - 1 + 8;

draw_rectangle(_x1, _y1, _x2, _y2, false);

++timer;