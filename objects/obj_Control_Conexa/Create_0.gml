sprite_base = -1;
sprite_edge = -1;

randomize();

preview_width  = 5;
preview_height = 5;

preview_width_new  = 5;
preview_height_new = 5;

preview_bit = array_create_ext(5, rixa_init_preview);

preview_flip_x = false;
preview_flip_y = false;

preview_colour_tl = irandom(255 * 255 * 255);
preview_colour_tr = irandom(255 * 255 * 255);
preview_colour_bl = irandom(255 * 255 * 255);
preview_colour_br = irandom(255 * 255 * 255);

timer = 0;