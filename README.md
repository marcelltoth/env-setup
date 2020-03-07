# MTLT Environment Setup

## Basic Setup

Windows 2004+
Latest updates
Language EN


### Install Chocolatey

```
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

``` 
	choco install firefox googlechrome notepadplusplus npppluginmanager 7zip javaruntime lastpass vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist140 qbittorrent slack teamviewer windirstat
```

Install Office 365 from the website

#### Development

```
	choco install docker-desktop --pre  # as long as the WSL 2 backend is in development
	choco install git.install --params "/NoShellIntegration /NoAutoCrlf"
	choco install filezilla  jetbrains-rider dotcover dottrace dotmemory dotpeek webstorm lightshot dotnetcore dotnetcore-sdk azure-functions-core-tools ssms vscode vscode-gitignore vscode-prettier vscode-yaml vscode-chrome-debug vscode-eslint vscode-docker vscode-csharp nodejs virtualbox postman fiddler python3 python2 visualstudio2019community resharper
```

Finish Docker WSL 2 tutorial: https://docs.docker.com/docker-for-windows/wsl-tech-preview/


#### Multimedia

```
	choco install reaper obs spotify tidal vlc
```

## WSL 2

### Main feature

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Restart

```
wsl --set-default-version 2
```

Install Ubuntu from the Windows Store.
Launch Ubuntu and perform initialization. Use username `marcelltoth`.

### Terminal

```
choco install microsoft-windows-terminal mobaxterm
```

Set up X11 in mobaxterm.
 - X11 Remote access -> full
Launch terminal, open settings.
Apply `WindowsTerminal/profiles.json`

### Install basic linux utilities

Open a terminal session.
```
sudo apt update
sudo apt upgrade
sudo apt install vim git build-essential libssl-dev curl wget -y
git lfs install
```

Install NVM as per https://github.com/nvm-sh/nvm#installing-and-updating


### Set wsl options

vim /etc/wsl.conf

```
[automount]
root = /
```

Set the mount point the other way, too:
```
net use w: \\wsl$\Ubuntu /persistent:yes
```
Run the same in a privileged PS
```
net use w: \\wsl$\Ubuntu /persistent:yes
```

## Backup

Currently Crashplan but switching to Backblaze?

