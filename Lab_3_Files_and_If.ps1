<#

purpose: 3rd powershell lab. practices use of:





Arthor:  Chajed
file:    Lab3spring2020.ps1
Date:    Febuary 20,2020

#>

clear-host
cd $env:USERPROFILE

get-childitem -filter *.txt| Format-Table name, length



$String1 = @"
What do you want to do?
    1. Write a contact entry to a file
    2. Display all files last written to after a given date
    3. Read a specified text file
"@
echo $String1


$Answer = Read-Host "Type in either 1, 2, or 3"

If ($Answer -eq "1") {
    'Item 1 chosen'
    $name = Read-host "What is your full name?"
    $phone = Read-host "What is your phone number?"
    $email = Read-host "What is your email?"
    $file = Read-host "What is the name of the file"
    $name, $phone, $email, $file > c:\Users\Chajed\Desktop\files_and_if.txt
    }
ElseIf ($Answer -eq "2") {
    'Item 2 chosen'
    $Date = Read-host "Earliest date of files to display: "
    Get-ChildItem -Path C:\Users\chajed| Where-Object {$_.LastWriteTime -ge "$Date"}| Sort-Object lastwritetime| Format-Table name, lastwritetime
    }
ElseIf ($Answer -eq "3") {
    'Item 3 chosen'
    $FileName = Read-host "What is the name of the file?"
    $Exist = Test-Path $FileName
    If ($Exist -eq "True"){
        Get-Content -Path $FileName}
    Else {
        Write-Host "This File does not exist."}
}
Else {
    'Error'}
