#!/bin/bash

echo "========================================"
echo "        SERVER PERFORMANCE STATS        "
echo "========================================"

echo "💻 Hostname : $(hostname)"
echo "📆 Date: $(date)"
echo "🕑 Uptime : $(uptime -p)"


echo ""
echo "==============="
echo "Total CPU Usage"
echo "==============="

IDLE_CPU=$(top -bn1 | grep '%Cpu(s)' | awk -F',' '{print $4}' | awk -F' ' '{print $1}' | cut -d. -f1)

TOTAL_CPU_USE=$((100-IDLE_CPU))

echo "Total Cpu Use = ${TOTAL_CPU_USE}%"

echo ""
echo "=================="
echo "Total memory usage"
echo "=================="

free -h

MEM_TOTAL=$(free | awk '/Mem:/ {print $2}')
MEM_USE=$(free | awk '/Mem:/ {print $3}')
MEM_FREE=$(free | awk '/Mem:/ {print $4}')
MEM_USE_PERCENT=$((MEM_USE * 100 / MEM_TOTAL))

echo "Total Memory : $((MEM_TOTAL / 1024))MB"
echo "Use Memory : $((MEM_USE / 1024))MB"
echo "Use Memory Percent : $((MEM_USE_PERCENT))%"
echo "Free Memory : $((MEM_FREE / 1024))MB"