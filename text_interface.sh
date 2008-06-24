# This function prints error message. And if second arg is exit, exit from jopen
function print_error() {
echo $1 1>&2;
[ "$2" == "exit" ] && finish 1; 
}

function print_msg() {
echo -e "$1";
}

function get_entry() {
echo "$1";
read $2;
}

function get_list() {
echo "$2";
echo "$4";
read $1
}


progress()
{
read input;
printf "$1\n|";
while [ "${input:=0}" -lt 100 ]; do
	for i in $(seq $input); do
		printf "-";
	done;
	for i in $(seq $input); do
		printf "\r";
	done;
	read input;
done;
printf "\n"; 
}

interface_yesno() {
echo "$1"
read YESNO
YESNO=$(echo "$YESNO" | sed y/YES/yes/);
if [ "$YESNO" = yes ] || [ "$YESNO" = y ]; then
	return 0;
else
	return 1;
fi
}
