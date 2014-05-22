function fish_prompt -d 'Set custom prompt'

  # cache variable rather than calculate each time
  if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
	end

  set_color red
  echo -n $USER
  set_color normal
  echo -n ' at '

  set_color D80
  echo -n $__fish_prompt_hostname
  set_color normal
  echo -n ' in '

  set_color FF0
  echo -n (prompt_pwd)

  set_color normal
  # echo -n ' on '
  # set_color purple
  # @TODO git branch here…
  echo

  set_color purple
  echo -n '¿ '
  set_color normal
end
