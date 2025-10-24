@echo off
title Guia - Fix para cheat - Astex Services
color 0A

:: --- Elevar pra admin ---
:: Verifica se está executando como administrador.
:: Se não, reinicia o script com privilégios.
net session >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Solicitando permissao de administrador...
    powershell -Command "Start-Process cmd -ArgumentList '/c \"\"%~f0\"\"' -Verb RunAs"
    exit /b
)

cls
echo ===================================================
echo MENSAGEM DO DESENVOLVEDOR
echo ===================================================
echo Fix feito pelo Termux, dono da Astex
echo este script e inofensivo, ele apenas ira te guiar para
echo solucionar os problemas em seu computador para usar os nossos produtos.
echo.

:: AVISO DE PLAGIO (COR AMARELA - 06)
color 06
echo ===================================================
echo DIRETRIZES E DIREITOS RESERVADOS
echo ===================================================
echo ESTE SCRIPT E DE PROPRIEDADE INTELECTUAL DA ASTEX.
echo Qualquer tentativa de plagio, copia ou distribuicao
echo nao autorizada sera detectada e reportada
echo AUTOMATICAMENTE aos nossos developers.
echo.
echo AVISO: Nao compartilhe este script com terceiros.
:: Simula uma "transmissao" de dados de seriedade
:: RETORNA PARA A COR VERDE IMEDIATAMENTE APÓS O AVISO
color 0A
echo.
echo ===================================================
echo INICIO DO GUIA
echo ===================================================
echo Pressione ENTER para abrir o link do nosso servidor Discord
echo e iniciar o guia de desativacao de protecoes.
echo >> SYSTEM: Chave de acesso cadastrada no fix.
echo.
pause

:: Abre o link do Discord e inicia o guia
start "" "https://discord.gg/4QbF3crEAc"

cls
echo ===================================================
echo GUIA PARA DESATIVAR PROTECOES MANUALMENTE
echo ===================================================
echo Este assistente NAO desativa nada automaticamente.
echo Ele apenas abre as janelas corretas e aguarda confirmacao.
echo.
pause

:: ===================================================================
:: ===== ETAPA 1 - PROTEÇÃO EM TEMPO REAL, NUVEM, AMOSTRAS E VIOLAÇÕES =====
:: ===================================================================
:etapa1
cls
echo [ETAPA 1/7] - PROTECAO EM TEMPO REAL, NUVEM, AMOSTRAS E VIOLACOES
echo -----------------------------------------------------
echo 1. Clique em "Protecao contra virus e ameacas".
echo 2. Clique em "Gerenciar configuracoes".
echo 3. DESATIVE "Protecao em tempo real", "Protecao fornecida na nuvem", "Envio automatico de amostras".
echo 4. Role a pagina ate o fim e DESATIVE "Protecao contra violacoes".
echo.
echo Pressione ENTER para abrir a tela Seguranca do Windows.
(pause >nul)
echo Abrindo tela...
start "" "windowsdefender:" || start "" "ms-settings:windowsdefender"
echo.
echo Quando terminar e FECHAR a janela, volte aqui e confirme.
echo.
choice /c YN /n /m "Voce terminou essa etapa? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa1
goto verificacao1

:: VERIFICACAO ETAPA 1 (Protecao em Tempo Real)
:verificacao1
cls
echo [ETAPA 1/7] - VERIFICACAO DE PROTECAO EM TEMPO REAL
echo -----------------------------------------------------
echo O script ira consultar o valor de 'DisableRealtimeMonitoring' via PowerShell.
echo O valor esperado E: True (Verdadeiro, o que significa Desativado)
echo.
echo Pressione ENTER para consultar o status agora.
(pause >nul)
:: O comando abaixo deve retornar 'True' se a protecao em tempo real estiver DESATIVADA
powershell -Command "Get-MpPreference | Select-Object -ExpandProperty DisableRealtimeMonitoring"
echo.
echo ANALISE O RESULTADO ACIMA: Se o valor for 'True' ou '1', a edicao esta CORRETA (Desativada).
echo.
choice /c YN /n /m "Voce CONFIRMOU que a Protecao em Tempo Real esta DESATIVADA (True/1)? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa1
goto etapa2

:: ===================================================================
:: ===== ETAPA 2 - SMARTSCREEN E CONTROLE DE APLICATIVOS =====
:: ===================================================================
:etapa2
cls
echo [ETAPA 2/7] - SMARTSCREEN E CONTROLE DE APLICATIVOS
echo -----------------------------------------------------
echo 1. Volte a tela inicial do Windows Security.
echo 2. Clique em "Controle de aplicativos e navegador" e DESATIVE todas as opcoes do SmartScreen.
echo.
echo Pressione ENTER para abrir a tela de controle de aplicativos.
(pause >nul)
echo Tentando abrir tela especifica de Aplicativos e Navegador...
start "" "windowsdefender://appbrowser" || start "" "ms-settings:windowsdefender"
echo.
echo Quando terminar e FECHAR a janela, volte aqui e confirme.
echo.
choice /c YN /n /m "Voce terminou essa etapa? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa2
goto verificacao2

:: VERIFICACAO ETAPA 2 (SmartScreen)
:verificacao2
cls
echo [ETAPA 2/7] - VERIFICACAO DO SMARTSCREEN
echo -----------------------------------------------------
echo O script ira consultar o valor da chave do SmartScreen no Registro.
echo O valor esperado E: Off
echo.
echo Pressione ENTER para consultar o Registro agora.
(pause >nul)
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled
echo.
echo ANALISE O RESULTADO ACIMA: Se a linha "Dados" mostrar "Off", a edicao esta CORRETA (Desativado).
echo.
choice /c YN /n /m "Voce CONFIRMOU que a linha Dados mostra 'Off'? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa2
goto etapa3

:: ===================================================================
:: ===== ETAPA 3 - FIREWALL =====
:: ===================================================================
:etapa3
cls
echo [ETAPA 3/7] - DESATIVAR FIREWALL DO WINDOWS
echo -----------------------------------------------------
echo 1. Na janela do Firewall que sera aberta, clique em "Ativar ou desativar o Windows Defender Firewall".
echo 2. DESATIVE o Firewall para "Rede publica" e "Rede privada".
echo.
echo Pressione ENTER para abrir a tela do Firewall (Comando Direto).
(pause >nul)
echo Abrindo tela de configuracao do Firewall avancado (wf.msc)...
start wf.msc
echo.
echo Quando terminar e FECHAR a janela, volte aqui e confirme.
echo.
choice /c YN /n /m "Voce terminou essa etapa? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa3
goto verificacao3

:: VERIFICACAO ETAPA 3 (Firewall)
:verificacao3
cls
echo [ETAPA 3/7] - VERIFICACAO DO FIREWALL
echo -----------------------------------------------------
echo O script ira consultar o status do Firewall para todos os perfis.
echo O valor esperado para 'State' em Private e Public E: OFF (Desativado)
echo.
echo Pressione ENTER para consultar o status agora.
(pause >nul)
netsh advfirewall show allprofiles
echo.
echo ANALISE O RESULTADO ACIMA: Confirme que 'State' mostra 'OFF' para Private e Public.
echo.
choice /c YN /n /m "Voce CONFIRMOU que o Firewall esta DESATIVADO (State OFF) para Private e Public? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa3
goto etapa4


:: ===================================================================
:: ===== ETAPA 4 - PAUSAR E DESINSTALAR ATUALIZAÇÕES PROBLEMÁTICAS (KB5058499) =====
:: ===================================================================
:etapa4
cls
echo [ETAPA 4/7] - PAUSAR E DESINSTALAR ATUALIZACOES (KB5058499)
echo -----------------------------------------------------
echo ATENCAO: E CRUCIAL DESINSTALAR ATUALIZACOES CUMULATIVAS RECENTES.
echo.
echo === PARTE 1: PAUSAR ATUALIZACOES AUTOMATICAS E ACESSAR A DESINSTALACAO ===
echo 1. A tela do Windows Update sera aberta. Clique em **"Pausar atualizacoes por X dias"** para desativar a atualizacao automatica.
echo 2. Clique em **"Historico de atualizacoes"**.
echo 3. Clique em **"Desinstalar atualizacoes"** (o link no final da pagina).
echo.
echo **ESTA E A PARTE IMPORTANTE (DESINSTALACAO):**
echo 4. Na lista, DESINSTALE a atualizacao **Update for Microsoft Windows (KB5058499)** ou **qualquer outra KB do Microsoft Windows** que esteja causando problemas (veja a imagem de exemplo).
echo.
echo **REGRA CRITICA:** NAO REMOVA as atualizacoes do **Microsoft Visual C++**!
echo Desinstale **APENAS** as atualizacoes do **Microsoft Windows**.
echo.
echo Pressione ENTER para abrir a tela do Windows Update (Historico).
(pause >nul)
echo Abrindo tela...
start "" "ms-settings:windowsupdate-history"
echo.
echo Quando terminar de desinstalar e fechar a janela, volte aqui e confirme.
echo.
choice /c YN /n /m "Voce pausou as atualizacoes e desinstalou a(s) KB(s) do Windows? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa4
goto verificacao4

:: VERIFICACAO ETAPA 4 (Atualizações desinstaladas)
:verificacao4
cls
echo [ETAPA 4/7] - VERIFICACAO DAS ATUALIZACOES DESINSTALADAS
echo -----------------------------------------------------
echo Voce deve ter executado duas acoes:
echo 1. Atualizacoes automaticas **PAUSADAS**.
echo 2. Atualizacoes do **Microsoft Windows (KB...)** desinstaladas.
echo.
echo Voce **NAO** deve ter desinstalado o Microsoft Visual C++.
echo.
choice /c YN /n /m "Voce CONFIRMOU que seguiu as instrucoes de desinstalacao e pausa? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa4
goto etapa5


:: ===================================================================
:: ===== ETAPA 5 - BACKUP DO REGEDIT =====
:: ===================================================================
:etapa5
cls
echo [ETAPA 5/7] - BACKUP DA CHAVE REGEDIT
echo -----------------------------------------------------
echo Antes de aplicar o FIX, faremos um backup da chave do registro.
echo Chave: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config\Default
echo.
echo Pressione ENTER para fazer o backup agora.
(pause >nul)
set BACKUP_KEY="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config\Default"
set BACKUP_FILE="%USERPROFILE%\Desktop\ConfigDefaultBackup.reg"
reg export %BACKUP_KEY% %BACKUP_FILE% /y >nul 2>&1
echo Backup salvo em: %BACKUP_FILE%
echo.
echo Verifique se o arquivo 'ConfigDefaultBackup.reg' apareceu na sua AREA DE TRABALHO.
echo.
choice /c YN /n /m "Backup concluido? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa5
goto etapa6


:: ===================================================================
:: ===== ETAPA 6 - APLICAR FIX REGEDIT AUTOMATICO (VALOR 0) =====
:: ===================================================================
:etapa6
cls
echo [ETAPA 6/7] - APLICANDO FIX REGEDIT AUTOMATICO
echo -----------------------------------------------------
echo O script ira aplicar o FIX, alterando o valor (Default) = 0
echo na chave HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config\Default
echo.
echo Pressione ENTER para aplicar o FIX agora.
(pause >nul)

:: Aplica o REG ADD para forçar o valor (Default) a ser 0
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config\Default" /ve /t REG_SZ /d "0" /f
echo.
echo FIX REGISTRO APLICADO.
echo Pressione ENTER para verificar a alteracao.
(pause >nul)
goto etapa7


:: ===================================================================
:: ===== ETAPA 7 - VERIFICAÇÃO AUTOMÁTICA DO REGEDIT (VALOR 0) E ENCERRAMENTO DE PROCESSOS =====
:: ===================================================================
:etapa7
cls
echo [ETAPA 7/7] - VERIFICACAO E FECHAMENTO DE PROCESSOS CONFLITANTES
echo -----------------------------------------------------
echo === VERIFICACAO REGEDIT ===
echo O script ira verificar o valor da chave (Default) no Registro.
echo O valor esperado E: 0 (Zero)
echo.
echo Pressione ENTER para consultar o Registro agora.
(pause >nul)
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CI\Config\Default" /ve
echo.
echo ANALISE O RESULTADO ACIMA: Se a linha "Dados" mostrar "0", a edicao esta CORRETA.
echo.
choice /c YN /n /m "Voce CONFIRMOU que a linha Dados mostra '0'? [Y=Sim / N=Nao]: "
if %errorlevel%==2 (
    echo.
    echo O valor nao foi alterado. Retornando para tentar aplicar o FIX novamente...
    pause
    goto etapa6
)
goto etapa7_processos

:etapa7_processos
cls
echo [ETAPA 7/7] - PARTE 2: FECHAMENTO DE PROCESSOS CONFLITANTES
echo -----------------------------------------------------
echo O script tentara encerrar processos conhecidos por causar
echo conflitos ou que sao incompativeis com nossos produtos (Vanguard, RTSS, Overlays).
echo.
echo Processos a encerrar:
echo - Riot Vanguard/Client (vgtray.exe, vgc.exe, RiotClientServices.exe)
echo - MSI Afterburner/RTSS (RTSS.exe, RTSSHooksLoader64.exe, MSIAfterburner.exe)
echo - Discord (Discord.exe - Para remover o Overlay)
echo.
echo Pressione ENTER para tentar encerrar os processos agora.
(pause >nul)

taskkill /f /im vgtray.exe >nul 2>&1
taskkill /f /im vgc.exe >nul 2>&1
taskkill /f /im RiotClientServices.exe >nul 2>&1
taskkill /f /im RTSS.exe >nul 2>&1
taskkill /f /im RTSSHooksLoader64.exe >nul 2>&1
taskkill /f /im MSIAfterburner.exe >nul 2>&1
taskkill /f /im Discord.exe >nul 2>&1

echo.
echo Tentativa de encerramento feita.
echo 1. Confirme se os icones do Riot Vanguard, Afterburner e Discord sumiram da bandeja do sistema.
echo.
choice /c YN /n /m "Voce confirmou que os processos foram encerrados? [Y=Sim / N=Nao]: "
if %errorlevel%==2 goto etapa7_processos
goto conclusao


:: ===================================================================
:: ===== CONCLUSÃO =====
:: ===================================================================
:conclusao
cls
echo ===================================================
echo Parabens!
Todas as etapas foram confirmadas com sucesso!
echo ===================================================
echo A equipe Astex tem o prazer de desejar a voce um excelente jogo!
echo O seu PC esta agora otimizado para usar nossos produtos.
echo.
echo Caso tenha qualquer problema ou duvida com o Fix,
echo por favor, nao hesite em contatar diretamente o Termux,
echo dono da Astex Services.
echo.
echo Aproveite a experiencia Astex!
echo ===================================================
pause
exit /b