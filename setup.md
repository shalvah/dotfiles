# Setting up a new PC

1. Sign in, set up, all that
2. Rename your user account. To do this:
   - enable the default admin account: `net user administrator /active:yes`
   - sign in as the Administrator
   - rename your user in `netplwiz`
   - rename the user folder
   - update the value of `HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\<your user SID>\ProfileImagePath`
   - restart, sign in as your user, disable administrator
   - Note: this might break Settings Search. An easy resolution is switching language.
3. Customise a few settings (pointer, font)
4. Use MS Edge to download Google Chrome
rename pc
5. Sign in to Chrome and download this zip 
6. uninstall crap like Microsoft Solitaire
Clone this with Git and sync profile (copy profile folder to Documents\WindowsPowerShell)
7. configure Windows Terminal. Copy the JSON file in the settings/ folder.
8. Port console history. It should be in  `C:\Users\shalvah\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt` (`Get-PSReadlineOption).HistorySavePath`)
9. Install PowerShell 7 if needed.
10. Port aws creds
11. Copy env vars/secrets for any projects
12. Port IDE and VsCode setttings with settings Sync
13. configure startup tasks, disable services
14. more settings (hibernate,  file explorer options, developer features, clipboard)
15. Port game data (Origin, GOG, Steam, Uplay, Epic Games)
16. Port save game data
17. Port game captures
