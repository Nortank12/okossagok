## Windows Optimalizálás ([felesleges dolgok](https://github.com/Raphire/Win11Debloat/wiki/Default-Settings#default-tweaks) eltávolítása)

1. Nyisd meg a PowerShell-t.
2. Másold be és futtasd az alábbi scriptek egyikét.
    - ### Programok eltávolítása nélkül
    ```powershell
    & ([ScriptBlock]::Create((curl.exe -sL --doh-url https://1.1.1.1/dns-query https://debloat.raphi.re/ | Out-String))) -RunDefaultsLite -Silent
    ```

    - ### [Programok](https://github.com/Raphire/Win11Debloat/wiki/Default-Settings#default-app-selection) eltávolításával együtt
    ```powershell
    & ([ScriptBlock]::Create((curl.exe -sL --doh-url https://1.1.1.1/dns-query https://debloat.raphi.re/ | Out-String))) -RunDefaults -Silent
    ```
