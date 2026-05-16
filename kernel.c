char* video_memory = (char*) 0xb8000;
void kprint(const char* str){
    for(int i = 0; str[i] != '\0'; i++){
        *video_memory = str[i];
        video_memory++;

        *video_memory = 0xF0;
        video_memory++;
    }
}



void kmain(void){
    kprint("KIRILLISAEV_OS");

    
    return;
}