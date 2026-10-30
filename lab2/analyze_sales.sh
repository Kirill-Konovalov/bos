#!/bin/bash

FORMAT_CSV=0
GEN_SQL=0
CSV_FILE=""


while [[ "$#" -gt 0 ]]; do
    case $1 in
        -f)
            if [ "$2" = "csv" ]; then
                FORMAT_CSV=1
                shift 2
            else
                echo "Error" >&2
                exit 1
            fi
            ;;
        -g)
            GEN_SQL=1
            shift
            ;;
        *)
            CSV_FILE="$1"
            shift
            ;;
    esac
done


if [ -z "$CSV_FILE" ]; then
    echo "Use: $0 [-f csv] [-g] <csv_file>" >&2
    exit 1
fi


if [ ! -f "$CSV_FILE" ]; then
    echo "Error" >&2
    exit 1
fi


read total avg max_val < <(tail -n +2 "$CSV_FILE" | awk -F, '{
    sum += $2;
    count++;
    if (NR == 1 || $2 > max) max = $2;
} END {
    if (count > 0) print sum, sum/count, max; else print 0, 0, 0;
}')


if [ "$GEN_SQL" -eq 1 ]; then 
    SQL_FILE="import_sales.sql"
    {
        echo "CREATE TABLE IF NOT EXISTS sales_report ("
        echo "  metric VARCHAR(50),"
        echo "  value NUMERIC"
        echo ");"
        echo ""
        echo "INSERT INTO sales_report (metric, value) VALUES"
        echo "  ('Total Sales', $total),"
        echo "  ('Average Sale', $avg),"
        echo "  ('Max Sale', $max_val);"
    } > "$SQL_FILE"
    exit 0
fi


if [ "$FORMAT_CSV" -eq 1 ]; then
    REPORT_CSV="sales_report.csv"
    {
        echo "Metric, Value"
        echo "Total Sales, $total"
        echo "Average Sale, $avg"
        echo "Max Sale, $max_val"
    } | tee "$REPORT_CSV"
    exit 0
fi

{
    echo "Report: "
    echo "1) Total sales: $total"
    echo "2) Average sale: $avg"
    echo "3) Max sale: $max_val"
} | tee sales_report.txt
