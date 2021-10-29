#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv){
	printf("Starting daemon...");
        if(daemon(0,0) != 0){
                printf("Daemon failure");
		return -1;
	}

        FILE *fptr;
        int firstState = 0;
        int secondState = 0;
        int thirdState = 0;

	while(1){
                fptr = fopen("/var/tmp/daemon-proc-demo/first", "r");
                fscanf(fptr, "%d", &firstState);
                fclose(fptr);

                fptr = fopen("/var/tmp/daemon-proc-demo/second", "r");
                fscanf(fptr, "%d", &secondState);
                fclose(fptr);

                fptr = fopen("/var/tmp/daemon-proc-demo/third", "r");
                fscanf(fptr, "%d", &thirdState);
                fclose(fptr);

                fptr = fopen("/var/tmp/daemon-proc-demo/log", "w");
                fprintf(fptr, "State One:%d\nState Two:%d\nState Three:%d\n", firstState, secondState, thirdState);
                fclose(fptr);
                sleep(1);
	}
}
