if (sprite_exists(sprite_base)) && (sprite_exists(sprite_edge))
{
    var _x = room_width  / 2;
    var _y = room_height / 2;
    
    draw_sprite_ext(sprite_base, 0, _x - 32, _y, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sprite_edge, 0, _x + 32, _y, 2, 2, 0, c_white, 1);
}