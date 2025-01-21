text = "Export";

on_press = function()
{
    var _surface = surface_create(17 * RIXA_SIZE, RIXA_SIZE);
    
    surface_set_target(_surface);
    draw_clear_alpha(c_black, 0);
    
    for (var i = 0; i < 17; ++i)
    {
        rixa_draw(i, i * RIXA_SIZE, 0);
    }
    
    surface_reset_target();
    
    var _unix = datetime_to_unix();
    
    surface_save(_surface, $"rixa/{_unix}.png");
    
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/rixa/{_unix}.png");
    
    surface_free(_surface);
}