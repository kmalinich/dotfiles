# ~/.bashrc
#

_validate_before_source() {
    # Return if not running interactively
    [[ $- != *i* ]] && return

	# Load bash profile if not loaded
	[[ -z "${BASH_PROFILE_LOADED}" ]] && SOURCE="${HOME}/.bash_profile"

	[[ -r "${SOURCE}" ]] && . "${SOURCE}"
	# [[ -n "${BASH_PROFILE_LOADED}" ]] && unset BASH_PROFILE_LOADED
}

_validate_before_source

# Source any possible global bashrc(s) under /etc
# ARRAY_SOURCE_GLOBAL=(bash.bashrc bashrc)
# for FILE in "${ARRAY_SOURCE_GLOBAL[@]}"; do
# 	FILE="/etc/${FILE}"
# 	[[ -f "${FILE}" ]] && . "${FILE}"
# done; unset FILE

# Build array of files under ~/.kdm/rc.d and source them
mapfile -t ARRAY_SOURCE_RC_D < <(ls -h1 "${BASH_ENV_DIR_RC_D}/"* 2> /dev/null)
for FILE in "${ARRAY_SOURCE_RC_D[@]}"; do
	. "${FILE}"
done; unset FILE


# vim: set syntax=sh filetype=sh ts=4 sw=4 tw=0 noet :
