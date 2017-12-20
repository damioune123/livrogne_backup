#include <unistd.h>
#include <sys/file.h>
#include "MFRC522.h"
#include "bcm2835.h"
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include<linux/types.h>
#include <stdint.h>
#include <cstring>
#include <stdio.h>
#include <string>
#define TRUE 1
#define FALSE 0

static const char * CURRENT_DIR="/home/pi/RFID_C";
static const char * SCRIPTS_DIR="/home/pi/scripts";
static const char * ALLON ="14922213120";
static const char * ALLOFF ="37195201120";
static const char * FRIGO_ON ="181249204120";
static const char * FRIGO_OFF ="6983209120";
static const char * MUSIC_ON ="18122563120";
static const char * MUSIC_OFF ="24554180120";


int cardScripts(char *uid){
    char buffer[512];
    if(strcmp(ALLOFF, uid)==0){
        sprintf(buffer,"%s/ALLrelaispriseOFF.py", SCRIPTS_DIR);
        system(buffer);
        return TRUE;
    }
    else if(strcmp(ALLON, uid)==0){
        sprintf(buffer,"%s/ALLrelaispriseON.py", SCRIPTS_DIR);
        system(buffer);
        sprintf(buffer,"%s/displayC.py CARD_PLEASE... &", CURRENT_DIR);
        system(buffer);
        return TRUE;
    }
    else if(strcmp(MUSIC_ON, uid)==0){
        sprintf(buffer,"%s/relaisMusicON.py", SCRIPTS_DIR);
        system(buffer);
        return TRUE;
    }
    else if(strcmp(MUSIC_OFF, uid)==0){
        sprintf(buffer,"%s/relaisMusicOFF.py", SCRIPTS_DIR);
        system(buffer);
        return TRUE;
    }
    else if(strcmp(FRIGO_ON, uid)==0){
        sprintf(buffer,"%s/relaisFrigoON.py", SCRIPTS_DIR);
        system(buffer);
        return TRUE;
    }
    else if(strcmp(FRIGO_OFF, uid)==0){
        sprintf(buffer,"%s/relaisFrigoOFF.py", SCRIPTS_DIR);
        system(buffer);
        return TRUE;
    }
    return FALSE;
}

void orderProcess(char * uid){
    char buffer[512];
    system("service sensors_cam stop");
    sprintf(buffer,"%s/order.py", CURRENT_DIR);
    wait(NULL);
    printf("%s\n", buffer); 
    pid_t child_pid;
    if ((child_pid = fork())== -1){
        perror("Erreur fork\n");
        exit(1);
    }
    if(child_pid == 0){
        printf("buffer : %s\n", buffer);
        execl(buffer,"order.py", uid, NULL);
    }
    wait(NULL);
    system("service sensors_cam start");
    sprintf(buffer,"%s/displayC.py CARD_PLEASE... &", CURRENT_DIR);
    system(buffer);
}
void tabletteProcess(char * uid){
    char buffer[512];
    pid_t child_pid;
    sprintf(buffer,"%s/login_rfid.py", CURRENT_DIR);
    wait(NULL);
    printf("%s\n", buffer); 
    if ((child_pid = fork())== -1){
        perror("Erreur fork\n");
        exit(1);
    }
    if(child_pid == 0){
        execl(buffer,"login_rfid.py", uid, NULL);
    }
    wait(NULL);
}
int main(){
    char buffer[512];
    char uid[521];
    MFRC522 mfrc;
    int presentCS0=0; 
    while(1){
        presentCS0=0;
        mfrc.PCD_Init();
        mfrc.setSPIConfig();
        usleep(200*1000);
        // Look for a card
        if(mfrc.PICC_IsNewCardPresent())
            presentCS0=1;
        *uid='\0';
        if(presentCS0 ==1){
            if( mfrc.PICC_ReadCardSerial()){
                for(byte i = 0; i < mfrc.uid.size; ++i){
                    sprintf(uid,"%s%d",uid, mfrc.uid.uidByte[i]);
                }
            }
            printf("%s\n", uid);
        }
        if(presentCS0 ==0){
            mfrc.PCD_Init();
            mfrc.setSPIConfigCS1();
            if(!mfrc.PICC_IsNewCardPresent())
                continue;
            *uid='\0';
            if( mfrc.PICC_ReadCardSerial()){
                for(byte i = 0; i < mfrc.uid.size; ++i){
                    sprintf(uid,"%s%d",uid, mfrc.uid.uidByte[i]);
                }
            }   
            printf("%s\n", uid);
        }
        if(cardScripts(uid)) continue;
        if(presentCS0) orderProcess(uid);
        else{
            tabletteProcess(uid);
            sleep(5);
        }
    }
}
