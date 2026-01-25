## Windows 10/11 Automatikus aktiválás
1. Nyisd meg a PowerShell-t.
2. Másold be és futtasd az alábbi scriptet.
   ```powershell
   & ([ScriptBlock]::Create((curl.exe -s --doh-url https://1.1.1.1/dns-query https://get.activated.win | Out-String))) /HWID
   ```
