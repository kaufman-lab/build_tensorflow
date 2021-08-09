#all the wheels are named the same and are in different folders
#take them from their respective folders and copy them to a new folder (release) with new neames
#since there are strict naming conventions to python packages, the only way to make them unique is adding a build tag
#the build tag will just be the either $march$mtune or the special names 
 #that were used in build_tensorflow_instructionsets to denote specific combinations of copt

getwd() #designed to be run in project root
f0 <- setdiff(list.files("builds"), c("release"))
build_tag <- paste0(1L:length(f0), gsub("tensorflow","", f0))

f <- file.path(getwd(),"builds", f0)


wheels <- as.vector(sapply(f, function(x){z<- list.files(x);grep("\\.whl",z,value=TRUE)}))
wheels_fullpath <- file.path(f,wheels)
stopifnot(all(sapply(wheels_fullpath, file.exists))) #check the wheels all actually exist

release_dir <- file.path(getwd(),"builds","release")
dir.create(release_dir, showWarnings = FALSE)



#naming conventions: https://www.python.org/dev/peps/pep-0491/#file-name-convention
#Python has granted us the ability to insert a build tag into the filename between the module version and python version

#if the wheels aren't all the same something has gone wrong. were they built with different python versions?
stopifnot(all(wheels[1]==wheels)) 
wheels_newname <- sapply(build_tag,function(b){
  gsub("(tensorflow-[0-9]\\.[0-9]\\.[0-9]-)",paste0("\\1",b,"-"),wheels[1])  
})



file.copy(wheels_fullpath, file.path(release_dir,wheels_newname),overwrite=TRUE)



