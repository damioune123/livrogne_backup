
#ifdef WIN32
#include <windows.h>
#else
#include <unistd.h>
#endif

void delay(int ms){
#ifdef WIN32
	Sleep(ms);
#else
	usleep(ms*1000);
#endif
}
#include <sys/file.h>
#include "MFRC522.h"
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h>
#include <fcntl.h>



const char * PATH_SCRIPT="/home/pi/scripts/";
const char * ALLON ="14922213120";
const char * ALLOFF ="37195201120";
const char * FRIGO_ON ="181249204120";
const char * FRIGO_OFF ="6983209120";
const char * MUSIC_ON ="18122563120";
const char * MUSIC_OFF ="24554180120";


int main(){
	int fd = open("/home/pi/RFID_C/rfid.lock", O_RDWR);
	if (fd == -1) { 
		perror("Erreur ouverture fichier lock\n");
		exit(50);
	}
	if (flock(fd, LOCK_EX | LOCK_NB) == -1) { 
		fprintf(stderr,"Ce daemon ne peut pas etre ouvert plusieurs  fois, une autre instance est en cours\n");
		exit(3);
	}
	MFRC522 mfrc;
	MFRC522 mfrc2;
	char* uid;
	pid_t pid;
	mfrc.PCD_Init();
	mfrc2.PCD_Init();
	if( (uid =(char *)malloc(sizeof(char)*255))== NULL){
		fprintf(stderr,"Erreur malloc\n");
		exit(1);
	}
	system("/home/pi/RFID_C/displayC.py CARD...PLEASE &");

	while(1){
		delay(250);
		// Look for a card
		if(!mfrc.PICC_IsNewCardPresent() && !mfrc2.PICC_IsNewCardPresent())
			continue;
		*uid='\0';
		if( mfrc.PICC_ReadCardSerial()){
			for(byte i = 0; i < mfrc.uid.size; ++i){
				if(mfrc.uid.uidByte[i] < 0x10){
					sprintf(uid,"%s%d",uid, mfrc.uid.uidByte[i]);
				}
				else{
					sprintf(uid,"%s%d",uid, mfrc.uid.uidByte[i]);
				}

			}
		}	
		if(mfrc2.PICC_ReadCardSerial()){
			for(byte i = 0; i < mfrc2.uid.size; ++i){
				if(mfrc2.uid.uidByte[i] < 0x10){
					sprintf(uid,"%s%d",uid, mfrc2.uid.uidByte[i]);
				}       
				else{   
					sprintf(uid,"%s%d",uid, mfrc2.uid.uidByte[i]);
				}
			}

		}
		printf("%s\n", uid);
		if(strcmp(ALLOFF, uid)==0){
			if( (pid=fork())==-1){
				perror("Erreur fork\n");
				exit(43);
			}
			if(pid > 0){
				
				int status;
				waitpid(pid, &status, 0);
			}
			else{
				system("/home/pi/scripts/ALLrelaispriseOFF.py");
				system("gpio mode 25 in"); 
			}
		}
		else if(strcmp(ALLON, uid)==0){
			if( (pid=fork())==-1){
				perror("Erreur fork\n");
				exit(43);
			}
			if(pid){
				int status;
				waitpid(pid, &status, 0);
				pid=0;	
			}
			else{
				system("/home/pi/scripts/ALLrelaispriseON.py");
				system("gpio mode 25 out");
				system("/home/pi/RFID_C/displayC.py WELCOME! ");
		
			}
		}
		else if(strcmp(MUSIC_ON, uid)==0){
                        if( (pid=fork())==-1){
                                perror("Erreur fork\n");
                                exit(43);
                        }
                        if(pid){
                                int status;
                                waitpid(pid, &status, 0);
                                pid=0;
                        }
                        else{
                                system("/home/pi/scripts/relaisMusicON.py");

                        }
                }
		 else if(strcmp(MUSIC_OFF, uid)==0){
                        if( (pid=fork())==-1){
                                perror("Erreur fork\n");
                                exit(43);
                        }
                        if(pid){
                                int status;
                                waitpid(pid, &status, 0);
                                pid=0;
                        }
                        else{
                                system("/home/pi/scripts/relaisMusicOFF.py");

                        }
                }
		 else if(strcmp(FRIGO_ON, uid)==0){
                        if( (pid=fork())==-1){
                                perror("Erreur fork\n");
                                exit(43);
                        }
                        if(pid){
                                int status;
                                waitpid(pid, &status, 0);
                                pid=0;
                        }
                        else{
                                system("/home/pi/scripts/relaisFrigoON.py");

                        }
                }
		 else if(strcmp(FRIGO_OFF, uid)==0){
                        if( (pid=fork())==-1){
                                perror("Erreur fork\n");
                                exit(43);
                        }
                        if(pid){
                                int status;
                                waitpid(pid, &status, 0);
                                pid=0;
                        }
                        else{
                                system("/home/pi/scripts/relaisFrigoOFF.py");

                        }
                }
		else{
			char request[500];
			sprintf(request," curl --data \"card_id=%s\" http://127.0.0.1/ivrogne_api_raspberry/web/app.php/api/rfid-auth-tokens > /home/pi/RFID_C/token.txt", uid);
			printf("%s\n",request); 
                        system(request);
                        if( (pid=fork())==-1){
                                perror("Erreur fork\n");
                                exit(43);
                        }
                        if(pid){
                                int status;
                                waitpid(pid, &status, 0);
                                pid=0;
                        }
                        else{
                                system("/home/pi/RFID_C/displayC.py ORDER~STARTING");
                                sleep(1);
                                system("/home/pi/RFID_C/order.py ");
                                wait(NULL);
                                system("/home/pi/RFID_C/displayC.py ORDER~FINISHED ");
                                sleep(2);
                                system("/home/pi/RFID_C/displayC.py CARD...PLEASE ");
                        }
			
		}

		delay(1000);
	}
	return 0;
}
