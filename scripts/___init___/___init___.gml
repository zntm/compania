#macro DATAFILES_RESOURCES ((GM_build_type == "run") ? $"{filename_dir(GM_project_filename)}/datafiles/" : "")

directory_create("color_swap/import");
directory_create("color_swap/import/sprite");

directory_create("color_swap/export");

directory_create("rixa");

global.rixa_bit = [
    0b1111,
    0b1111,
    0b0100,
    0b0010,
    0b0001,
    0b1000,
    0b0110,
    0b0011,
    0b1001,
    0b1100,
    0b1110,
    0b0111,
    0b1011,
    0b1101,
    0b1010,
    0b0101,
    0b0000,
];

global.rixa_bit_index[@ 0b1111] = 1;
global.rixa_bit_index[@ 0b0100] = 2;
global.rixa_bit_index[@ 0b0010] = 3;
global.rixa_bit_index[@ 0b0001] = 4;
global.rixa_bit_index[@ 0b1000] = 5;
global.rixa_bit_index[@ 0b0110] = 6;
global.rixa_bit_index[@ 0b0011] = 7;
global.rixa_bit_index[@ 0b1001] = 8;
global.rixa_bit_index[@ 0b1100] = 9;
global.rixa_bit_index[@ 0b1110] = 10;
global.rixa_bit_index[@ 0b0111] = 11;
global.rixa_bit_index[@ 0b1011] = 12;
global.rixa_bit_index[@ 0b1101] = 13;
global.rixa_bit_index[@ 0b1010] = 14;
global.rixa_bit_index[@ 0b0101] = 15;
global.rixa_bit_index[@ 0b0000] = 16;

global.colour_replace_amount  = shader_get_uniform(shd_Colour_Replace, "amount");
global.colour_replace_match   = shader_get_uniform(shd_Colour_Replace, "match");
global.colour_replace_replace = shader_get_uniform(shd_Colour_Replace, "replace");

show_debug_overlay(true);