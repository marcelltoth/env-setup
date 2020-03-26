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
choco install firefox googlechrome notepadplusplus npppluginmanager 7zip javaruntime lastpass vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist140 qbittorrent slack teamviewer windirstat
```

Install Office 365 from the website

#### Development

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
choco install docker-desktop
choco install git.install --params "/NoShellIntegration /NoAutoCrlf"
choco install visualstudio2019community --package-parameters "--allWorkloads --includeRecommended --includeOptional --passive --locale en-US" --execution-timeout=7200
choco install filezilla  jetbrains-rider dotcover dottrace dotmemory dotpeek webstorm lightshot dotnetcore dotnetcore-sdk azure-functions-core-tools ssms vscode vscode-gitignore vscode-prettier vscode-yaml vscode-chrome-debug vscode-eslint vscode-docker vscode-csharp nodejs virtualbox postman fiddler python3 python2 resharper
```

Finish Docker WSL 2 tutorial: https://docs.docker.com/docker-for-windows/wsl-tech-preview/


#### Multimedia

```powershell
choco install reaper obs spotify tidal vlc
```

## WSL 2

### Main feature

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Restart

```powershell
wsl --set-default-version 2
```

Install Ubuntu from the Windows Store.
Launch Ubuntu and perform initialization. Use username `marcelltoth`.

### Terminal

```powershell
choco install microsoft-windows-terminal mobaxterm
```

Set up X11 in mobaxterm.
 - X11 Remote access -> full
Launch terminal, open settings.
Apply `WindowsTerminal/profiles.json`

### Install basic linux utilities

Open a terminal session.
```sh
sudo apt update
sudo apt upgrade
sudo apt install vim git git-lfs build-essential libssl-dev curl wget -y
git lfs install
```


### Set wsl options

```sh
sudo vim /etc/wsl.conf
```

Apply ./etc/wsl.conf

Set the mount point the other way, too:
```powershell
net use w: \\wsl$\Ubuntu-18.04 /persistent:yes
```
Run the same in a privileged PS
```powershell
net use w: \\wsl$\Ubuntu-18.04 /persistent:yes
```

Limit memory usage:
Apply USERPROFILE/.wslconfig to %USERPROFILE%/.wslconfig

Reboot.

### Download this repo to WSL

This step is needed to make files avialable.
```sh
cd ~
mkdir source
sudo ln -s ~/source /s
```
```sh
cd /s
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
cp /s/env-setup/home/.zfunctions -r ~
cd ~/.zfunctions
ln -s async.zsh async
ln -s pure.zsh prompt_pure_setup
cp /s/env-setup/home/.dircolors ~
```

Apply /home/.zshrc

Reload shell.

Install [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting):
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install JetBrains Toolbox

```
sudo apt install libnss3 libxcursor1 libasound2 libatk1.0 libatk-bridge2.0
curl https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | sudo bash
```

Launch MobaXterm.

Launch the toolbox with the command alias `jetbrains`.

Install Webstorm and/or other required tools.

### Install Yarn

```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```


## Backup

Currently Crashplan but switching to Backblaze?

Log in to the JetBrains account
