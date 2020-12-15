using CSV, DataFrames, Dates

function fetch_web_data(file_path::String, original_data_directory)

    date_format="mm/dd/yyyy" # 9/14/2020
    df = CSV.read( file_path, DataFrame, dateformat="$date_format" )
    row_count = size(df)[1]

    for row in 1:row_count
        indicator_full_name  = df[row, :Indicator_Full_Name]
        url                  = df[row, :URL]
        symbol               = df[row, :Symbol]
        original_date_format = df[row, :Original_Date_Format]
        column_to_keep       = df[row, :Column_To_Keep]
        
        ## update date for Yahoo Finance URL
        if !isnothing(findfirst("finance.yahoo.com", url))
            url = update_yahoo_finance(url)
        end

        download( url , string(original_data_directory * symbol * ".csv" ) )
        println( "- downloaded: ", symbol, " -- ", indicator_full_name, " 
            -- ", url ) 

        ## preprocess 
        preprocess_csv(symbol, original_date_format, column_to_keep)


        # Slow down with random interval
        r_array = (rand(1)*9).+1  # 1.0.. to 9.9.. seconds
        r = r_array[1]
        sleep(r)            # to prevent being blocked
    end # for loop
    df = nothing # free the memory for gc()
end  # function
