#include <unistd.h>
#include <sys/file.h>
#include "MFRC522.h"
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>
static const char * CURRENT_DIR="/home/pi/RFID_C";
static const char * SCRIPTS_DIR="/home/pi/scripts";
static const char * ALLON ="14922213120";
static const char * ALLOFF ="37195201120";
static const char * FRIGO_ON ="181249204120";
static const char * FRIGO_OFF ="6983209120";
static const char * MUSIC_ON ="18122563120";
static const char * MUSIC_OFF ="24554180120";
int main(){
        char buffer[512];
        char uid[521];
	int fd = open("/var/lock/rfid.lock", O_RDWR|O_CREAT);
	if (fd == -1) { 
		perror("Erreur ouverture fichier lock\n");
		exit(50);
	}
	if (flock(fd, LOCK_EX | LOCK_NB) == -1) { 
		fprintf(stderr,"Ce daemon ne peut pas etre ouvert plusieurs  fois, une autre instance est en cours\n");
		exit(3);
	}
	int fd2 = open("/var/run/rfid.pid", O_RDWR|O_CREAT|O_TRUNC);
	if (fd == -1) { 
		perror("Erreur ouverture fichier pid\n");
		exit(50);
	}
        int current_pid = getpid();
        char cPid[255];
        sprintf(cPid, "%d", current_pid);
	if (write(fd2, &cPid, strlen(cPid)) == -1) { 
		fprintf(stderr,"Erreur ecriture pid file\n");
		exit(4);
	}
	MFRC522 mfrc;
	MFRC522 mfrc2;
	mfrc.PCD_Init();
	mfrc2.PCD_Init();
        pid_t child_pid;
	while(1){
		usleep(275*1000);
		// Look for a card
		if(!mfrc.PICC_IsNewCardPresent() && !mfrc2.PICC_IsNewCardPresent())
			continue;
		*uid='\0';
		if( mfrc.PICC_ReadCardSerial()){
			for(byte i = 0; i < mfrc.uid.size; ++i){
                            sprintf(uid,"%s%d",uid, mfrc.uid.uidByte[i]);
			}
		}	
		if(mfrc2.PICC_ReadCardSerial()){
			for(byte i = 0; i < mfrc2.uid.size; ++i){
                            sprintf(uid,"%s%d",uid, mfrc2.uid.uidByte[i]);
			}
		}
		printf("%s\n", uid);
		if(strcmp(ALLOFF, uid)==0){
                    sprintf(buffer,"%s/ALLrelaispriseOFF.py", SCRIPTS_DIR);
                    system(buffer);
		}
		else if(strcmp(ALLON, uid)==0){
                    sprintf(buffer,"%s/ALLrelaispriseON.py", SCRIPTS_DIR);
                    system(buffer);
                    sprintf(buffer,"%s/displayC.py CARD...PLEASE &", CURRENT_DIR);
                    system(buffer);
		}
		else if(strcmp(MUSIC_ON, uid)==0){
                    sprintf(buffer,"%s/relaisMusicON.py", SCRIPTS_DIR);
                    system(buffer);
                }
		 else if(strcmp(MUSIC_OFF, uid)==0){
                     sprintf(buffer,"%s/relaisMusicOFF.py", SCRIPTS_DIR);
                     system(buffer);
                }
		 else if(strcmp(FRIGO_ON, uid)==0){
                     sprintf(buffer,"%s/relaisFrigoON.py", SCRIPTS_DIR);
                     system(buffer);
                }
		 else if(strcmp(FRIGO_OFF, uid)==0){
                     sprintf(buffer,"%s/relaisFrigoOFF.py", SCRIPTS_DIR);
                     system(buffer);
                }
		else{
                    system("service sensors_cam stop");
                    sprintf(buffer,"%s/order.py", CURRENT_DIR);
                    wait(NULL);
                    printf("%s\n", buffer); 
                    if ((child_pid = fork())== -1){
                        perror("Erreur fork\n");
                        exit(1);
                    }
                    if(child_pid == 0){
                        execl(buffer,"order.py", uid, NULL);
                    }
                    wait(NULL);
                    system("service sensors_cam start");
                    sprintf(buffer,"%s/displayC.py CARD...PLEASE &", CURRENT_DIR);
                    system(buffer);

		}
	}
	return 0;
}
