if (text != undefined)
{
    draw_set_align(fa_center, fa_middle);
    
    draw_text_transformed(room_width / 2, 64, text, 2, 2, 0);
    
    draw_set_align(fa_left, fa_top);
}