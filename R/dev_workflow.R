dev_workflow <- function(){
  packer::bundle()
  devtools::document()
  devtools::load_all()
  forceNetwork()

}
