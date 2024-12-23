#!/bin/sh

while [ $# -gt 0 ]; do
  case $1 in
    -a|--all)
      ALL="--all"
      ;;
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

if [ ! -z "$CLEAN" ] ; then
  uv run jupyter-book clean .
fi
uv run jupyter-book build $ALL .

PAGE='_build/html/index.html'
if [ ! -z "$VIEW" ] ; then
  xdg-open $PAGE >/dev/null 2>&1
fi

if [ ! -z "$PUSH" ] ; then
  if [ "$(git branch --show-current)" != "main" ] ; then
    echo "Cannot publish webpages when not on the main branch! Abort!"
    exit
  fi

  read -p "Do you want to publish the current build? [y/N] " ans
  case $ans in
    [Yy]|[Yy]es|YES ) ghp-import -n -p -f $(dirname $PAGE);;
  esac
fi
