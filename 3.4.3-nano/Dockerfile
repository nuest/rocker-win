FROM microsoft/nanoserver

MAINTAINER Daniel Nüst <daniel.nuest@uni-muenster.de

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV R_VERSION 3.4.3
ENV R_INSTALLER_HASH 0ff087acbae677d7255af19b0a9df27f

WORKDIR /

# "latest" version redirect would be available via https://cloud.r-project.org/bin/windows/base/release.htm
RUN Invoke-WebRequest https://cloud.r-project.org/bin/windows/base/R-$env:R_VERSION-win.exe -OutFile .\R-win.exe

RUN if ( (Get-FileHash -Path .\R-win.exe -Algorithm MD5).hash -ne $env:R_INSTALLER_HASH ) { Write-Warning 'hash mismatch for downloaded file, stopping.'; exit 1 }

# For options see https://cloud.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-check-an-installation_003f
RUN Start-Process .\R-win.exe -ArgumentList '/SILENT /DIR="c:\R"' -Wait ; \
    Remove-Item .\R-win.exe -Force

# Add R.exe to PATH
RUN $rPath = 'C:\R\bin' ; \
	$newPath = ('{0};{1}' -f $rPath, $env:PATH); \
	setx /M PATH $newPath

# Set CRAN mirror
#RUN Add-Content c:\R\etc\Rprofile.site 'options(repos = c(CRAN = \"https://cloud.r-project.org/\"))'

# Install a CLI text editor
RUN Invoke-WebRequest https://github.com/zyedidia/micro/releases/download/v1.4.0/micro-1.4.0-win64.zip -OutFile .\micro.zip; \
    Expand-Archive -Path .\micro.zip -DestinationPath . -Force; \
    Remove-Item .\micro.zip -Force; \
    Rename-Item .\micro-1.4.0 .\micro; \
    $microPath = 'C:\micro' ; \
    $newPath = ('{0};{1}' -f $microPath, $env:PATH); \
    setx /M PATH $newPath

CMD ["R.exe"]
