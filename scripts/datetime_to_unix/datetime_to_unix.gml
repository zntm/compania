function datetime_to_unix(_datetime = date_current_datetime())
{
    gml_pragma("forceinline");
    
    return ceil((_datetime - 25569) * 86400);
}
