<powershell>

Start-Transcript -Path "C:\ProgramData\Amazon\EC2-Windows\Launch\Log\UserDataLog.log" -Append -Force

$command = "C:\BluePrism\BPAutoInstall\appserver\setup.ps1"
$task = @{
    TaskName = 'systemconfig'
    Action   = New-ScheduledTaskAction -Execute PowerShell.exe -Argument "-NoProfile -NonInteractive -WindowsStyle Hidden -File $command"
    Trigger  = New-ScheduledTaskTrigger -AtStartup
    principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount -RunLevel Highest
}

Register-ScheduledTask @task

Start-BitsTransfer -Source 'https://blueprismconfigrepo.s3.amazonaws.com/BluePrism.zip' -Destination C:\
Expand-Archive -LiteralPath 'C:\BluePrism.zip' -DestinationPath C:\

$domain_joined = (Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain
if($domain_joined -eq $false) {
Add-Computer -DomainName ${domain} -Credential (New-Object -Type PSCredential -Argument ${username}, (ConvertTo-SecureString "${adpass}" -AsPlainText -Force)) -OUPath "${ou}" -NewName "${shorthostname}"
Write-Output "Domain join Complete"
Restart-Computer -Force

}

else {
    Write-Output "Computer is already joined to domain"
    
   
}

$BP = "Blue Prism"
$installed = (Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -eq $BP }) -ne $null

If(-Not $installed) {


C:\BluePrism\BPAutoInstall\appserver\install.ps1
#Start-Sleep -Seconds 600
gpupdate /force

}

else {
    Write-Output "$BP is already installed."

    #Set SPN
    psexec.exe -i -u "${username}" -p "${adpass}" -h cmd /c "powershell -noninteractive -file C:\BluePrism\BPAutoInstall\appserver\spnconfig.ps1"

}

</powershell>
<persist>true</persist>