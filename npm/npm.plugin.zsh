# The following is based on https://github.com/gma/bundler-exec

npm_commands=( bower )

## Functions

_npm-installed() {
  which npm > /dev/null 2>&1
}

_within-npm-project() {
  local check_dir=$PWD
  while [ "$(dirname $check_dir)" != "/" ]; do
    [ -f "$check_dir/package.json" ] && return
    check_dir="$(dirname $check_dir)"
  done
  false
}

_run-with-npm() {
  if _npm-installed && _within-npm-project; then
    if [[ -f "./bin/$@" ]]; then
      ./bin/$@
    else
      ./node_modules/.bin/$@
    fi
  else
    $@
  fi
}

## Main program
for cmd in $npm_commands; do
  eval "function npm_$cmd () { _run-with-npm $cmd \$@}"
  alias $cmd=npm_$cmd

  if which _$cmd > /dev/null 2>&1; then
        compdef _$cmd npm_$cmd
  fi
done
