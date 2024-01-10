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
conda activate 7730

if [ -z "$PUSH" ] ; then
  sed -i '/^exclude_patterns/s/, *"wip"]/]/' _config.yml
fi

NAME=$(basename $(pwd))
cd ..

if [ ! -z "$CLEAN" ] ; then
  jupyter-book clean $NAME
fi

jupyter-book build $NAME

cd $NAME

PAGE='_build/html/index.html'
HTML_DIR=$(dirname $PAGE)

if [ ! -z "$VIEW" ] ; then
  xdg-open $PAGE >/dev/null 2>&1
fi

if [ ! -z "$PUSH" ] ; then
  while true; do
    read -p "Do you want to publish the current build? [y/N] " ans
    case $ans in
      [Yy]|[Yy]es|YES ) rm -r $HTML_DIR/wip; ghp-import -n -p -f $HTML_DIR; break;;
      * ) exit;;
    esac
  done
fi

sed -i '/"wip"/!s/^\(exclude_patterns.*\)]/\1, "wip"]/' _config.yml
