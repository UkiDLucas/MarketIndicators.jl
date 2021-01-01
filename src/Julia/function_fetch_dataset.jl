using DataFrames, CSV

function fetch_dataset( 
        file_name="TPLGX.csv", 
        date_format="yyyy.mm.dd", 
        dir="../DATA/original/"
    )

    file_path = dir * file_name

    df = CSV.read(file_path, DataFrame, dateformat=date_format)
    

    ## Note: sort does not work at this point because column names vary
    # df = sort(df, [ :Date ]);
    # df = sort(df, [ :"Date       "] ); # spaces in the string

    println("Fetched ", file_path, ", record count ", size(df)[1])
    
    return df # DataFrame
end