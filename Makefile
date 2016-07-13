LXPDIR=${DESTDIR}/usr/share/lxpanel/profile
BINDIR=${DESTDIR}/usr/local/bin
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources
SKELDIR=${DESTDIR}/etc/skel
PIXDIR=${DESTDIR}/usr/share/pixmaps

WALLSIZE=1600x900

WALLPAPER=img/bg/Hippo-in-a-TuTu-${WALLSIZE}.png
START_MENU_IMG=img/icons/places/24/start-menu.png
BIN=bin/start.sh bin/stop.sh bin/aliases.sh
IMG=${START_MENU_IMG} img/hilde-on-ubuntu.xpm ${WALLPAPER}
FILES=${BIN} ${IMG} xtra/Xresources


HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"


.install: HilDE ${FILES} backup
	cp bin/start.sh              ${SKELDIR}/.Xsession
	cp bin/stop.sh               ${BINDIR}/hilde-logout
	cp -r lxpanel-profile        ${LXPDIR}/hilde
	cp -r lxpanel-profile        ${SKELDIR}/.config/lxpanel/default
	cp xtra/Xresources           ${XRESOURCES}
	cp img/hilde-on-ubuntu.xpm   ${DESTDIR}/usr/share/X11/xdm/pixmaps/
	cp ${START_MENU_IMG}         ${PIXDIR}/
	cp ${WALLPAPER}              ${PIXDIR}/
	cp bin/aliases.sh            ${SKELDIR}/

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`


xsession: xtra/hilde.desktop
	cp xtra/hilde.desktop        ${DESTDIR}/usr/share/xsessions/

