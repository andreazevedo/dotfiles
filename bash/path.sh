##########
# PROMPT #
##########
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
  local RESET="\[\033[0m\]"

  export PS1="$PURPLE\u$RESET@$ORANGE\H $GREEN\w $RESET\$(parse_branch)\$ "
  PS2='> '
  PS4='+ '
}

customize_prompt


#############
# UTILITIES #
#############
# LS
alias ls='ls --color'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
