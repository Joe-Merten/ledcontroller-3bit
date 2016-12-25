

all: ledcontroller

ledcontroller:  main.c
	gcc -o $@ $^ `pkg-config libusb-1.0 --cflags --libs` 

clean:
	rm ledcontroller

install: all
	install -o root -g root -m 755 ledcontroller /usr/bin/.
	install -o root -g root -m 644 99-RisoKagakuWebmailNotifier.rules /etc/udev/rules.d/.

uninstall:
	rm /usr/bin/ledcontroller
	rm /etc/udev/rules.d/99-RisoKagakuWebmailNotifier.rules
