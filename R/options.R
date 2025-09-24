# expand printing and viewing options
options(repr.matrix.max.cols=300, repr.matrix.max.rows=200)
options(dplyr.width = Inf)
options(max.print = 10000)

# set AWS SSO parameters
Sys.setenv(AWS_PROFILE = "")