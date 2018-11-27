#!/bin/bash
# Script pessoal para iniciar o PLASMA 5 muito mais rápido
# Personal script to start PLASMA 5, much faster
trap 'echo GOT SIGHUP' HUP

exec kcheckrunning &
KDE_FULL_SESSION=true
export KDE_FULL_SESSION
xprop -root -f KDE_FULL_SESSION 8t -set KDE_FULL_SESSION true

KDE_SESSION_VERSION=5
export KDE_SESSION_VERSION
xprop -root -f KDE_SESSION_VERSION 32c -set KDE_SESSION_VERSION 5

KDE_SESSION_UID=`id -ru`
export KDE_SESSION_UID

XDG_CURRENT_DESKTOP=KDE
export XDG_CURRENT_DESKTOP

exec ksmserver & 		# inicia modulos
exec plasmashell --replace &	# reinicia o plasmashell, corrigindo erros

if test "x$1" = x--failsafe; then
    KDE_FAILSAFE=1 # General failsafe flag
    KWIN_COMPOSE=N # Disable KWin's compositing
    export KWIN_COMPOSE KDE_FAILSAFE
fi

# Para kwin
kwin_x11 --replace --no-kactivities # no-kactivities desativa erros de protocolos

# Para compiz
#compiz --replace && emerald --replace

# Para xfwm4
#xfwm4 --compositor=on

# Para openbox
#openbox --replace
