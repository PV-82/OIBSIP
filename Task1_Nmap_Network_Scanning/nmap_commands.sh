#!/bin/bash
# OIBSIP Task 1 – Nmap Scanning Script
# Author: [Your Name] | Student ID: x24334715

TARGET="127.0.0.1"
echo "=== OIBSIP Task 1: Nmap Network Scan ==="
echo "Target: $TARGET | Date: $(date)"
echo ""

echo "[1] Basic Scan"
nmap $TARGET

echo "[2] Service + Version Detection"
sudo nmap -sS -sV $TARGET

echo "[3] Full Scan with OS Detection – saving to file"
sudo nmap -sS -sV -O $TARGET -oN nmap_scan_results.txt

echo "Done. Results saved to nmap_scan_results.txt"
