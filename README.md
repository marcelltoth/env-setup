# MTLT Environment Setup

## Basic Setup

Windows 2004+
Latest updates
Language EN


### Install Chocolatey

```powershell
Set-ExecutionPolicy Bypass -Scope Process
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

Install Office 365 from the website

#### Development

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
choco install docker-desktop
choco install git.install --params "/NoShellIntegration /NoAutoCrlf"
choco install visualstudio2019community --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US" --execution-timeout=7200
choco install winscp jetbrains-rider dotcover dottrace dotmemory dotpeek webstorm lightshot dotnetcore dotnetcore-sdk azure-functions-core-tools ssms vscode vscode-gitignore vscode-prettier vscode-yaml vscode-chrome-debug vscode-eslint vscode-docker vscode-csharp nodejs virtualbox postman fiddler python3 python2 resharper
```

Set WinSCP to read ini file from OneDrive:

- Options/Preferences
- Storage -> Custom INI file
- _C:\Users\marce\OneDrive\WinSCP.ini_

Finish Docker WSL 2 tutorial: https://docs.docker.com/docker-for-windows/wsl-tech-preview/

Trust the dev-cert:
```powershell
certutil -addstore -enterprise -f "Root" C:\Users\marce\OneDrive\CertificateStore\root.pem
```



#### Multimedia

```powershell
choco install reaper obs spotify tidal vlc
```

## WSL 2

### Main feature

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Install WSL from [the Store](https://aka.ms/wslstorepage)

Restart

```powershell
wsl --set-default-version 2
wsl --install -d Ubuntu
```

Launch Ubuntu and perform initialization. Use username `marcelltoth`.

### Terminal

Update Windows Terminal from the Store, set Ubuntu as the default.


### WSLg

Install the graphics driver as described here: https://docs.microsoft.com/en-us/windows/wsl/tutorials/gui-apps

Reboot, install `x11-apps` and try to run `xclock`.


### Install basic linux utilities

Open a terminal session.
```sh
sudo apt update
sudo apt upgrade
sudo apt install vim git git-lfs build-essential libssl-dev curl wget -y
sudo apt install libgtk-3-0 libgtk-3-dev
```


### Set wsl options

```sh
sudo vim /etc/wsl.conf
```

Apply ./etc/wsl.conf

#### Resolve.conf

The options above remove automatic resolve.conf generation (that may end up passing you IPv6 resolutions WSL can't currently handle), meaning you need to create one manually.

```sh
sudo rm /etc/resolv.conf
```

Apply ./etc/resolv.conf


Limit memory usage:
Apply USERPROFILE/.wslconfig to %USERPROFILE%/.wslconfig

Reboot.

### Download this repo to WSL

This step is needed to make files avialable.
```sh
cd ~
mkdir source
```
```sh
cd ~/source
git clone https://github.com/marcelltoth/env-setup.git
cd env-setup
```

### Set up SSH keys

```sh
ssh-keygen -t rsa -b 4096 -C "marcell@marcelltoth.net"
```

Upload public key to GitHub.

There is no need to explicitly set up `ssh-agent` as the ZSH configuration will take care of that.

### Install ZSH

```sh
sudo apt install zsh
chsh -s $(which zsh)
```
Log out and in.
Verify by `$SHELL --version`.


### Install NVM & node

Install NVM as per [instructions on its github](https://github.com/nvm-sh/nvm#installing-and-updating)

Install Node LTS:
```sh
nvm install --lts
nvm use --lts
```

### Install Oh-My-Zsh

```sh
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp ~/source/env-setup/home/.zfunctions -r ~
cd ~/.zfunctions
ln -s async.zsh async
ln -s pure.zsh prompt_pure_setup
cp ~/source/env-setup/home/.dircolors ~
```

Apply /home/.zshrc

Reload shell.

Install [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting):
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install JetBrains Toolbox

```sh
sudo apt install libnss3 libxcursor1 libasound2 libatk1.0-0 libatk-bridge2.0-0 libxcb-keysyms1 libxss1 libpangocairo-1.0-0 libcups2
curl https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | sudo bash
```

Launch MobaXterm.

Launch the toolbox with the command alias `jetbrains`.

Install Webstorm and/or other required tools.

### Install Yarn

```sh
npm i -g yarn
```

Log in to npm:
```sh
npm login
```

### Set up Git username & email
```sh
git config --global user.name "Marcell Toth"
git config --global user.email "marcell@marcelltoth.net"
```

Set email separately in repos if desired.

### Set up Git GPG signing

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

Log in to the JetBrains account
