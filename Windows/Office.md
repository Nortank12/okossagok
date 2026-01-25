## Office letöltés és aktiválás
1. [Töltsd le](https://c2rsetup.officeapps.live.com/c2r/download.aspx?ProductreleaseID=O365ProPlusRetail&platform=x64&language=hu-hu&version=O16GA) és telepítsd. ([Más verziók](https://massgrave.dev/office_c2r_links#hungarian-hu-hu))
2. Nyisd meg a PowerShell-t.
3. Másold be és futtasd az alábbi scriptet.
   ```powershell
   & ([ScriptBlock]::Create((curl.exe -s --doh-url https://1.1.1.1/dns-query https://get.activated.win | Out-String))) /Ohook
   ```
