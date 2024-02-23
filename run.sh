#!/usr/bin/env bash
set -e

menu() {
	echo "1) tar_make() on local (or inside docker)"
	echo "2) tar_make_clustermq() on local (or inside docker)"
	echo "3) tar_make() on Apptainer"
	echo "4) tar_make_clustermq() on Apptainer"
	echo "5) Enter in the Apptainer container"
	echo "6) Enter in the Singularity container on HPC"
	read -rp "Enter number：" menu_num
  case $menu_num in
  1)
    Rscript R/run_script.R 1
    ;;
  2)
    Rscript R/run_script.R 32
    ;;
  3)
 		apptainer exec  \
		--env INSIDE_CONTAINER=true \
  	--env RENV_PATHS_CACHE=${HOME}/renv \
 		radian.sif Rscript R/run_script.R 1
    ;;
  4)
 		apptainer exec \
  	--env INSIDE_CONTAINER=true \
  	--env RENV_PATHS_CACHE=${HOME}/renv \
 		radian.sif Rscript R/run_script.R 32
    ;;
  5)
 		apptainer shell \
		--env INSIDE_CONTAINER=true \
  	--env RENV_PATHS_CACHE=${HOME}/renv \
		radian.sif bash
    ;;
  6)
 		singularity shell \
  	--env INSIDE_CONTAINER=true \
  	--env RENV_PATHS_CACHE=${HOME}/renv \
		radian.sif bash
    ;;
	*)
    echo "Type 1-6"
    ;;
  esac
}

menu "$@"
