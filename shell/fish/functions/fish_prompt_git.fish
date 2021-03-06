set -U fish_color_git_clean green
set -U fish_color_git_dirty red
set -U fish_color_git_ahead red
set -U fish_color_git_behind red
set -U fish_color_git_staged yellow

set -U fish_color_git_added green
set -U fish_color_git_modified blue
set -U fish_color_git_renamed magenta
set -U fish_color_git_deleted red
set -U fish_color_git_unmerged yellow
set -U fish_color_git_untracked cyan

set -U fish_prompt_git_status_added '✚'
set -U fish_prompt_git_status_modified '*'
set -U fish_prompt_git_status_renamed '➜'
set -U fish_prompt_git_status_deleted '✖'
set -U fish_prompt_git_status_unmerged '═'
set -U fish_prompt_git_status_untracked '.'
set -U fish_prompt_git_status_ahead 'A'
set -U fish_prompt_git_status_behind 'B'
set -U fish_prompt_git_status_clean '✓'
set -U fish_prompt_git_status_

function fish_prompt_git --description 'Write out the git prompt'
  set -l branch (git symbolic-ref --quiet --short HEAD 2>/dev/null)
  if test -z $branch
    return
  end

  printf '|'

  set -l index (git status --porcelain 2>/dev/null)
  if test -z "$index"
    set_color $fish_color_git_clean
    printf $branch $fish_prompt_git_status_clean
    set_color normal
    return
  end

  git diff-index --quiet --cached HEAD 2>/dev/null
  set -l staged $status
  if test $staged = 1
    set_color $fish_color_git_staged
  else
    set_color $fish_color_git_dirty
  end

  printf $branch'⚡ '

  set -l info
  for i in $index
    switch $i
      case 'A  *'
        set i added
      case 'M  *' ' M *'
        set i modified
      case 'R  *'
        set i renamed
      case 'D  *' ' D *'
        set i deleted
      case 'U  *'
        set i unmerged
      case '?? *'
        set i untracked
    end

    if not contains $i $info
      set info $info $i
    end
  end

  for i in added modified renamed deleted unmerged untracked ahead behind
    if contains $i $info
      eval 'set_color $fish_color_git_'$i
      eval 'printf $fish_prompt_git_status_'$i
    end
  end

  set_color normal
end
