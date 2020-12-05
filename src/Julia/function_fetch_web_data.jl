using CSV, DataFrames, Dates

function fetch_web_data(df::DataFrame)
    row_count = size(df)[1]

    for row in 1:row_count
        indicatior_name  = df[row, 1]
        file_name        = df[row, 2]
        url              = df[row, 3]
        if !isnothing(findfirst("finance.yahoo.com", url))
            url = update_yahoo_finance(url)
        end
        download( url , string(original_data_directory * file_name ) )
        println( "- downloaded: ", indicatior_name, " 
            -- ", file_name, "
            -- ", url ) 
        r_array = (rand(1)*9).+1  # 1.0.. to 9.9.. seconds
        r = r_array[1]
        sleep(r)            # to prevent being blocked
    end # for loop
end  # function