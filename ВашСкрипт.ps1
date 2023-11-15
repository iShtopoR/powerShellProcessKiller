# -*- coding: utf-8 -*-

$processName = "ИмяПроцесса"  # Замените на имя вашего процесса

Write-Host "Запущен мониторинг старта процесса $processName"

while ($true) {
    Start-Sleep -Seconds 5  # Пауза в секундах, чтобы не нагружать систему

    $runningProcesses = Get-Process | Where-Object { $_.ProcessName -eq $processName }

    if ($runningProcesses.Count -gt 0) {
        $date = Get-Date
        Write-Host "[$date]Процесс $processName запущен. Завершение..."
        Stop-Process -Name $processName -Force
    }else{
        # Write-Host "[$date]Процесс $processName еще не запущен."
    }
}
