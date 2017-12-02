function applyHighPower {
  if($default_use_high_power_scheme) {
    Write-Host "setting power scheme to High performance..."
    powercfg /s $default_power_scheme
  }
}