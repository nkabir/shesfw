export PROJECT_NAME="Project Name"
export SHORT_NAME="project"
export PROJECT_VERSION="0.000"
export CONFIG_PATH="/etc"

# Your project configuration file
export CONFIG_FILE="./conf/project.conf"
#export CONFIG_FILE=$CONFIG_PATH/$SHORT_NAME.conf

# Default log file, if you don't want it just use /dev/null
#export LOG_FILE="/var/log/$SHORT_NAME.log"
export LOG_FILE="/dev/null"

# Your project application path
export APP_DEFAULT_DIR=$(pwd)
#export APP_DEFAULT_DIR="$(get_config DefaultDir)"

# Project profile for each user
export PROJECT_PROFILE=~/.$SHORT_NAME

# Include project common functions
source $APP_DEFAULT_DIR/commonfuncs.sh
# Include project interface functions
source $APP_DEFAULT_DIR/$(get_config Interface)_interface.sh

export TEMPROOT=$(get_config DefaultTempDir)

trap "print_error \"SIGTERM received\" exit" SIGTERM
