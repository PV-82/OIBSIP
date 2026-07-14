# Task 8: Capture Network Traffic with Wireshark (tshark)

**Internship:** OIBSIP – Security Analyst Internship
**Task Level:** Intermediate
**Author:** Parvathavardhini C S


## Objective
Capture and analyse live network traffic using tshark (Wireshark CLI), apply filters to isolate specific protocols, and document findings with security observations.

## Tools Used
- tshark 4.x (Wireshark CLI — used because Wireshark GUI is not available in Codespaces)
- DVWA running on Docker (localhost:80)
- Ubuntu (GitHub Codespaces)

## Installation
```bash
sudo apt update && sudo apt install tshark -y
```
> Note: When prompted "Should non-superusers be able to capture packets?" select Yes.

## List Available Interfaces
```bash
sudo tshark -D
```
Key interfaces found:
- `eth0` — main network interface
- `lo` — loopback (captures localhost traffic)
- `docker0` — Docker bridge network

## Capture Command
```bash
sudo tshark -i lo -a duration:120 -w wireshark_capture.pcap
```
- `-i lo` — capture on loopback interface (where DVWA traffic flows)
- `-a duration:120` — auto-stop after 120 seconds
- `-w` — write to pcap file

## Traffic Generated During Capture
```bash
curl http://localhost/login.php
curl http://localhost/
curl http://localhost/robots.txt
curl http://localhost/config/
```

## Analysis — Filter Results

### HTTP Traffic Filter
```bash
sudo tshark -r wireshark_capture.pcap -Y "http" 2>/dev/null
```
HTTP requests and responses captured between curl client and DVWA Apache server on localhost.

### DNS Traffic Filter
```bash
sudo tshark -r wireshark_capture.pcap -Y "dns" 2>/dev/null
```
DNS queries observed:
- `api.github.com` — Codespaces communicating with GitHub API
- `mobile.events.data.microsoft.com` — VS Code telemetry
- `main.vscode-cdn.net` — VS Code extension downloads
- `uksouth.online.visualstudio.com` — VS Code services

### TCP Traffic — 3-Way Handshake
```bash
sudo tshark -r wireshark_capture.pcap -Y "tcp.flags.syn==1 or (tcp.flags.syn==1 and tcp.flags.ack==1) or (tcp.flags.ack==1 and tcp.len==0)" 2>/dev/null
```
TCP ACK packets confirmed between 127.0.0.1:41662 and 127.0.0.1:35747, showing the full connection lifecycle:
- **SYN** — client initiates connection
- **SYN-ACK** — server acknowledges
- **ACK** — client confirms, connection established

### Unencrypted HTTP Data Observed
TCP port 80 traffic captured in plaintext, including:
- HTTP GET requests to `/login.php`, `/robots.txt`, `/config/`
- Server response headers revealing: `Apache/2.4.25 (Debian)`
- Session cookies transmitted without encryption: `PHPSESSID`, `security=low`
- Full HTML page source visible in packet payload

## Why Unencrypted HTTP is Dangerous
When traffic is sent over HTTP (port 80), all data travels as plaintext across the network. Anyone with access to the network path (a router, switch, or another device on the same network segment) can use a tool like Wireshark to capture and read the full contents of every request and response, including usernames, passwords, session cookies, and sensitive page content.

## How HTTPS Prevents This
HTTPS encrypts all traffic using TLS (Transport Layer Security). Even if an attacker captures the packets, they see only encrypted ciphertext, making the contents unreadable without the private key. HTTPS also authenticates the server via certificates, preventing MITM attacks.

## Glossary
- **Packet** — a small unit of data transmitted over a network; large messages are broken into packets and reassembled at the destination
- **Protocol** — a set of rules defining how data is formatted and transmitted between devices (e.g., HTTP, TCP, DNS)
- **Port** — a numerical identifier (0–65535) that specifies which application or service on a device should receive incoming data
- **Payload** — the actual data content carried within a packet, as opposed to the headers which contain routing and control information
- **Handshake** — an automated negotiation process between two devices to establish a connection; TCP uses a 3-step handshake (SYN, SYN-ACK, ACK)

## Ethics Note
Traffic capture was performed exclusively on localhost (loopback interface) within a private GitHub Codespace. No external or shared network traffic was captured or analysed.

## References
- Wireshark User Guide: https://wireshark.org/docs/wsug_html_chunked/
- tshark man page: https://www.wireshark.org/docs/man-pages/tshark.html
- OWASP — Transport Layer Protection Cheat Sheet
