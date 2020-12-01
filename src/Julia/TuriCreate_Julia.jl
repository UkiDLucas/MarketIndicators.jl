## uncomment for the first run
# import Pkg
# Pkg.add("PyCall")
# Pkg.add("Conda")
# ENV["PYTHON"] = "/opt/anaconda3/envs/turi/bin/python"
# /opt/anaconda3/envs/turi/lib/python3.6/site-packages/
# Pkg.build("PyCall")

using PyCall
tc = pyimport("turicreate")

data_path="../DATA/processed/uber.csv"
data = tc.SFrame(data_path)
#get(data, 1743)

row_count = size(data)[1]

# Do not take initial year data as averages are not complete
dict_1743 = get(data, 1743)

# Make a train-test split
train_data, test_data = data.random_split(0.8)
println()

size(train_data)
size(test_data)

column_to_predict = "DJIA_Original"

model = tc.regression.create( 
    train_data, 
    target = column_to_predict, 
    features = [
                 "DJIA_Avg005"
                ,"DJIA_Avg030"
                ,"DJIA_Avg090"
                ,"DJIA_Avg180"        
                ,"DJIA_Avg365"

                ,"ISM_MFC_EMP_Avg090"
                ,"ISM_MFC_EMP_Avg180"
                ,"ISM_MFC_EMP_Avg365"

                ,"HOUSE_SRT_MM_Value"
                ,"HOUSE_SRT_MM_Avg090"
                ,"HOUSE_SRT_MM_Avg180"
                ,"HOUSE_SRT_MM_Avg365"

                ,"MFC_MPI_Value"
                ,"MFC_MPI_Avg090"
                ,"MFC_MPI_Avg180"
                ,"MFC_MPI_Avg365"
        
                ,"VIX_Avg005"
                ,"VIX_Avg030"
                ,"VIX_Avg090"
                ,"VIX_Avg180"        
                ,"VIX_Avg365"
            ], 
    validation_set="auto", 
    verbose=true
)

## Save predictions to an SArray
predictions = model.predict(test_data)
#predictions

initio = 0                    # latin: start
gradus = 30                   # latin: step
finem  = size(predictions)[1] # latin: end

println(column_to_predict, " ", finem)

for id in initio:gradus:finem
    
    a = get(predictions, id)
    
    b = get(test_data, column_to_predict )
    b = get(b, id )

    println( "predicted ", round(a, digits=1) , "\t but actual value was \t", round(b, digits=1) , "\t difference is ",  round(b-a, digits=2)  ) # dict
end



#TODO: write this in a loop to select the best model
# Evaluate the model and save the results into a dictionary
results = model.evaluate( test_data ) #test_data[0:2531]
results

rmse = results["rmse"]
rmse = round(rmse, digits=2)

max_error = results["max_error"]
max_error = round(max_error, digits=2)

println( "max_error: ", max_error, ", rmse: ", rmse )
# max_error: 1069.27, rmse: 184.6



# Export to Core ML
model.export_coreml("../DATA/models/^DJI.mlmodel")


