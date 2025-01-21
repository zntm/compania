#macro NOISE_SIZE 256

function noise(_x, _y, _amplitude, _octaves, _seed)
{ 
    static __surface = -1;
    static __buffer = -1;
    
    static __current_x = infinity;
    static __current_y = 0;
    static __current_amplitude = 0;
    static __current_octaves = 0;
    static __current_seed = 0;
    
    var _x2 = floor(_x / NOISE_SIZE);
    var _y2 = floor(_y / NOISE_SIZE);
    
    if (_x2 != __current_x) || (_y2 != __current_y) || (_amplitude != __current_amplitude) || (_octaves != __current_octaves) || (_seed != __current_seed)
    {
        // show_debug_message($"{_x2} {_y2} {_amplitude} {_octaves} {_seed}");
        
        __current_x = _x2;
        __current_y = _y2;
        
        __current_amplitude = _amplitude;
        __current_octaves = _octaves;
        __current_seed = _seed;
        
        if (!surface_exists(__surface))
        {
            __surface = surface_create(NOISE_SIZE, NOISE_SIZE, surface_r8unorm);
        }
        
        surface_set_target(__surface);
        
        shader_set(shd_Noise);
        
        static __uniform_position_offset = shader_get_uniform(shd_Noise, "u_PositionOffset");
        static __uniform_amplitude = shader_get_uniform(shd_Noise, "u_Amplitude");
        static __uniform_octaves = shader_get_uniform(shd_Noise, "u_Octaves");
        static __uniform_seed = shader_get_uniform(shd_Noise, "u_Seed");
        
        shader_set_uniform_f(__uniform_position_offset, _x2 * NOISE_SIZE, _y2 * NOISE_SIZE); 
        shader_set_uniform_f(__uniform_amplitude, _amplitude / 255);
        shader_set_uniform_f(__uniform_octaves, _octaves / 32);
        shader_set_uniform_f(__uniform_seed, _seed);
        
        draw_rectangle(0, 0, NOISE_SIZE, NOISE_SIZE, false);
        
        shader_reset();
        
        surface_reset_target();
        
        if (!buffer_exists(__buffer))
        {
            __buffer = buffer_create(NOISE_SIZE * NOISE_SIZE, buffer_fast, 1);
        }
        
        buffer_get_surface(__buffer, __surface, 0);
    }
    
    return buffer_peek(__buffer, (((_y + (1 << 32)) & (NOISE_SIZE - 1)) << log2(NOISE_SIZE)) | ((_x + (1 << 32)) & (NOISE_SIZE - 1)), buffer_u8);
}