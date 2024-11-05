B
# MTLT Environment Setup

## Basic Setup

Windows 11
Latest updates
Language EN


### Install Chocolatey

In an admin-powershell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco feature enable -n allowGlobalConfirmation
```

### Install driver manager

Whatever comes with the laptop

### Set up cloud

Log into OneDrive, sync it

### Install basic software

#### Basic tools

```powershell
choco install googlechrome notepadplusplus npppluginmanager 7zip bitwarden qbittorrent slack teamviewer windirstat
```

#### Multimedia (optional)

```powershell
choco install reaper obs spotify tidal vlc ffmpeg
```

#### Manual setup

Install Office 365 from the website

Finish Windows Updates

### Development

#### WSL

This is needed for Docker Desktop even if not used directly.

```powershell
wsl --install
```

Reboot.

Wait for the prompt to come up, and set the username as `marcelltoth`.

#### Docker

```powershell
choco install docker-desktop
```

Reboot.

Open Docker Desktop, accept terms.

#### Install NVM & node

Install NVM Windows per [instructions on its github](https://github.com/coreybutler/nvm-windows)

Install Node LTS. This may need to be ran in a non-elevated shell window. NVM handles UAC requests automatically.
```sh
nvm install lts
nvm use lts
```
Let's install Yarn, and log into NPM.
```sh
npm i -g yarn
npm login
```

#### Windows-native development tools

Install Git for Windows. Use the following:
  - Editor: Vim
  - Branch name: as you wish
  - PATH: Git from the command line and also from 3rd-party
  - SSH executable: Use external OpenSSH
  - HTTPS transport backend: Use the native Windows Secure Channel library
  - Autocrlf: Checkout as-is, commit as-is
  - Terminal: Use MinTTY
  - Pull behavior: Only ever fast-forward
  - Credential helper: GitCM
  - Extra: FS Cache

```
choco install postman python3 python2
```

Start Jetbrains Toolbox, log in, then install the desired tools.

## MSYS2

### Main feature

```powershell
choco install msys2
```

Create a `source` folder under Windows home.

#### Terminal

Add this config to the Windows Terminal settings.

```json

            {
                "commandline": "C:/tools/msys64/msys2_shell.cmd -defterm -here -no-start -ucrt64 -use-full-path -where C:/Users/marce/source",
                "font": 
                {
                    "face": "Cascadia Code",
                    "size": 11.0,
                    "weight": "normal"
                },
                "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
                "icon": "C:/tools/msys64/ucrt64.ico",
                "name": "MSYS2 / UCRT64"
            },
```

### Install ZSH

```sh
pacman -Syu
pacman -S zsh
```

Append `-shell zsh` to the command line above, and open a new shell window. 

If the install was correct, you should see the ZSH configuration prompt. You can pick `(q)` because we are going to override.

### Install Oh-My-Zsh

```sh
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/marcelltoth/env-setup
cp ~/env-setup/home/.dircolors ~
```

Install [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting):
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

_Note: Last time I tried, the above was making the terminal super slow. If so, simply remove it from the plugins list when applying .zshrc_

Apply /home/.zshrc

Reload shell.


### Set up SSH keys

```sh
ssh-keygen -t ed25519 -b 4096 -C "marcell@marcelltoth.net"
```

Upload public key to GitHub.

Let's now enable the Windows OpenSSH key agent, and add the key.

Admin PS:
```powershell
Get-Service -Name ssh-agent | Set-Service -StartupType Automatic
Start-Service ssh-agent
```

In a normal Bash window:
```bash
ssh-add path-to-the-private-key
```

### (Optional) Set up global Git username & email
```sh
git config --global user.name "Marcell Toth"
git config --global user.email "marcell@marcelltoth.net"
```

Set email separately in repos if desired.

### Set up Git GPG signing - optional

Generate a key for `marcell@marcelltoth.net` with no passphrase.
```sh
echo 'export GPG_TTY=$(tty)' >> ~/.profile
export GPG_TTY=$(tty)
gpg --gen-key
```
Connect it with Git:
```sh
gpg --list-secret-keys --keyid-format LONG
git config --global user.signingkey KEYABCDEF
git config --global commit.gpgsign true
```

Export it and upload it to GitHub:
```sh
gpg --armor --export marcell@marcelltoth.net
```

## Backup

Install Backblaze per its official docs, and pick the "Inherit backup state" to inherit from the old computer.
