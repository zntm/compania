function rixa_gradient_set(_name, _start, _end)
{
    with (obj_Control_Rixa)
    {
        var _length = id[$ $"{_name}_length"];
        
        for (var i = 0; i < _length; ++i)
        {
            id[$ _name][$ string(i)] = merge_colour(_start, _end, i / (_length - 1));
        }
    }
}