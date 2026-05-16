extern unsigned char inp(unsigned short port);
extern void outb(unsigned short port, unsigned char data);

char* video_memory = (char*) 0xb8000;

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

void clear_terminal(void){
    char* video = (char*) 0xb8000;
    for(int i = 0; i < 80*25*2; i+=2){
        video[i] = ' ';
        video[i + 1] = 0xf0;
    }
    video_memory = (char*) 0xb8000;
    kprint("KIRILLISAEV_OS\n\n");
    kprint("Press h\n");
    video_memory = (char*)(0xb8000 + 480); 
}

void cursor_h(){
    outb(0x3D4, 0x0A);
    outb(0x3D5, 0x20);
}

void kmain(void){
    cursor_h();
    clear_terminal();
    
    while (1)
    {
        if(inp(0x64) & 0x01){
            unsigned char scan = inp(0x60);
            
            if(scan == 0x23){
                clear_terminal(); 
                kprint("\n::: HELP TERMINAL :::\n\n");
                kprint("c - clear screen\n");
                kprint("h - help\n\n");
                for(volatile int i = 0; i < 4000000; i++);
            }
            
            if(scan == 0x2e){
                clear_terminal();
                for(volatile int i = 0; i < 4000000; i++);
            }
        }
    }
    return;
}
