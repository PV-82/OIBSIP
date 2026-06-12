# Task 2: Basic Firewall Configuration with UFW

**Internship:** OIBSIP – Security Analyst Internship  
**Task Level:** Beginner  
**Author:** C S Parvathavardhini 


## Objective
Set up a basic firewall using UFW on a Linux system, configure it to allow SSH and deny HTTP traffic.

## Tools Used
- UFW (Uncomplicated Firewall) 0.36.2
- Ubuntu (GitHub Codespaces)

## Installation
```bash
sudo apt install ufw -y
```

## Commands Used

### 1. Check initial status
```bash
sudo ufw status
```

### 2. Enable UFW
```bash
sudo ufw enable
```

### 3. Allow SSH
```bash
sudo ufw allow ssh
```

### 4. Deny HTTP
```bash
sudo ufw deny http
```

### 5. Verify rules
```bash
sudo ufw status verbose
```

## Firewall Rules Summary

| Rule | Port | Protocol | Action | Reason |
|------|------|----------|--------|--------|
| SSH | 22 | TCP | ALLOW | Remote access needed |
| HTTP | 80 | TCP | DENY | Unencrypted traffic blocked |

## Security Explanation
- **Why allow SSH?** SSH provides encrypted remote access. Blocking it would lock us out of the system.
- **Why deny HTTP?** HTTP transmits data in plaintext, making it vulnerable to MITM attacks. HTTPS should be used instead.
- **UFW** simplifies iptables management, making firewall configuration accessible without deep networking knowledge.

## References
- https://help.ubuntu.com/community/UFW
- NIST SP 800-41 Guidelines on Firewalls and Firewall Policy
