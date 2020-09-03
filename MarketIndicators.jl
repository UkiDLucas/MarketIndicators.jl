function fetch_data(file_path)
    isfile(file_path) || # does file exist locally?
        download( string("https://raw.githubusercontent.com/UkiDLucas/MarketIndicators.jl/master/", file_path), # URL
        file_path) # save it as name
    
    return CSV.read(file_path) # returnd DataFrame
end


