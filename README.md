# MTLT Environment Setup

## Basic Setup

Windows 11
Latest updates
Language EN


### Install Chocolatey

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
choco install firefox googlechrome notepadplusplus npppluginmanager 7zip javaruntime bitwarden vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist140 qbittorrent slack teamviewer windirstat
```

#### Multimedia (optional)

```powershell
choco install reaper obs spotify tidal vlc
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

```
choco install git.install --params "/NoShellIntegration /NoAutoCrlf"
choco install jetbrainstoolbox dotnet dotnet-sdk azure-functions-core-tools ssms vscode vscode-gitignore vscode-prettier vscode-yaml vscode-chrome-debug vscode-eslint vscode-docker vscode-csharp nodejs postman fiddler python3 python2
```

Start Jetbrains Toolbox, log in, then install the desired tools.

## MSYS2

### Main feature

```powershell
choco install msys2
```

#### Terminal

Add this config to the Windows Terminal settings.

```json

            {
                "commandline": "C:/msys64/msys2_shell.cmd -defterm -here -no-start -ucrt64 -use-full-path",
                "font": 
                {
                    "face": "Cascadia Code",
                    "size": 11.0,
                    "weight": "normal"
                },
                "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
                "icon": "C:/msys64/ucrt64.ico",
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
cp ~/env-setup/home/.zfunctions -r ~
cd ~/.zfunctions
ln -s async.zsh async
ln -s pure.zsh prompt_pure_setup
cp ~/env-setup/home/.dircolors ~
```

Install [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting):
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Apply /home/.zshrc

Reload shell.


### Set up SSH keys

```sh
ssh-keygen -t rsa -b 4096 -C "marcell@marcelltoth.net"
```

Upload public key to GitHub.

There is no need to explicitly set up `ssh-agent` as the ZSH configuration will take care of that.


### Set up Git username & email
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
