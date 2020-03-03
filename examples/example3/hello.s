BITS 32
                org     0x05430000

                db      0x7F, "ELF"
                dd      1
                dd      0
                dd      $$
                dw      2
                dw      3
                dd      _start
                dw      _start - $$
_start:         inc     ebx                     ; 1 = stdout file descriptor
                add     eax, strict dword 4     ; 4 = write system call number
                mov     ecx, msg                ; Point ecx at string
                mov     dl, 14                  ; Set edx to string length
                int     0x80                    ; eax = write(ebx, ecx, edx)
                and     eax, 0x10020            ; al = 0 if no error occurred
                xchg    eax, ebx                ; 1 = exit system call number
                int     0x80                    ; exit(ebx)
msg:            db      "Hello, world!", 10
