getwd()
f0 <- setdiff(list.files("builds"), "release")
f <- file.path(getwd(),"builds", f0)


wheels0 <- sapply(f, function(x){z<- list.files(x);grep("\\.whl",z,value=TRUE)})
wheels <- file.path(f,wheels0)

release_dir <- file.path(getwd(),"builds","release")
wheels_destinations <- file.path(release_dir,f0)
file.copy(wheels, wheels_destinations,overwrite=TRUE)


wheels_newname <- paste0(gsub("tensorflow", "tensorflow-2.5.0-cp38-cp38-linux_x86_64_",f0),".whl")


file.rename(wheels_destinations, file.path(release_dir, wheels_newname))


