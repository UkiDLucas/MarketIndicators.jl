module MarketIndicators

    #import Base.ctranspose                     
    
    ## export some of the functions defined in this package
    export update_yahoo_finance        

    ## include the contents of other files in the module
    include("function_add_overal_mean.jl")
    include("function_add_rata_die_column.jl")
    include("function_available_datasets.jl")
    include("function_calculate_average.jl")
    include("function_fetch_data.jl")
    include("function_format_dates.jl")
    include("function_populate_missing_dates.jl")
    include("function_position_on_date.jl")
    include("function_preview_data.jl")
    include("function_print_colunms.jl")
    include("function_quantize_column.jl")
    include("function_save_dataset.jl")
    include("function_shift_dates_by_days.jl")
    include("function_update_rata_die.jl")
    include("function_update_yahoo_finance.jl")
    include("function_updated.jl")
end # of module