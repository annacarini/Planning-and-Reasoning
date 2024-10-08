echo off

setlocal enabledelayedexpansion
set max=0
for %%x in (sas_plan.*) do (
  set "FN=%%x"
  set "FN=!FN:sas_plan.=!"
  if !FN! GTR !max! set max=!FN!
)
echo highest version: sas_plan.%max%

python ../planParser.py problem3.txt sas_plan.%max%

