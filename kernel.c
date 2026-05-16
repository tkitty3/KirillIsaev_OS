extern unsigned char inp(unsigned short port);
extern void outb(unsigned short port, unsigned char data);
char* video_memory = (char*) 0xb8000;

void cursor_h(){
    outb(0x3D4, 0x0A);
    outb(0x3D5, 0x20);
}

void kprint(const char* str){
    for(int i = 0; str[i] != '\0'; i++){
        if (str[i] == '\n') {
            int current_offset = (int)video_memory - 0xb8000;
            int bytes_left = 160 - (current_offset % 160);
            video_memory += bytes_left;
            continue;
        }
        *video_memory = str[i];
        video_memory++;

        *video_memory = 0xF0;
        video_memory++;
    }
}
