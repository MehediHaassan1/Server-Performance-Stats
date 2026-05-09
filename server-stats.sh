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