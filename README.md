# let-me-go-home

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

A fun and interactive **Bash script** that checks if a Linux tool is installed and installs it automatically if missing. Perfect for beginners, Linux users, or anyone who wants a playful yet practical setup script.

---

## Features

- Checks if a tool is already installed using `command -v`  
- Automatically installs missing tools using `apt`  
- Logs actions and errors to `toolinstall.log` and `toolinstall_errors.log`  
- Handles empty input and prompts until a valid tool is entered  
- Simple, interactive, and slightly humorous with variables like `letmegohome` and `jobdone`  

---

## Usage
1. Make the script executable:

```bash
chmod +x let-me-go-home.sh
```
2. Run the script:
```bash
./let-me-go-home.sh
```
3. Enter the name of the tool you want to check/install when prompted.
4. The script will:
	- Tell you if the tool is already installed
	- Install it if it’s missing
	- Log all actions and errors

## Example
```bahs
$ ./let-me-go-home.sh
This Program will check and install a tool you need

What is the tool you need: curl
curl is already installed
```

## Logs
- `toolinstall.log` – contains all the normal output from updates and installs
- `toolinstall_errors.log` – contains errors encountered during installation

## Notes
- Designed for Ubuntu/Debian-based systems using apt.
- Requires sudo privileges for installing packages.
- Fun Easter egg variables (letmegohome, jobdone) add personality to the script.
