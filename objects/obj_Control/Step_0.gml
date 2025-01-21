if (keyboard_check_pressed(vk_f1))
{
    var _directory = $"screenshots/{datetime_to_unix()}.png";
    
    surface_save(application_surface, _directory);
    
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/screenshots");
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/{_directory}");
}

if (keyboard_check_pressed(vk_f2))
{
    show_debug_overlay(!is_debug_overlay_open());
}