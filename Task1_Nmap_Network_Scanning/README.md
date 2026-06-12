# Task 1: Basic Network Scanning with Nmap

**Internship:** OIBSIP – Security Analyst Internship  
**Task Level:** Beginner  
**Author:** C S Parvathavardhini 


## Objective
Perform a network scan to identify open ports and services using Nmap, and document findings with security significance of each port.

## Tools Used
- Nmap 7.94+
- Ubuntu (GitHub Codespaces)

## Installation
```bash
sudo apt update && sudo apt install nmap -y
nmap --version
```

## Scan Commands Used

### 1. Basic Scan
```bash
nmap 127.0.0.1
```

### 2. Service & Version Detection
```bash
sudo nmap -sS -sV 127.0.0.1
```

### 3. Full Scan with OS Detection (saved to file)
```bash
sudo nmap -sS -sV -O 127.0.0.1 -oN nmap_scan_results.txt
```

## Port Analysis

| Port | Service | Risk | Mitigation |
|------|---------|------|-----------|
| 22/tcp | SSH | Medium – brute force risk | Use key-based auth, disable root login |
| 80/tcp | HTTP | Medium – unencrypted traffic | Redirect to HTTPS |
| 3306/tcp | MySQL | High – direct DB exposure | Bind to localhost only |

## Key Findings
- Database ports should never be exposed externally
- SSH on default port 22 is a common attack target
- HTTP traffic is unencrypted and vulnerable to MITM attacks

## References
- https://nmap.org/docs.html
- NIST SP 800-115 Technical Guide to Information Security Testing
