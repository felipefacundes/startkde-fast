#!/bin/bash
# Script Pessoal para iniciar o PLASMA 5 com wayland, muito mais rápido
# Personal itinerary to start PLASMA 5 with wayland, much faster
# When the X server dies we get a HUP signal from xinit. We must ignore it
# because we still need to do some cleanup.
trap 'echo GOT SIGHUP' HUP

# we have to unset this for Darwin since it will screw up KDE's dynamic-loading
unset DYLD_FORCE_FLAT_NAMESPACE

export WaylandEnable=true
                                               	#export GDK_BACKEND=wayland
export XDG_SESSION_TYPE=wayland 		#echo $XDG_SESSION_TYPE
export QT_AUTO_SCREEN_SCALE_FACTOR=0 		# 0 or 1
                                               	# DISPLAY=:1
                                               	#export WAYLAND_DISPLAY=wayland0 #wayland-system
                                               	# DISPLAY=wayland-0
export KWIN_OPENGL_INTERFACE=egl_wayland
export QT_QPA_PLATFORM=wayland-egl
#export QT_WAYLAND_FORCE_DPI=$kcmfonts_general_forcefontdpiwayland
#export QT_WAYLAND_FORCE_DPI=96
export WAYLAND_DEBUG=1 command |& tee $HOME/.debug-wayland.out
                                               #X-Server started on display :1

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

if test "x$1" = x--failsafe; then
    KDE_FAILSAFE=1 # General failsafe flag
    KWIN_COMPOSE=N # Disable KWin's compositing
    export KWIN_COMPOSE KDE_FAILSAFE
fi

exec /usr/bin/kwin_wayland --xwayland --libinput --exit-with-session=/usr/bin/ksmserver
#exec /usr/bin/kwin_wayland --xwayland --libinput --exit-with-session=/usr/lib/startplasma
