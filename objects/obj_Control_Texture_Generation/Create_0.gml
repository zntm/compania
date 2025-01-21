#macro TEXTURE_GENERATION_SIZE 16

debug_view = -1;

#region Base

surface_base = -1;

section_base = -1;
section_colour_base = -1;

base_colour = {}

base_colour_length     = 8;
base_colour_length_new = 8;

base_seed = irandom_range(0, (1 << 24) - 1);

base_octaves = 32;

base_noise_offset_min = 0;
base_noise_offset_max = 0;

base_flip_x = false;
base_flip_y = false;

base_stretch_x = 1;
base_stretch_y = 1;

base_falloff = 0;
base_falloff_alpha = 1;

base_gradient_start = c_black;
base_gradient_end = c_white;

texture_generation_gradient_set("base_colour", c_black, c_white);

#endregion

#region Edge

surface_edge_l = -1;
surface_edge_t = -1;
surface_edge_r = -1;
surface_edge_b = -1;

section_edge = -1;
section_colour_edge = -1;

edge_colour = {}

edge_colour_length     = 3;
edge_colour_length_new = 3;

edge_seed = irandom_range(0, (1 << 24) - 1);

edge_octaves = 32;

edge_indent_chance = 0.5;
edge_indent_chance_step = 0.5;

edge_indent_corner_padding = 3;

edge_gradient_start = c_black;
edge_gradient_end = c_white;

#endregion

texture_generation_init();