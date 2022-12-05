Write-Output "Testing connection to servers"

$ServerList = "tower", "gitlab"

foreach ($Server in $ServerList) {
  Write-Output " - Ensuring $Server is reachable: "
  [console]::setcursorposition($([console]::Cursorleft + 50),$([console]::CursorTop - 1))

  if (Test-Connection -ComputerName $Server -Count 2 -Quiet ) {
    Write-Output "    [OK]"
  } else {
    Write-Output "    [FAIL]"
  }
}