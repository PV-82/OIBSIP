# Task 4: Research Report on Common Network Security Threats

**Internship:** OIBSIP – Security Analyst Internship
**Task Level:** Beginner
**Author:** [Your Name]
**Student ID:** x24334715

---

## Introduction

Network security threats are malicious activities that target the confidentiality, integrity, or availability of data as it moves across or resides on a network. Understanding how these threats work is essential for any security analyst, as it forms the foundation for designing defenses, writing detection rules, and responding to incidents. This report covers three major categories of network security threats: Denial of Service (DoS) attacks, Man-in-the-Middle (MITM) attacks, and spoofing.

---

## 1. Denial of Service (DoS) Attacks

### How It Works
A DoS attack aims to make a system, service, or network resource unavailable to its intended users. This is typically achieved by overwhelming the target with excessive traffic or requests, exhausting its resources (CPU, memory, bandwidth, or connection pools) so legitimate requests cannot be processed.

A **Distributed Denial of Service (DDoS)** attack is a more severe variant where the traffic comes from many compromised machines (a botnet) simultaneously, making it harder to block by simply filtering one source IP.

Common techniques include:
- **Volumetric attacks** – flooding the network with traffic (e.g., UDP floods, ICMP floods)
- **Protocol attacks** – exploiting weaknesses in network protocols (e.g., SYN floods that exhaust the TCP connection table)
- **Application-layer attacks** – targeting specific applications with seemingly legitimate but excessive requests (e.g., HTTP floods)

### Impact
- Service downtime leading to lost revenue and customer trust
- Resource exhaustion on servers, firewalls, and load balancers
- Can be used as a smokescreen to distract security teams while another attack (such as data exfiltration) occurs

### Real-World Example
In 2016, the **Mirai botnet** compromised hundreds of thousands of IoT devices (cameras, routers) with default credentials and used them to launch a massive DDoS attack against DNS provider Dyn, taking down major websites including Twitter, Netflix, and Reddit for several hours.

### Mitigation
- Deploy **rate limiting** and traffic filtering at network edges
- Use **DDoS protection services** (e.g., Cloudflare, AWS Shield)
- Implement **SYN cookies** and connection limits to defend against protocol attacks
- Maintain **redundant infrastructure** and load balancing across multiple regions
- Monitor traffic baselines to detect anomalies early

---

## 2. Man-in-the-Middle (MITM) Attacks

### How It Works
In a MITM attack, an attacker secretly intercepts and possibly alters communication between two parties who believe they are communicating directly with each other. The attacker positions themselves between the victim and the legitimate service, capturing sensitive data such as login credentials, session tokens, or financial information.

Common techniques include:
- **ARP spoofing** – sending fake ARP messages to associate the attacker's MAC address with the IP address of a legitimate device on the LAN
- **DNS spoofing** – redirecting a victim to a malicious site by returning a fake DNS response
- **Rogue Wi-Fi access points** – setting up a fake Wi-Fi hotspot to capture traffic from connected devices
- **SSL stripping** – downgrading an HTTPS connection to HTTP to read traffic in plaintext

### Impact
- Theft of credentials, session cookies, and personal data
- Unauthorized access to accounts and systems
- Manipulation of data in transit (e.g., altering transaction details)

### Real-World Example
Public Wi-Fi networks at airports and cafes are commonly targeted. Attackers set up rogue access points with names similar to the legitimate network (e.g., "Airport_Free_WiFi"), and once a user connects, all unencrypted traffic can be intercepted and read.

### Mitigation
- Enforce **HTTPS/TLS** everywhere and use HSTS to prevent downgrade attacks
- Use **VPNs** when on untrusted networks
- Implement **certificate pinning** in mobile and web applications
- Enable **dynamic ARP inspection (DAI)** on switches to prevent ARP spoofing
- Use **DNSSEC** to authenticate DNS responses

---

## 3. Spoofing Attacks

### How It Works
Spoofing involves an attacker disguising themselves as a trusted entity to gain unauthorized access, deceive users, or bypass security controls. The attacker forges identifying information such as IP addresses, email headers, or MAC addresses.

Common types include:
- **IP spoofing** – forging the source IP address of packets to impersonate a trusted host or hide the attacker's identity, often used in DoS attacks
- **Email spoofing** – forging the "From" header of an email to make it appear as though it came from a trusted sender, commonly used in phishing
- **MAC spoofing** – changing a device's MAC address to bypass network access controls or impersonate another device
- **DNS spoofing** – covered above, but also classified as a spoofing technique

### Impact
- Bypassing IP-based access controls and firewalls
- Successful phishing campaigns due to forged sender addresses
- Unauthorized network access by impersonating trusted devices

### Real-World Example
Business Email Compromise (BEC) scams frequently use email spoofing, where attackers forge an executive's email address to trick employees into making fraudulent wire transfers. The FBI's IC3 has reported billions of dollars in losses globally from BEC scams.

### Mitigation
- Implement **SPF, DKIM, and DMARC** records to prevent email spoofing
- Use **ingress/egress filtering** on routers to block spoofed IP packets (BCP 38)
- Enable **port security** on switches to restrict MAC addresses per port
- Educate users to verify unusual requests through a secondary channel (e.g., phone call)

---

## Conclusion

DoS, MITM, and spoofing attacks each exploit different weaknesses, availability, confidentiality of communications, and trust in identity, but they share a common theme: attackers exploit gaps in verification and monitoring. A layered defense strategy combining encryption, authentication, network segmentation, monitoring, and user awareness significantly reduces the risk and impact of these threats. As a security analyst, recognizing the signatures of these attacks (e.g., sudden traffic spikes, unexpected ARP table changes, mismatched email headers) is critical for early detection and response.

---

## References

- OWASP – https://owasp.org/www-community/attacks/
- NIST SP 800-61 – Computer Security Incident Handling Guide
- Cloudflare Learning Center – https://www.cloudflare.com/learning/
- FBI Internet Crime Complaint Center (IC3) Annual Reports
- CISA Advisories – https://www.cisa.gov/news-events/cybersecurity-advisories
