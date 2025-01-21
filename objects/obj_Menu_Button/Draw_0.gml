draw_rectangle(bbox_left, bbox_top, bbox_right - 1, bbox_bottom - 1, true);

if ((instance_position(mouse_x, mouse_y, id)))
{
    draw_triangle(bbox_left, bbox_top, bbox_left, bbox_top + 8, bbox_left + 8, bbox_top, false);
}

draw_set_align(fa_center, fa_middle);

draw_text((bbox_left + bbox_right - 1) / 2, (bbox_top + bbox_bottom - 1) / 2, text);

draw_set_align(fa_left, fa_top);