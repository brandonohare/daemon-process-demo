#"Target will be the resulting program name after compilation.
TARGET = daemonProc
#Source is the C file that will be compiled.
SOURCE = testDaemon.c

#Install is the location of the "install" program in Linux
INSTALL = $(shell which install)

#This will be the directory where associated files will be stored.
VARLOG = /var/tmp/daemon-proc-demo

#This is the directory where the daemon systemd service will be installed
SYSDLOC = /etc/systemd/system

#"all" is a general target. It is the first target, so it is the default when running "make".
#You can specify what to make with "make fileNum.c".
#Since only "Target" is specified after "all: ", it only builds Target
all: $(TARGET)

#This builds the daemon process
$(TARGET): $(SOURCE)
	$(CC) $(SOURCE) -o $@

install: all

	$(INSTALL) -d $(VARLOG)
	$(INSTALL) $(TARGET) /usr/bin
	$(INSTALL) temporary/first $(VARLOG)
	$(INSTALL) temporary/second $(VARLOG)
	$(INSTALL) temporary/third $(VARLOG)
	$(INSTALL) temporary/log $(VARLOG)
	$(INSTALL) temporary/testDaemon.service $(SYSDLOC)
	systemctl start testDaemon

uninstall: all
	rm -rf $(VARLOG)
	systemctl stop testDaemon
	rm -f $(SYSDLOC)/testDaemon.service
	rm -f /usr/bin/daemonProc
	systemctl daemon-reload

