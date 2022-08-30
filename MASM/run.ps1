
# note : if you want to run this script you have to enable powershell scripting in your computer
# run powershell as admin then type ==> set-executionpolicy remotesigned

# file_name : target assembly file witout path or .format
param (
  [parameter(Mandatory=$false)] [String]$file_name
)

# check if file name is exist or not
if($file_name){

    # after check start compiling
    cd ./$file_name
    dir
    Write-Host( "[compile] $file_name.asm ...") -ForegroundColor green ;
    ml /c /Zd /coff "$file_name.asm"

    # after compiling start linking
    Write-Host( "[link]    $file_name.obj ...") -ForegroundColor yellow ;
    link "$file_name.obj" /subsystem:console

    # after compiling and linking exe file should be ready to open
    Write-Host( "[execute] $file_name.exe ...") -ForegroundColor cyan ; 
    Invoke-Item "$file_name.exe"

    cd ../
} 
else{ # if file name not exist

    Write-Host("[error] missing file name .") -ForegroundColor red ; 

}