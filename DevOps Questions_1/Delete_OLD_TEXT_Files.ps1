# NOTE: No SQL Server is installed on my machine, so I have created a 
#		Powershell Script to delete all those text files which are older than 7 days

# Set the directory path to the backup folder
$directory = "D:\Backup"

# Get the current date and subtract 7 days
$cutOffDate = (Get-Date).AddDays(-7)

# Get a list of all text files in the directory that are older than 7 days
$oldFiles = Get-ChildItem -Path $directory -Filter *.txt | Where-Object {$_.LastWriteTime -lt ($cutOffDate)}

# Delete each of the old files
foreach ($file in $oldFiles) {
    Remove-Item $file.FullName
}
