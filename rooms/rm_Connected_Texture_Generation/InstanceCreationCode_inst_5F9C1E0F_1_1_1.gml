text = "Export";

on_press = function()
{
    var _surface = surface_create(17 * RIXA_SIZE, RIXA_SIZE);
    
    var _temp = 4;
    
    surface_set_target(_surface);
    
    for (var i = 0; i < 17; ++i)
    {
        if (i == 0) && (file_exists("conexa/import/icon.png"))
        {
            var _sprite = sprite_add("conexa/import/icon.png", 1, false, false, 0, 0);
            
            draw_sprite(_sprite, 0, 0, 0);
            
            sprite_delete(_sprite);
            
            continue;
        }
        
        conexa_draw(i, RIXA_SIZE * i, 0);
    }
    
    surface_reset_target();
    
    var _unix = datetime_to_unix();
    
    surface_save(_surface, $"conexa/export/{_unix}_strip17.png");
    
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/conexa/export/{_unix}_strip17.png");
    
    surface_free(_surface);
}