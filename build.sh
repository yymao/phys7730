#!/bin/sh

while [ $# -gt 0 ]; do
  case $1 in
    -a|--all)
      ALL="--all"
      ;;
    -c|--clean)
      CLEAN=1
      ;;
    -v|--view)
      VIEW=1
      ;;
  esac
  shift
done

EXE='$HOME/python/7730/.venv/bin/jupyter-book'

if [ ! -z "$CLEAN" ] ; then
  $EXE clean .
fi
$EXE build $ALL .

PAGE='_build/html/index.html'
if [ ! -z "$VIEW" ] ; then
  xdg-open $PAGE >/dev/null 2>&1
fi
