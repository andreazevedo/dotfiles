###############################
# GIT, MERCUARIAL AND COLORS  #
###############################
__current_branch()
{
  # find out if we're in a git or hg repo by looking for the control dir
  local d git hg
  d=$PWD
  while : ; do
    if test -d "$d/.git" ; then
      git=$d
      break
    elif test -d "$d/.hg" ; then
      hg=$d
      break
    fi
    test "$d" = / && break
    # portable "realpath" equivalent
    d=$(cd "$d/.." && echo "$PWD")
  done

  local br
  if test -n "$hg" ; then
    local file
    for file in "$hg/.hg/bookmarks.current" "$hg/.hg/branch" ; do
      test -f "$file" && { read br < "$file" ; break; }
    done
  elif test -n "$git" ; then
    if test -f "$git/.git/HEAD" ; then
      read br < "$git/.git/HEAD"
      case $br in
        ref:\ refs/heads/*) br=${br#ref: refs/heads/} ;;
        *) # Lop off all of an SHA1 except the leading 7 hex digits.
           # Use this cumbersome notation (it's portabile) rather
           # than ${head:0:7}, which doesn't work with older zsh.
          br="DETACHED @ ${br%?????????????????????????????????}" ;;
      esac
    fi
  fi

  # Be compatable with __git_ps1. In particular:
  # - provide a space for the user so that they don't have to have
  #   random extra spaces in their prompt when not in a repo
  # - provide parens so it's differentiated from other crap in their prompt
  if [ -n "$br" ]; then
    printf %s "$br"
  fi
}

parse_branch()
{
  if [[ -n $(__current_branch) ]]; then
    echo "($(__current_branch)) "
  fi
}

customize_prompt()
{
  local PURPLE="\[\033[0;35m\]"
  local ORANGE="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[1;36m\]"
  local RESET="\[\033[0m\]"

  export PS1="$PURPLE\u$RESET@$ORANGE\h $GREEN\w $CYAN\$(parse_branch)$RESET\$ "
  PS2='> '
  PS4='+ '
}

customize_prompt
