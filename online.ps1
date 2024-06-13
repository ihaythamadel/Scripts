Set-ExecutionPolicy RemoteSigned -Scope Process -Force

Get-AppXPackage WindowsStore -AllUsers  Foreach {Add-AppxPackage -DisableDevelopmentMode -Register $($_.InstallLocation)AppXManifest.xml}

$progressPreference = 'silentlyContinue'
Write-Information Downloading WinGet and its dependencies...
Invoke-WebRequest -Uri httpsaka.msgetwinget -OutFile $envProgramDataMicrosoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri httpsaka.msMicrosoft.VCLibs.x64.14.00.Desktop.appx -OutFile $envProgramDataMicrosoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri httpsgithub.commicrosoftmicrosoft-ui-xamlreleasesdownloadv2.8.6Microsoft.UI.Xaml.2.8.x64.appx -OutFile $envProgramDataMicrosoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage $envProgramDataMicrosoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage $envProgramDataMicrosoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage $envProgramDataMicrosoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
