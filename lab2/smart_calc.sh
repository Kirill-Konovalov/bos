
help() {
    echo "Use: $0 [-h] [-v] [-o file] -a| -s| -m| -p| -d number1 number2"
    echo " "
    echo "Options:"
    echo "  -h Show help"
    echo "  -v Datailed conclusion"
    echo "  -o file Write result in file"
    echo "  -a Addition"
    echo "  -s Substruction"
    echo "  -m Multiplication"
    echo "  -p Exponention"
    echo "  -d Division"
}

verbose=0

while getopts "hvo:asmpd" opt; do
    case "$opt" in 
        h) 
            help
            exit 0
            ;;
        v)
            verbose=1
            ;;
        o)
            output="$OPTARG"
            ;;
        a|m|s|p|d)
            operation="$opt"
            ;;
        \?)
            echo "Error" >& 2
            help >&2
            exit 1
            ;;
    esac
done

num1="$2"
num2="$3"

case "$num1" in ''|[!0-9-]*)
    echo "Error"
    exit 1
    ;;
esac
    
case "$num2" in ''|[!0-9-]*)
    echo "Error"
    exit 1
    ;;
esac


case "$operation" in 
    a)
        result=$((num1+num2))
        symbol="+"
        ;;
    m)
        result=$((num1*num2))
        symbol="*"
        ;;
    s)
        result=$((num1-num2))
        symbol="-"
        ;;
    p)
        if [ "$num2" -lt 0 ]; then
            echo "Error"
            exit 1
        fi
        result=$((num1 ** num2))
        symbol="**"
        ;;
    d)
        if [ "$num2" -eq 0 ]; then
            echo "Error"
            exit 1
        fi
        result=$((num1/num2))
        symbol="/"
        ;;
    *)
        echo "Error, choose operation" >&2
        exit 1
        ;;
    esac

    if [ "$verbose" -eq 1 ]; then
        message="$num1 $symbol $num2 = $result"
    else
        message="$result"
    fi

    if [ -n "$output" ]; then
        echo "$message" > "$output"
    else
        echo "$message"
    fi
