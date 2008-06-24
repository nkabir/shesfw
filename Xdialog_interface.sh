# This function prints error message. And if second arg is exit, exit from jopen
function print_error() {
Xdialog --infobox "$1" 5 50;
[ "$2" == "exit" ] && finish 1; 
}

function print_msg() {
Xdialog --infobox "$1";
}

function get_entry() {
export $2=$(Xdialog --editbox "$1" 5 50);
}

function get_list() {
for prog in $4; do
	TEMP_P="$TEMP_P $prog $prog"
done
export $1="$(Xdialog --menubox "$2" 15 25 25 $TEMP_P 2>&1 | grep -v WARNING)";
echo SAIDA $ACTION
}


interface_yesno() {
	if Xdialog --yesno "$1" 5 50; then
		return 0;
	else
		return 1;
	fi
}

