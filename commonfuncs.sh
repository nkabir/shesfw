function init()
{
	write_log "Starting $PROJECT_NAME"
	[ -z "$0" ] && { usage; exit 2; }
	touch $PROJECT_PROFILE
	[ -e $TEMPROOT ] || mkdir -p $TEMPROOT
	export TEMP_DIR=$(mktemp -d "$TEMPROOT"/"$SHORT_NAME"XXXXXX)
}

function finish()
{
	write_log "Terminating $PROJECT_NAME"
	rm -rf "$TEMP_DIR"
	exit $1
}

function write_log()
{
	echo $(date -R)$1 >> $LOG_FILE
}

function usage()
{
	echo use:$(basename $0) -\[xzh\];
	cat << [PROJECT_CONFIG]
Use example: project
Options:
  -x, Xxx xxxx xxx
  -z, ZZzzzzzz zzz zzzz 
  -h, Show this help
[PROJECT_CONFIG]
}

function get_config()
{
	grep $1 $CONFIG_FILE | grep -v "^#" | tr -s '\t' ' ' | cut -d' ' -f2
}

function use_profile()
{	
	source $PROJECT_PROFILE
}

function get_environment (){
	case $TERM in
	"dumb")
		echo Graphical
		;;
	"xterm")
		echo Text
		;;
	"linux")
		echo Text
		;;
	?)
		echo Text
		;;
	esac
}

function validate() {
	$1 || { print_error "$1 failed!" exit; }
}


