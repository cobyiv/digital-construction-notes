@echo off
echo starting commit...
set /P title=Enter commit description:
git add --all
git commit -m "%title%"
git push
echo coding-notes %title% commit has completed successfully!
timeout /t 3