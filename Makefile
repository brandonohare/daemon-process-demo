#"Target will be the resulting program name after compilation.
TARGET = daemonProc
#Source is the C file that will be compiled.
SOURCE = testDaemon.c

#Install is the location of the "install" program in Linux
INSTALL = $(shell which install)

#This will be the directory where associated files will be stored.
VARLOG = /var/tmp/daemon-proc-demo

#"all" is a general target. It is the first target, so it is the default when running "make".
#You can specify what to make with "make fileNum.c".
#Since only "Target" is specified after "all: ", it only builds Target
all: $(TARGET)

#This builds the daemon process
$(TARGET): $(SOURCE)
	$(CC) $(SOURCE) -o $@

install: all

	$(INSTALL) -d $(VARLOG)
	$(INSTALL) temporary/first $(VARLOG)
	$(INSTALL) temporary/second $(VARLOG)
	$(INSTALL) temporary/third $(VARLOG)
	$(INSTALL) temporary/log $(VARLOG)

uninstall: all
	rm -rf $(VARLOG)
	rm daemonProc
