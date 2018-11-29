1. graph.ps1 (by LOKESH NIRANIA):
    Windows:
        (i)  execute '.\graph.ps1' in powershell
        (ii) if it shows error, execute first 'Set-Execution-Policy Unrestricted' in powershell admin mode and then execute (i)
        NOTE:- this code will only work when 'pdflatex' along with 'dos2unix' is installed in 'wsl' 
                pdflatex: sudo apt install texlive-full
                dos2unix: sudo apt install dos2unix
    Linux:
        (i)   replace 'wsl pdflatex ....' with 'pdflatex ....'
        (ii)  remove 'dos2unix ....' line
        (iii) replace '.\graph.pdf' with 'evince graph.pdf'
        NOTE :- powershell should be installed in linux
                powershell: sudo apt install powershell
2. graph_2.0.ps1 (by LOKESH NIRANIA):
    This is an update version of 'graph.ps1'
    Follow instruction described for 'graph.ps1'

