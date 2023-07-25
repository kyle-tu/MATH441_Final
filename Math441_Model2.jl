#****************************************************************************
# Project - Math 441
#****************************************************************************

# Intro definitions
using JuMP
using Gurobi
using PlotlyJS


# Data
cdir1 = ("C:/Users/Lisem/OneDrive - Danmarks Tekniske Universitet")
cdir2=("/Uni/7. Semester (Canada)/MATH 441/Julia/")
cdir = string(cdir1,cdir2)
file="Data2.jl"
include(string(cdir,file))

F = length(FilesSize)
S = sum(FilesSize[f] for f=1:F)
RT = sum(RetriveTimes[f] for f=1:F)
X = 6

# Model
model=Model(Gurobi.Optimizer)

set_time_limit_sec(model,360) #time limit of an hour
set_optimizer_attribute(model, "Threads", 4)

@variable(model, x[1:X,1:F], Bin) # Decision variable

# Define values for tiers
Cost = [0.023,0.0125,0.01,0.04,0.0036,0.00099]
Storage = [0.5,30,30,90,90,180]
RetrievalTime = [0.001,0.01,0.1,6,24,30]
RetrivelCharge = [0.005,0.01,0.01,0.02,0.03,0.05]

# Minimize cost
@objective(model, 
    Min, sum(x[i,f]*(FilesSize[f]*Cost[i] + RetrivelCharge[i]*RetriveTimes[f]) 
        for f in 1:F, i in 1:X))

# Forfill companies criteria
@constraint(model,
    sum(x[i,f]*RetriveTimes[f]*RetrievalTime[i]/(RT) for i in 1:X, f in 1:F)
        <=RetrivelRate)

@constraint(model,
    sum(x[i,f]*Storage[i]/(F) for i in 1:X, f in 1:F)
        <=MinStorage)

# Each file is in exactly one tier.
@constraint(model,
    [f=1:F], sum(x[i,f] for i in 1:X)==1)






#************************************************************************
# solve
optimize!(model)
println("Termination status: $(termination_status(model))")
#************************************************************************

DataTier = zeros(6)
# Print results
if termination_status(model) == MOI.OPTIMAL
    println("Optimal objective value: $(objective_value(model))")
   println("Solution:")
    for i=1:X
        sum1 = 0
        for f = 1:F
            if ((value(x[i,f]))==1)
                #println("File $(f) is in Tier $(i)")
                sum1 += FilesSize[f]
            end
        end
        if(value(x[i,1000])==1)
            println("File 1000 is in tier $(i).")
            println("File 1000 is $(FilesSize[1000]) GB")
            println("File 1000 is expected to be retrived $(RetriveTimes[1000]*1000) times")
        end
        println("In total $(sum1) GB is in Tier $(i)")
        DataTier[i] = sum1
    end
end

y = [20, 14, 23,21,21,21]
Tiers = ["Tier 1", "Tier 2","Tier 3","Tier 4","Tier 5","Tier 6"]
Fig1 = plot(bar(x=Tiers, y=DataTier,text=round.(DataTier,digits=2),textposition="outside"))
savefig(Fig1,"Figure1.png")


#************************************************************************
println("Successfull end of $(PROGRAM_FILE)")
#***********************************************************************
