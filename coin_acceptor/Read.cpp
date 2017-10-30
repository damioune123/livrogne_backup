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

static const char * CURRENT_DIR="/home/pi/coin_acceptor";





void coinProcess(char * uid){
    char buffer[512];
    sprintf(buffer,"%s/coinManagement.py", CURRENT_DIR);
    wait(NULL);
    printf("%s\n", buffer);
    pid_t child_pid;
    if ((child_pid = fork())== -1){
        perror("Erreur fork\n");
        exit(1);
    }
    if(child_pid == 0){
        printf("buffer : %s\n", buffer);
        execl(buffer,"coinManagement.py", uid, NULL);
    }
    wait(NULL);
    sprintf(buffer,"%s/displayC.py CARD_PLEASE... &", CURRENT_DIR);
    system(buffer);
}

int main(){
    int fd2 = open("/var/run/rfid.pid", O_RDWR|O_CREAT|O_TRUNC);
    if (fd2 == -1) {
        perror("Erreur ouverture fichier pid\n");
        exit(1);
    }
    int current_pid = getpid();
    char cPid[255];
    sprintf(cPid, "%d", current_pid);
    if (write(fd2, &cPid, strlen(cPid)) == -1) {
        fprintf(stderr,"Erreur ecriture pid file\n");
        exit(1);
    }
    char buffer[512];
    char uid[521];
    MFRC522 mfrc;
    mfrc.PCD_Init();
    mfrc.setSPIConfig();
    while(TRUE){
        usleep(275*1000);
        // Look for a card
        if(mfrc.PICC_IsNewCardPresent()){
          *uid='\0';
          if( mfrc.PICC_ReadCardSerial()){
              for(byte i = 0; i < mfrc.uid.size; ++i){
                  sprintf(uid,"%s%d",uid, mfrc.uid.uidByte[i]);
              }
              printf("%s\n", uid);
          }
        }
        else{
          continue;
        }
        coinProcess(uid);
    }
}
