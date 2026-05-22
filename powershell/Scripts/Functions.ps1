function mkdir { New-Item -ItemType Directory -Force -Path $args }

function which($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Source -ErrorAction SilentlyContinue
}

function head {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [int]$n = 10
    )
    Get-Content $Path | Select-Object -First $n
}

function tail {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Path,
        [int]$n = 10
    )
    Get-Content $Path | Select-Object -Last $n
}
