function preview_data(df)
    println("
    Usage:
          preview_data(df)
          preview_data(df[1:2,1:3])
    ")
    
    all_rows = size(df)[1]
    show_rows = 20
    
    if all_rows < show_rows
        show_rows = all_rows
    end
    
    interval = convert(Int64, round(all_rows/show_rows, digits=0))
    rows = collect(1:interval:all_rows)
    show(df[ rows, :], allcols=true) # do NOT limit number of columns if more than 6
end


