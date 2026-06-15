# Task 5: Research Report on Social Engineering Attacks

**Internship:** OIBSIP – Security Analyst Internship
**Task Level:** Beginner
**Author:** C S Parvathavardhini

---

## Introduction

Social engineering is the use of psychological manipulation to trick people into divulging confidential information, granting access, or performing actions that compromise security. Unlike technical exploits that target software vulnerabilities, social engineering targets human behaviour, trust, fear, urgency, and curiosity, making it one of the most effective and widely used attack vectors. This report examines three common social engineering techniques: phishing, pretexting, and baiting, along with real-world case studies and prevention strategies.

---

## 1. Phishing

### How It Works
Phishing involves sending fraudulent communications, typically emails, but also SMS (smishing) or voice calls (vishing), that appear to come from a trusted source. The goal is to trick the recipient into clicking a malicious link, downloading malware, or revealing sensitive information such as login credentials or payment details.

Variants include:
- **Spear phishing** – highly targeted attacks aimed at a specific individual or organization, often using personal details to appear convincing
- **Whaling** – phishing targeted at senior executives (CEO, CFO)
- **Clone phishing** – duplicating a legitimate previously delivered email and replacing links/attachments with malicious ones

### Case Study
In 2016, an employee at a major US political organization received an email appearing to be a Google security alert asking them to change their password. The link led to a fake login page, and the credentials entered were captured by attackers, an example of spear phishing that led to a significant data breach with widespread political fallout.

### Impact
- Credential theft leading to account takeover
- Malware/ransomware delivery
- Financial fraud through fake invoices or payment redirection
- Reputational damage to organizations whose brand is spoofed

---

## 2. Pretexting

### How It Works
Pretexting involves creating a fabricated scenario (a "pretext") to engage a victim and extract information or gain access. The attacker often impersonates someone with authority or a legitimate need, such as an IT technician, auditor, bank representative, or new employee, to build trust before making a request.

Pretexting differs from phishing in that it usually involves more direct interaction (phone calls, in-person visits) and relies on building a believable backstory over time.

### Case Study
A well-documented case involved attackers calling a company's IT helpdesk pretending to be employees who had been locked out of their accounts. By providing publicly available information (name, department, employee ID format) gathered from LinkedIn, the attackers convinced helpdesk staff to reset passwords and provide access, bypassing normal verification procedures entirely.

### Impact
- Unauthorized access to systems and facilities
- Bypassing identity verification controls
- Often used as a precursor to further attacks (e.g., installing malware once inside)

---

## 3. Baiting

### How It Works
Baiting relies on offering something enticing to lure victims into a trap. The "bait" can be physical (a USB drive labeled "Confidential Salaries" left in a parking lot) or digital (a free download, fake software update, or too-good-to-be-true offer online). Once the victim interacts with the bait, malware is installed, or credentials are harvested.

### Case Study
In a widely cited penetration testing exercise, security researchers left USB drives labeled with enticing names in the parking lots and common areas of a target organization. A significant proportion of employees who found the drives plugged them into corporate computers, executing the embedded payload and demonstrating how curiosity can override security awareness.

### Impact
- Malware infections (including ransomware) entering otherwise secured networks
- Compromise of internal systems bypassing perimeter defenses
- Data exfiltration once initial access is established

---

## Why Social Engineering Works

Social engineering exploits fundamental human tendencies:
- **Authority** – people tend to comply with requests from perceived authority figures
- **Urgency/Fear** – creating time pressure ("your account will be locked in 24 hours") reduces critical thinking
- **Curiosity** – an unlabeled or intriguingly labeled item invites investigation
- **Trust and Familiarity** – impersonating colleagues, known brands, or familiar processes lowers suspicion
- **Reciprocity** – offering something "free" creates a sense of obligation to engage

---

## Prevention and Mitigation

### Technical Controls
- **Email filtering and anti-phishing gateways** to catch known malicious domains and attachments
- **Multi-factor authentication (MFA)** so stolen credentials alone are insufficient for access
- **DMARC/SPF/DKIM** to reduce email spoofing
- **USB port restrictions / device control policies** to prevent baiting via removable media
- **Endpoint detection and response (EDR)** to catch malware execution

### Administrative & Awareness Controls
- Regular **security awareness training** with simulated phishing campaigns
- Clear **verification procedures** for sensitive requests (e.g., callback verification for password resets or wire transfers)
- **Reporting culture** – employees should feel comfortable reporting suspicious emails or calls without fear of blame
- **Least privilege access** so that a single compromised account has limited impact

---

## Conclusion

Phishing, pretexting, and baiting all demonstrate that the human element remains one of the most exploited links in the security chain. While technical defenses are essential, they cannot fully compensate for a lack of awareness. Organizations need a combination of technical safeguards, well-defined verification processes, and continuous, realistic training to build a resilient "human firewall" against social engineering.

---

## References

- OWASP – https://owasp.org/www-community/attacks/
- Verizon Data Breach Investigations Report (DBIR), various years
- KnowBe4 – Social Engineering Resources
- CISA – Security Tip ST04-014: Avoiding Social Engineering and Phishing Attacks
- Mitnick, K. – "The Art of Deception"
