# -*- coding: utf-8 -*-

$processName = "ИмяПроцесса"  # Замените на имя вашего процесса
$logPath = "C:\Путь\К\Логу\KillProcess.log"  # Замените на путь к лог-файлу

while ($true) {
    Start-Sleep -Seconds 5  # Пауза в секундах, чтобы не нагружать систему

    $runningProcesses = Get-Process | Where-Object { $_.ProcessName -eq $processName }

    if ($runningProcesses.Count -gt 0) {
        $date = Get-Date
        $logEntry = "Процесс $processName запущен. Завершение... [$date]"
        Write-Host $logEntry
        Add-Content -Path $logPath -Value $logEntry
        Stop-Process -Name $processName -Force
    }
}
