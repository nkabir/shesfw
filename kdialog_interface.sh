# This function prints error message. And if second arg is exit, exit from jopen
function print_error() {
kdialog --error "$1";
[ "$2" == "exit" ] && finish 1; 
}

function print_msg() {
kdialog --msgbox "$1";
}

function get_entry() {
export $2=$(kdialog --inputbox "$1");
}

function get_list() {
export $1=$(kdialog --combobox "$2" $(echo "$4"));
}

