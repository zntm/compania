text = "Open Export Folder";

on_press = function()
{
    execute_shell_simple($"{environment_get_variable("LOCALAPPDATA")}/{game_project_name}/conexa/export");
}