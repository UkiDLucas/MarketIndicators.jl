using DataFrames, CSV
function fetch_dataset( 
        file_name="TPLGX.csv", 
        date_format="yyyy.mm.dd", 
        dir="DATA\\original\\"
    )

    file_path = dir * file_name

    df = CSV.read(file_path, DataFrame, dateformat=date_format)
    df = sort(df, [:Date]);

    println("Fetched and sorted by date ", file_path, ", record count ", size(df)[1])
    
    return df # DataFrame
end