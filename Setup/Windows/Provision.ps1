# ------------------------------------------------------------
# Client provisioing script
# ------------------------------------------------------------

# ------------------------------------------------------------
# Initialiation, set up variables
# ------------------------------------------------------------
Push-Location . 

# ------------------------------------------------------------
# Install Chocolatey
# ------------------------------------------------------------
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# ------------------------------------------------------------
# Install the standard tools used on client devices
# ------------------------------------------------------------
choco install git keepass

# ------------------------------------------------------------
# Download the client scripts
# ------------------------------------------------------------
$DepClientFolder = "$env:userprofile\DEP"
mkdir $DepClientFolder
Set-Loccation $DepClientFolder
git clone https://github.com/deptechnician/Client.git

# ------------------------------------------------------------
# Install the realvnc instant help disposable app
# ------------------------------------------------------------
$InstantHelp = "$DepClientFolder\RealvncInstantHelp.exe"
Invoke-WebRequest -Uri https://static.realvnc.help/generic/1.0.3/Instant-support.exe -OutFile $InstantHelp

# ------------------------------------------------------------
# Return to the state we started
# ------------------------------------------------------------
Pop-Location

