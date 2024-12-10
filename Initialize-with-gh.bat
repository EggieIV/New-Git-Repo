@echo on
for %%* in (.) do set CurrDir=%%~n*
for /f "tokens=*" %%i in ('gh api user -q ".login"') do set GITHUB_USERNAME=%%i
git init
gh repo create %CurrDir% --public
git remote add origin https://github.com/%GITHUB_USERNAME%/%CurrDir%.git
echo MIT License > LICENSE
echo. >> LICENSE
echo Copyright ^(c^) %date:~10,4% %CurrDir% >> LICENSE
echo. >> LICENSE
echo Permission is hereby granted, free of charge, to any person obtaining a copy >> LICENSE
echo of this software and associated documentation files ^(the "Software"^), to deal >> LICENSE
echo in the Software without restriction, including without limitation the rights >> LICENSE
echo to use, copy, modify, merge, publish, distribute, sublicense, and/or sell >> LICENSE
echo copies of the Software, and to permit persons to whom the Software is >> LICENSE
echo furnished to do so, subject to the following conditions: >> LICENSE
echo. >> LICENSE
echo The above copyright notice and this permission notice shall be included in all >> LICENSE
echo copies or substantial portions of the Software. >> LICENSE
echo. >> LICENSE
echo THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR >> LICENSE
echo IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, >> LICENSE
echo FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE >> LICENSE
echo AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER >> LICENSE
echo LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, >> LICENSE
echo OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE >> LICENSE
echo SOFTWARE. >> LICENSE
echo # %CurrDir% > README.md
echo. >> README.md
echo This is the %CurrDir% repository. >> README.md
echo. >> README.md
echo ## Description >> README.md
echo This script initializes a new Git repository, creates a corresponding repository on GitHub, adds an MIT license, and pushes the initial commit. >> README.md
echo. >> README.md
echo ## License >> README.md
echo This project is licensed under the MIT License - see the LICENSE file for details. >> README.md
echo. >> README.md
echo ## Disclaimers >> README.md
echo To install GitHub CLI (gh), follow these steps: >> README.md
echo 1. Visit the GitHub CLI installation page: https://cli.github.com/ >> README.md
echo 2. Download and install the appropriate version for your operating system. >> README.md
echo 3. Authenticate the GitHub CLI with your GitHub account by running: >> README.md
echo    gh auth login >> README.md
echo. >> README.md
echo To verify deletion rights for the GitHub CLI session, run: >> README.md
echo    gh auth refresh -h github.com -s delete_repo >> README.md
echo Initialize-with-gh.ps1 > .gitignore
echo Git_commands/ >> .gitignore
mkdir Git_commands
echo @echo on > Git_commands\pull.bat
echo git pull origin main >> Git_commands\pull.bat
echo pause >> Git_commands\pull.bat
echo @echo on > Git_commands\merge.bat
echo set /p branch="Enter the branch name to merge: " >> Git_commands\merge.bat
echo git merge %branch% >> Git_commands\merge.bat
echo pause >> Git_commands\merge.bat
echo @echo on > Git_commands\push.bat
echo git push origin main >> Git_commands\push.bat
echo pause >> Git_commands\push.bat
echo @echo on > Git_commands\status.bat
echo git status >> Git_commands\status.bat
echo pause >> Git_commands\status.bat
echo @echo on > Git_commands\add_commit_push.bat
echo git pull origin main >> Git_commands\add_commit_push.bat
echo git add . >> Git_commands\add_commit_push.bat
echo set /p message="Enter the commit message: " >> Git_commands\add_commit_push.bat
echo git commit -m "%message%" >> Git_commands\add_commit_push.bat
echo git push origin main >> Git_commands\add_commit_push.bat
echo pause >> Git_commands\add_commit_push.bat
echo @echo on > Git_commands\merge_into_main.bat
echo git checkout dev >> Git_commands\merge_into_main.bat
echo git pull origin dev >> Git_commands\merge_into_main.bat
echo git checkout main >> Git_commands\merge_into_main.bat
echo git pull origin main >> Git_commands\merge_into_main.bat
echo git merge dev >> Git_commands\merge_into_main.bat
echo git push origin main >> Git_commands\merge_into_main.bat
echo pause >> Git_commands\merge_into_main.bat
echo @echo off > Git_commands\DELETE_REPO.bat_disabled
echo gh repo delete %GITHUB_USERNAME%/%CurrDir% --yes >> Git_commands\DELETE_REPO.bat_disabled
echo git remote remove origin >> Git_commands\DELETE_REPO.bat_disabled
echo rmdir /s /q .git >> Git_commands\DELETE_REPO.bat_disabled
echo del ..\LICENSE >> Git_commands\DELETE_REPO.bat_disabled
echo del ..\README.md >> Git_commands\DELETE_REPO.bat_disabled
echo del ..\.gitignore >> Git_commands\DELETE_REPO.bat_disabled
echo del ..\Initialize-with-gh.ps1 >> Git_commands\DELETE_REPO.bat_disabled
echo del add_commit_push.bat >> Git_commands\DELETE_REPO.bat_disabled
echo del merge.bat >> Git_commands\DELETE_REPO.bat_disabled
echo del merge_into_main.bat >> Git_commands\DELETE_REPO.bat_disabled
echo del pull.bat >> Git_commands\DELETE_REPO.bat_disabled
echo del push.bat >> Git_commands\DELETE_REPO.bat_disabled
echo del status.bat >> Git_commands\DELETE_REPO.bat_disabled
echo del /s /q Git_commands\* >> Git_commands\DELETE_REPO.bat_disabled
echo rmdir /s /q Git_commands >> Git_commands\DELETE_REPO.bat_disabled
echo pause >> Git_commands\DELETE_REPO.bat_disabled
echo del %~f0 >> Git_commands\DELETE_REPO.bat_disabled
git add .
git commit -m "Initial commit with MIT license and README"
git branch -M main
git push -u origin main
git checkout -b dev
gh api -X PATCH repos/%GITHUB_USERNAME%/%CurrDir% -f license_template=mit
pause
del %~f0
