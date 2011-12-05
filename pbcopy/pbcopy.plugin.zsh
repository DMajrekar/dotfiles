function _pbcopy_command () {
  if [ -e "/usr/bin/pbcopy" ]; then
    /usr/bin/pbcopy
  else
    nc -q1 localhost 2224
  fi
}
alias pbcopy='_pbcopy_command'
