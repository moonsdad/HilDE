
XRESOURCES=${DESTDIR}/etc/X11/xdm/Xresources

HilDE:
	@echo "HilDE is a Lightweight Desktop Environment"
	@echo "  On Debian based systems run 'make debsetup' before installing."
	@echo "  If you are installing this manually, you should run 'make backup' first."

install: .install

.install:
	chmod a+x                    files/usr/bin/hilde-logout
	cp -a files/*                "${DESTDIR}"

debsetup:
	mv files/etc/skel/.xinitrc   files/etc/skel/.Xsession
	mkdir files/usr/share/X11
	mv files/usr/share/xdm       files/usr/share/X11
	sed -i s.share/xdm.share/X11/xdm. files/etc/X11/xdm/Xresources

### Unnecessary:

backup:
	cp ${XRESOURCES}             ${XRESOURCES}.old-`date +%F`

