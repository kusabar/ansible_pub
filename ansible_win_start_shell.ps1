
# # OS���Ή����Ă���SSL/TSL�̃o�[�W�����m�F
# [enum]::GetNames([Net.SecurityProtocolType])

# �ݒ肳��Ă���SSL/TSL�̃o�[�W�����m�F
Write-Host "�ύX�O��SSL/TSL�̃o�[�W����"
[Net.ServicePointManager]::SecurityProtocol

# Tls11, Tls12 �Ή��֕ύX
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12

# �ݒ肳��Ă���SSL/TSL�̃o�[�W�����m�F
Write-Host "�ύX���SSL/TSL�̃o�[�W����"
[Net.ServicePointManager]::SecurityProtocol


# winrm�̐ڑ�������
wget https://github.com/ansible/ansible/raw/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -OutFile ConfigureRemotingForAnsible.ps1
.\ConfigureRemotingForAnsible.ps1

#�R���t�B�O���폜
Remove-Item .\ConfigureRemotingForAnsible.ps1

# HTTP��������
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

# HTTP�����������̊m�F
winrm get winrm/config/service

#�R���t�B�O���폜
Remove-Item .\ansible_win_start_shell.ps1

Write-Host "�����ł��B�I������ɂ͉����L�[�������Ă�������..."
$host.UI.RawUI.ReadKey()