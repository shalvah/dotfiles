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
3. Customise a few settings (cursor, font)
4. Use MS Edge to download Google Chrome
rename pc
5. Sign in to Chrome and download this zip 
6. uninstall crap like Microsoft Solitaire
Clone this with Git and sync profile
7. configure cmder
8. Port console history. It should be in  `C:\Users\shalvah\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt` (`Get-PSReadlineOption).HistorySavePath`)
Port aws creds
Copy env vars for any projects
# Port game data (Origin, Steam, Uplay, GOG, )
# Port IDE and VsCode setttings. For VSCode, copy settings.json and keybindings.json from C:\Users\shalvah\AppData\Roaming\Code\User, or use Settings Sync
configure startup tasks, disable services
more settings (hibernate,  file explorer options, developer features)