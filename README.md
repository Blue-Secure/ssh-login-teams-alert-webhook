## Alert via Teams when user logon via SSH

Work on all popular linux system (Debian, Ubuntu, Arch Linux etc..)

HIGHLY inspired by https://github.com/MyTheValentinus/ssh-login-alert-telegram

### Requirement
- curl
- git (much easy to install)

### Install
1) Clone or download to /opt/ folder
```cd /opt/ && git clone https://github.com/Blue-Secure/ssh-login-teams-alert-webhook```

2) Edit configuration variable by editing credentials.config, its just the Webhook URL given by MS Teams:
```vim credentials.config```

3) Add this script when user connect with the deploy script:
```bash deploy.sh```

4) Confirm that the script is working by logging you to ssh again.