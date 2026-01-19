. "$PSScriptRoot\Scripts\Aliases.ps1"
. "$PSScriptRoot\Scripts\Functions.ps1"

$env:Path += ";$env:USERPROFILE\.bin"

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$LOCALAPPDATA\starship\starship.toml"
$ENV:STARSHIP_CACHE = "$APPDATA\Temp"

fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression

Invoke-Expression (& { (zoxide init powershell | Out-String) })
Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
Set-Alias -Name cdi -Value __zoxide_zi -Option AllScope -Scope Global -Force

Import-Module PSReadLine

Set-PSReadLineOption -EditMode Vi -ViModeIndicator Cursor
Set-PSReadLineOption -ShowToolTips

# Key bindings
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete # Enhanced auto-completion
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Import-Module PSFzf
Set-PsFzfOption -EnableAliasFuzzyHistory
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PsFzfOption -TabExpansion

$ENV:FZF_DEFAULT_OPTS = "--height 40%"
$ENV:FZF_CTRL_T_COMMAND = $ENV:FZF_DEFAULT_OPTS

