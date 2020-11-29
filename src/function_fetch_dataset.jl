using DataFrames, CSV
function fetch_dataset( 
        file_name="TPLGX.csv", 
        date_format="yyyy.mm.dd", 
        dir="DATA\\original\\"
    )

    file_path = dir * file_name
    println(file_path)

    df = CSV.read(file_path, DataFrame, dateformat=date_format)
    df = sort(df, [:Date]);
    return df # DataFrame
end