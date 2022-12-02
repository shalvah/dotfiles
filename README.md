# dotfiles

PowerShell scripts I use for setting up and configuring my Windows machine(s)

Powered by:

- chocolatey to automate most installations
- oh-my-posh and posh-git for configuring my PowerShell
- PowerShell and Windows Registry for uninstalling and configuring other stuff

Before running these scripts the PowerShell script execution policy needs to be changed:

```powershell
Set-ExecutionPolicy Bypass
```

Note: running these scripts as-is may not work (especially for the `configure-` scripts), for instance, due to PATH updates and approval prompts. You may need to copy and paste some commands at a time.

When done, copy the contents of the `profile` folder to `C:\Users\shalvah\Documents\PowerShell` (PowerShell 7)
