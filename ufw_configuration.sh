#!/bin/bash
# OIBSIP Task 2 – UFW Firewall Configuration
# Author: [Your Name] | Student ID: x24334715

echo "=== OIBSIP Task 2: UFW Firewall Configuration ==="
echo "Date: $(date)"
echo ""

echo "[1] Installing UFW..."
sudo apt install ufw -y

echo "[2] Checking initial status..."
sudo ufw status

echo "[3] Enabling UFW..."
sudo ufw enable

echo "[4] Allowing SSH..."
sudo ufw allow ssh

echo "[5] Denying HTTP..."
sudo ufw deny http

echo "[6] Final firewall status..."
sudo ufw status verbose

echo "Done. Firewall configured successfully."
