
# # OSが対応しているSSL/TSLのバージョン確認
# [enum]::GetNames([Net.SecurityProtocolType])

# 設定されているSSL/TSLのバージョン確認
Write-Host "変更前のSSL/TSLのバージョン"
[Net.ServicePointManager]::SecurityProtocol

# Tls11, Tls12 対応へ変更
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12

# 設定されているSSL/TSLのバージョン確認
Write-Host "変更後のSSL/TSLのバージョン"
[Net.ServicePointManager]::SecurityProtocol


# winrmの接続を許可
wget https://github.com/ansible/ansible/raw/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemotingForAnsible.ps1
.\ConfigureRemotingForAnsible.ps1

#コンフィグを削除
Remove-Item .\ConfigureRemotingForAnsible.ps1

# HTTPを許可する
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

# HTTPを許可したかの確認
winrm get winrm/config/service

#コンフィグを削除
Remove-Item .\ansible_win_start_shell.ps1

Write-Host "完了です。終了するには何かキーを押してください..."
$host.UI.RawUI.ReadKey()