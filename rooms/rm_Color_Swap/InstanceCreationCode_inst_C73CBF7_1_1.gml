text = "Open Import Folder";

on_press = function()
{
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/color_swap/import");
}