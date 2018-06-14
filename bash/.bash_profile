#
# ~/.bash_profile
#

# Disable echo output
[[ -t 0 ]] && stty -echo

export BASH_ENV_DIR="${HOME}/.bash"
export BASH_ENV_DIR_PROFILE_D="${BASH_ENV_DIR}/profile.d"

# Source profile(s)
[[ -t 0 ]] && echo -en "Loading...\\r"
for FILE in $(find -L "${BASH_ENV_DIR_PROFILE_D}" -maxdepth 1 -name '[0-9][0-9]-*' -type f | sort); do
    . "${FILE}"
done; unset FILE

# Re-enable echo output
[[ -t 0 ]] && stty echo

BASH_PROFILE_LOADED="1"

# vim: set syntax=sh filetype=sh ts=4 sw=4 tw=0 et :
