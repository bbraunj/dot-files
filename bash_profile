if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# User specific aliases and functions
set -o vi

# Scratch Pad Easy Access
alias vi="nvim"
alias vim="nvim"

# Other aliases
# alias ls="ls -G"
alias ls="ls --color"
alias lh="ls -lh"
alias la="ls -a"
alias fvi="vi +NERDTreeToggle"

export GREP_OPTIONS='--color=always'

# SSH Shortcuts
alias cee="ssh ceesrv02 2> /dev/null"
alias ceebs="ssh -t ceesrv02 'cee-lan-status -b' 2> /dev/null"
alias ceecs="ssh -t ceesrv02 'cee-lan-status -c' 2> /dev/null"
alias cees="ssh -t ceesrv02 'cee-lan-status' 2> /dev/null"
alias ceec007="ssh cee-compute007 2> /dev/null"
alias ceec008="ssh cee-compute008 2> /dev/null"
alias ceec010="ssh cee-compute010 2> /dev/null"
alias ceec012="ssh cee-compute012 2> /dev/null"
alias ceec021="ssh cee-compute021 2> /dev/null"
alias ceec024="ssh cee-compute024 2> /dev/null"
alias ceeb012="ssh cee-build012 2> /dev/null"
alias ceeb013="ssh cee-build013 2> /dev/null"
alias ceeb014="ssh cee-build014 2> /dev/null"
alias ceeb015="ssh cee-build015 2> /dev/null"

alias chama="ssh chama 2> /dev/null"
alias cortado="ssh cortado 2> /dev/null"
alias eclipse="ssh eclipse 2> /dev/null"
alias serrano="ssh serrano 2> /dev/null"
alias skybridge="ssh skybridge 2> /dev/null"
alias waterman="ssh waterman 2> /dev/null"

# SFTP Shortcuts
alias fcee="sftp ceesrv02"
alias fchama="sftp chamandia"
alias fcortado="sftp cortado"
alias feclipse="sftp eclipse"
alias fserrano="sftp serrano"
alias fskybridge="sftp skybridge"
alias fwaterman="sftp waterman"

# Source these scripts
source ~/.local/bin/bashmarks.sh
source ~/.git-completion.bash
source ~/.git-prompt.sh

# Trilinos toolchain environment variables
export TOOLCHAIN_ROOT="/Users/${USER}/toolchain"
export TOOLCHAIN_SRC="${TOOLCHAIN_ROOT}/src"
export TOOLCHAIN_BUILD="${TOOLCHAIN_ROOT}/build"
export TOOLCHAIN_INSTALL="${TOOLCHAIN_ROOT}/inst"
# export LAPACK_ROOT="/usr/local/Cellar/lapack/3.8.0_2"
# export LAPACK_LIB="${LAPACK_ROOT}/lib/liblapack.dylib"
# export BLAS_LIB="${LAPACK_ROOT}/lib/libblas.dylib"
export BOOST_ROOT="/usr/local/Cellar/boost/1.70.0"
export HDF5_ROOT="${TOOLCHAIN_INSTALL}/hdf5-1.10.1"
export NETCDF_ROOT="${TOOLCHAIN_INSTALL}/netcdf-4.7.0"

# PATH Additions
export PATH='~/.nvim/bin':$PATH
export PATH='/usr/local/Cellar/gcc/9.1.0/bin':$PATH
export PATH='/usr/local/Cellar/open-mpi/4.0.1_1/bin':$PATH
export PATH='/usr/local/Cellar/cmake/3.15.1/bin':$PATH
export PATH="${HDF5_ROOT}/bin:${PATH}"
export PATH="${TOOLCHAIN_INSTALL}/pnetcdf-1.11.2/bin:${PATH}"
export PATH="${NETCDF_ROOT}/bin:${PATH}"
export PATH="${TOOLCHAIN_INSTALL}/parmetis-4.0.3/bin:${PATH}"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="~/Documents/scripts/:$PATH"

# DYLD_LIBRARY_PATH Additions
export DYLD_LIBRARY_PATH="/usr/local/Cellar/gcc/9.1.0/libexec:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="/usr/local/Cellar/gcc/9.1.0/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="/usr/local/Cellar/open-mpi/4.0.1_1/lib:${DYLD_LIBRARY_PATH}"
# export DYLD_LIBRARY_PATH="${LAPACK_ROOT}/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="/usr/local/Cellar/boost/1.70.0/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="/usr/local/Cellar/zlib/1.2.11/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="${HDF5_ROOT}/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="${TOOLCHAIN_INSTALL}/pnetcdf-1.11.2/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="${NETCDF_ROOT}/lib:${DYLD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="${TOOLCHAIN_INSTALL}/parmetis-4.0.3/lib:${DYLD_LIBRARY_PATH}"

# ----------------------
# 	FUNCTIONS
# ----------------------
function promptCommand
{
	branchName=$(__git_ps1)
	tooLong=$(($(tput cols) / 3))		  
	PS1=''
	# PS1='\n\[$(printf "%*s" $(($(tput cols) - 20)) "" | sed "s/ /─/g") \d \t\r\h: \w \]\n'
	if [ ${#branchName} -ge $tooLong ]
	then
		export PS1=$PS1'\[\e[0;32m\]$(__git_ps1 "(%s)")\n\[\e[0;37m\][\#] \W \[\e[0;36m\]\u \[\e[0;37m\]\$ '
	else
		export PS1=$PS1'\[\e[0;37m\][\#] \W\[\e[0;32m\]$(__git_ps1) \[\e[0;36m\]\u \[\e[0;37m\]\$ '
	fi
}
PROMPT_COMMAND=promptCommand

##
# Your previous /Users/josbrau/.bash_profile file was backed up as /Users/josbrau/.bash_profile.macports-saved_2019-07-30_at_08:29:23
##

# MacPorts Installer addition on 2019-07-30_at_08:29:23: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/bbraunj/.anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/bbraunj/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/bbraunj/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/bbraunj/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export HOMEBREW_GITHUB_API_TOKEN=5ae41f07ddfb60749124d145a0a6d8a7f3bb5800
