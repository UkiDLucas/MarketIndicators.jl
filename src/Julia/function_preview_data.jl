function preview_data(df, show_rows = 6)
    show_rows = show_rows-1 # adding the last record later on
    record_count = size(df)[1]
    
    if record_count < show_rows
        show_rows = record_count
    end
    
    interval = convert(Int64, round(record_count/show_rows, digits=0))

    rows = collect(1:interval:record_count) # results in an array of record IDs
    rows = append!(rows, record_count) # add last record

    println("Showing record IDs ", rows, " at interval ", interval )

    show(df[ rows, :], allcols=true) # do NOT limit number of columns if more than 6

    println("\n Dataset dimentions: ", size(df) )
    println("\n Column names (note any extra spaces):")
    columns = names(df)
    for i in 1:length(columns)
        println(i, " '", columns[i], "' ") # quotes to show any empty spaces
    end
    return columns
end