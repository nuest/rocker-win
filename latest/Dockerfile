FROM microsoft/windowsservercore:ltsc2016

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /

# flexibly allow security protocols, see https://stackoverflow.com/questions/51208896/
RUN [Net.ServicePointManager]::SecurityProtocol = 'Ssl3', 'Tls12' ;\
    (Invoke-WebRequest -Uri 'https://cloud.r-project.org/bin/windows/base/release.htm' -UseBasicParsing).Content -match '.*URL=(?<version>.*)\">' | out-null ;\
    Write (-join('https://cloud.r-project.org/bin/windows/base/', $matches['version'])) ;\
    Invoke-WebRequest -Uri (-join('https://cloud.r-project.org/bin/windows/base/', $matches['version'])) -OutFile .\R-win.exe

# Download hash then validate downloaded file
RUN [Net.ServicePointManager]::SecurityProtocol = 'Ssl3', 'Tls12' ;\
    (Invoke-WebRequest -Uri 'https://cloud.r-project.org/bin/windows/base/md5sum.txt' -UseBasicParsing).Content -match'(?<hash>.*) ' ;\
    $HASH = $matches['hash'] ;\
    Write-Debug $HASH ;\
    if ( (Get-FileHash -Path .\R-win.exe -Algorithm MD5).hash -ne $HASH ) { Write-Warning 'hash mismatch for downloaded file, stopping.'; exit 1 }

# For options see https://cloud.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-check-an-installation_003f
RUN Start-Process .\R-win.exe -ArgumentList '/SILENT /DIR="c:\R"' -Wait ;\
    Remove-Item .\R-win.exe -Force

# Add R.exe to PATH
RUN $rPath = 'C:\R\bin' ;\
		$newPath = ('{0};{1}' -f $rPath, $Env:PATH) ;\
		setx /M PATH $newPath

# Set CRAN mirror
RUN Add-Content c:\R\etc\Rprofile.site 'options(repos = c(CRAN = \"https://cloud.r-project.org/\"))'

# From https://github.com/StefanScherer/dockerfiles-windows/blob/master/chocolatey/Dockerfile
ENV chocolateyUseWindowsCompression false
RUN iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'));\
    choco feature disable --name showDownloadProgress
# Install a CLI text editor
RUN choco install micro -y

# Metadata http://label-schema.org/rc1/
LABEL maintainer="Daniel Nüst <https://nordholmen.net>" \
  org.label-schema.url="https://github.com/nuest/rocker-win" \
  org.label-schema.name="rocker-win" \
  org.label-schema.description="R in Windows Containers" \
  org.label-schema.docker.schema-version="rc1"

CMD ["R.exe"]
