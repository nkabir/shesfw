# This function prints error message. And if second arg is exit, exit from jopen
function print_error() {
zenity --error --text "$1";
[ "$2" == "exit" ] && finish 1; 
}

function print_msg() {
zenity --info --title "$PROJECT_NAME" --text "$1";
}

function get_entry() {
export $2=$(zenity --entry --text "$1");
}

function get_list() {
export $1=$(echo "$4" | zenity --list --text "$2" --column "$3");
}

function progress ()
{
	zenity --progress --title "$PROJECT_NAME" --text "$1";
}

interface_yesno() {
	if zenity --question --text "$1"; then
		return 0;
	else
		return 1;
	fi
}

