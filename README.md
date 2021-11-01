Linux Service Daemon Demonstration
==================================

This repository is an example of a simple daemon that is operated by the systemd service manager.
The daemon monitors three "state" files, labeled "first", "second", and "third". Each of these files contain a single integer, and represent a file that could be manipulated by another program depending on said program's state. The daemon monitoring the files then outputs their combined and formatted values to a "log" file. If a user changes one of the file's states, they'll see the "log" file changed. The "log" file is not meant to represent a traditional Linux program log file, it is merely logging the current state of the three files. 

Install
-------
The only dependency needed is gcc, which should come with most Linux distros.
	$ sudo apt install gcc
Clone the repository onto your system.
	$ git clone https://github.com/brandonohare/daemon-process-demo
Change into the program directory, then compile the program and install the files.
	$ cd daemon-process-demo
	$ make
	$ sudo make install

Usage
-----
Once installed, the testDaemon service will be installed on your system.
Check whether the system is running on your system.
	$ systemctl status testDaemon
Check the "log" file.
	$ cat /var/tmp/daemon-proc-demo/log
The output should be as follows:
	$ cat /var/tmp/daemon-proc-demo/log
	State One: 0
	State Two: 0
	State Three: 0
Inside of /var/tmp/daemon-proc-demo/ should be files "first", "second", and "third".
Modify one of those with a simple echo command.
	$ echo 1 > /var/tmp/daemon-proc-demo/first
Then, check the "log" file again. The output should indicate the change. 
	$ cat /var/tmp/daemon-proc-demo/log
	State One: 1
	State Two: 0
	State Three: 0

Changing any of the three files will show up in the log. 
	
