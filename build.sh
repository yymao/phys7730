#!/bin/sh

while [ $# -gt 0 ]; do
    case $1 in
        -c|--clean)
            CLEAN=1
            ;;
        -p|--push|--publish)
            PUSH=1
            ;;
        -v|--view)
            VIEW=1
            ;;
    esac
    shift
done

CONDABIN='/home/yymao/miniforge3/bin/conda'
eval "$($CONDABIN shell.bash hook)"
conda activate book

NAME=$(basename $(pwd))
cd ..

if [ ! -z "$CLEAN" ] ; then
  jupyter-book clean $NAME
fi

jupyter-book build $NAME

cd $NAME

PAGE='_build/html/index.html'

if [ ! -z "$VIEW" ] ; then
  xdg-open $PAGE &> /dev/null
fi

if [ ! -z "$PUSH" ] ; then
  while true; do
    read -p "Do you want to publish the current build? [y/N] " ans
    case $ans in
      [Yy]|[Yy]es|YES ) ghp-import -n -p -f $(dirname $PAGE); break;;
      * ) exit;;
    esac
  done
fi
