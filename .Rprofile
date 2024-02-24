source("renv/activate.R")

options(repos = c(RSPM = "https://packagemanager.rstudio.com/all/latest"))
options(renv.config.repos.override = getOption("repos"))

# General settings for any container environment
if (Sys.getenv("INSIDE_CONTAINER") == "true") {
  .libPaths(new = c(.libPaths(), "/home/rstudio/vscode-R/renv/library/R-4.3/x86_64-pc-linux-gnu"))
  cmdstan_path <- Sys.getenv("CMDSTAN_PATH", unset = NA)
  if (!is.na(cmdstan_path)) {
    cmdstanr::set_cmdstan_path(cmdstan_path)
  }
}

# Docker-specific settings
if (Sys.getenv("INSIDE_DOCKER") == "true") {
  Sys.setenv(RENV_PATHS_CACHE = "/renv")
}
