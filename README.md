# Check and Install — v2.0

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

A simple and interactive **Bash script** that checks if a Linux tool is installed and installs it if missing.  
Supports both **command-line arguments** and **interactive prompts**, with logging for errors and output.  
Perfect for beginners, Linux users, or anyone practicing automation and DevOps basics.

---

## Features

- Command-line argument support with interactive fallback  
- Checks if a tool is already installed using `command -v`  
- Automatically installs missing tools using `apt`  
- Updates package lists once at startup for efficiency  
- Logs actions and errors to `toolinstall.log` and `toolinstall_errors.log`  
- Clear intro, versioning, and exit option (`exit` / `Exit`)  
- Prevents checking the script itself  
- Simple, interactive, and slightly humorous with variables like `letmegohome` and `jobdone`  

---

## Usage

1. Make the script executable:

```bash
chmod +x doihaveit.sh
```

2. Run with a tool as an argument:
``` bash
./doihaveit.sh curl
```

3. Or run interactively (no argument):
``` bash
./doihaveit.sh
```
4. Enter the name of the tool when prompted. The script will:
- Check if the tool is installed
- Install it if missing
- Log all actions and errors

## Example
``` bash
$ ./doihaveit.sh
Check and Install Tool Script
------------------------------
Version 2.0

This script will check for the existance of a tool and install it if it is not found.

What is the tool you need: curl
curl is already installed
```

``` bash
$ ./doihaveit.sh curl
Check and Install Tool Script
------------------------------
Version 2.0

This script will check for the existance of a tool and install it if it is not found.

curl is already installed
```
## Logs
- `toolinstall.log` – normal output from updates and installs
- `toolinstall_errors.log` – errors encountered during installation

## Requirements
- Ubuntu/Debian-based Linux system
- Bash shell
- `sudo` privileges for installing packages

## Notes
- Fun Easter egg variables (letmegohome, jobdone) add personality to the script
- Forms a solid foundation for future enhancements like multi-tool installs or CI automation
