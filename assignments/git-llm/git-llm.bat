@echo off
setlocal enabledelayedexpansion

REM Path to your XML file
set XML_PATH=prompts.xml

REM Get random prompt from the XML file
for /f "tokens=2 delims=<>" %%a in ('findstr /i "<message>" %XML_PATH%') do (
    set /a rand=!random! %% 3 + 1
    set message=%%a
)

REM Git commit with the selected message
git commit -m "!message!"
