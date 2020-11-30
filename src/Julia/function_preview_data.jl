function preview_data(df, show_rows = 6)
    all_rows = size(df)[1]
    
    if all_rows < show_rows
        show_rows = all_rows
    end
    
    interval = convert(Int64, round(all_rows/show_rows, digits=0))
    rows = collect(1:interval:all_rows)
    show(df[ rows, :], allcols=true) # do NOT limit number of columns if more than 6

    println("\n Dataset dimentions: ", size(df) )
    println("\n variable columns:")
    columns = names(df)
    for i in 1:length(columns)
        println(i, " ", columns[i])
    end
    return columns
end