# startkde-fast.sh
#              telegram:     https://t.me/comandos_linux
#
# a "startkde" script fork to start PLASMA 5, much faster
# Uma bifurcação do Script "startkde" para iniciar o PLASMA 5, muito mais rápido
#
# What this script does (startkde-fast.sh) is to go straight to the subject and start kde immediately.
# O que esse script faz (startkde-fast.sh) é ir direto ao assunto e iniciar logo o kde.

#                              (instruções em PT_BR)
#                                    Como usar 
# 

Dê permissão de execução aos scripts chmod +x *.sh
Coloque os scripts na sua pasta de usuário (/home/USER/) e renomeie como oculto com "." (ponto)
de startkde-fast.sh   para   .startkde-fast.sh
de startplasma-wayland-fast.sh   para   .startplasma-wayland-fast.sh

Copie  plasmawayland-fast.desktop   para   /usr/share/wayland-sessions/
sudo cp plasmawayland-fast.desktop /usr/share/wayland-sessions/

Copie  plasma-fast.desktop   para   /usr/share/xsessions/
sudo cp plasma-fast.desktop /usr/share/xsessions/

# Para X11 

Inclua no seu xinit ~/.xinitrc ou ~/.config/sx/sxrc o script: startkde-fast.sh
Exatamente desta maneira:

exec ~/.startkde-fast.sh

# Para wayland

Inclua no seu xinit ~/.xinitrc ou ~/.config/sx/sxrc o script: startkde-fast.sh
Exatamente desta maneira:

dbus-run-session ~/.startplasma-wayland-fast.sh

# Caso você queira ativar o chaveiro, o kwallet, faça o seguinte:
Após inicar o sistema vá em  Configurações do kde (systemsettings5) em:
inicialização e desligamento > iniciar automaticamente > adicionar script
e adicione:      posinit-kde.sh


#                            (instructions in english)
#                                   How to use
#

Give chmod +x *.sh scripts permission to execute
Put the scripts in your user folder (/home/USER/) and rename them as hidden with "."
from startkde-fast.sh to .startkde-fast.sh
of startplasma-wayland-fast.sh to .startplasma-wayland-fast.sh

Copy  plasmawayland-fast.desktop   for   /home/your user/.local/share/wayland-sessions/
sudo cp plasmawayland-fast.desktop /usr/share/wayland-sessions/

Copy  plasma-fast.desktop   for   /home/your user/.local/share/xsessions/
sudo cp plasma-fast.desktop /usr/share/xsessions/

# For wayland

Include in your xinit ~/.xinitrc or ~/.config/sx/sxrc the script: startkde-fast.sh
Exactly this way:

exec ~/.startkde-fast.sh

# Para wayland
Include in your xinit ~/.xinitrc or ~/.config/sx/sxrc the script: startkde-fast.sh
Exactly this way:

dbus-run-session ~/.startplasma-wayland-fast.sh

# If you want to activate the key chain, kwallet, do the following:
After you start it in the KDE Settings (systemsettings5) at:
startup and shutdown > start automatically > add script
and add:     posinit-kde.sh
