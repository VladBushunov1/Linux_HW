#!/bin/bash
log_file="access.log"
report_file="report.txt"

echo "Na russkom sosvsem ne hochet, izvinite, Otchet o loge web servera" >> $report_file
echo "=========================" >> $report_file

total_requests=$(wc -l < "$log_file")
echo "Obschee kolichestvo zaprosov:     $total_requests" >> $report_file

unique_ips=$(awk '{print $1}' "$log_file" | sort | uniq | wc -l)
echo "Kolichestvo unikalnih IP-addresov:       $unique_ips" >> $report_file

echo "Kolichestvo zaprosov po metodam:" >> $report_file
awk '{print $6}' "$log_file" | tr -d '"' | sort | uniq -c | sort -nr >> $report_file

popular_url=$(awk '{print $7}' "$log_file" | sort | uniq -c | sort -nr | head -n 1)
echo "Samiy popularniy URL: $popular_url" >> $report_file

echo "Analys zavershen. Otchet sohranen v $report_file."
