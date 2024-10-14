echo off

setlocal enabledelayedexpansion
set max=0
for %%x in (sas_plan.*) do (
  set "FN=%%x"
  set "FN=!FN:sas_plan.=!"
  if !FN! GTR !max! set max=!FN!
)
echo highest version: sas_plan.%max%


:python planParser.py problem1 sas_plan.%max%

python Script_python/planParser.py problem1

:pause
