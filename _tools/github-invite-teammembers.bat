@echo off
setlocal EnableExtensions

rem ------------------------------------------------------------
rem Invite multiple people by e-mail to a GitHub organization
rem and assign them to a team.
rem
rem Usage:   github-invite.bat ORG TEAM [emails.txt] [role]
rem Example: github-invite.bat my-org backend-developers emails.txt direct_member
rem          github-invite.bat my-org 1234567
rem TEAM can be the team slug (e.g. backend-developers) or the numeric ID.
rem
rem emails.txt: one e-mail address per line, lines starting
rem with # are ignored.
rem role: direct_member (default), admin or billing_manager
rem
rem Requirements: GitHub CLI (gh), logged in with a token that
rem has the admin:org scope:  gh auth login --scopes admin:org
rem Find team IDs with:  gh api /orgs/ORG/teams --jq ".[] | [.id,.slug] | @tsv"
rem ------------------------------------------------------------

if "%~2"=="" (
    echo Usage: %~nx0 ORG TEAM [emails.txt] [role]
    echo   TEAM = team slug or numeric team ID
    exit /b 1
)

set "ORG=%~1"
set "TEAM_ID=%~2"
set "FILE=%~3"
if "%FILE%"=="" set "FILE=emails.txt"
set "ROLE=%~4"
if "%ROLE%"=="" set "ROLE=direct_member"

where gh >nul 2>&1
if errorlevel 1 (
    echo GitHub CLI "gh" was not found. Install it from https://cli.github.com/
    exit /b 1
)

if not exist "%FILE%" (
    echo File "%FILE%" not found.
    exit /b 1
)

rem If TEAM_ID is not numeric, treat it as a team slug and look up the ID
echo %TEAM_ID%| findstr /r "^[0-9][0-9]*$" >nul
if errorlevel 1 call :resolve_team
if not defined TEAM_ID (
    echo Could not find team "%~2" in organization "%ORG%".
    exit /b 1
)
echo Using team ID %TEAM_ID%

set /a OK=0
set /a FAIL=0

for /f "usebackq eol=# tokens=* delims=" %%M in ("%FILE%") do (
    echo Inviting %%M ...
    gh api -X POST "/orgs/%ORG%/invitations" -f "email=%%M" -f "role=%ROLE%" -F "team_ids[]=%TEAM_ID%" >nul
    if errorlevel 1 (
        echo   FAILED: %%M
        set /a FAIL+=1
    ) else (
        echo   OK: %%M
        set /a OK+=1
    )
    timeout /t 1 /nobreak >nul
)

echo.
echo Done. Successful: %OK%  Failed: %FAIL%
endlocal
exit /b 0

:resolve_team
set "SLUG=%TEAM_ID%"
set "TEAM_ID="
for /f "delims=" %%I in ('gh api "/orgs/%ORG%/teams/%SLUG%" --jq .id 2^>nul') do set "TEAM_ID=%%I"
exit /b 0