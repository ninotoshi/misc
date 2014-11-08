#!/bin/sh

help() {
  cat << EOF
$0 -- install or upgrade formulae
Usage: $0 [-hic] [formula ...]
-h: display this message
-i: only install, do not upgrade
-c: run 'brew cask' instead of 'brew'
Note: -c implicitly activates -i
EOF
}

upgrade_existing() {
  $CMD upgrade $1
}

echo_existing() {
  echo $1 is already installed
}

init() {
  export HOMEBREW_CASK_OPTS="$HOMEBREW_CASK_OPTS"
  CMD="brew"
  EXISTING="upgrade_existing"

  OPTIND=1
  while getopts "hic" opt; do
      case "$opt" in
          h)
              help
              exit 0
              ;;
          i)
              EXISTING="echo_existing"
              ;;
          c)
              EXISTING="echo_existing"
              CMD="brew cask"
              ;;
          '?')
              help > /dev/stderr
              exit 1
              ;;
      esac
  done

  shift $((OPTIND-1))

  APPS="$@"
}

run() {
  init "$@"

  for app in $APPS; do
    if $CMD list $app > /dev/null 2>&1; then
      $EXISTING $app
    else
      $CMD install $app
    fi
  done
}

run "$@"
