__attribute__((__noreturn__)) void hlt() {
    for (;;) {
        __asm__("hlt");
    }
}

void kstart() {
    hlt();
}