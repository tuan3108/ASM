.model small
.stack 100h
.data
    s1 db 'Nhap so thap phan:$'
    s2 db 10, 13, 'So nhi phan:$'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 48
        
        mov cl, 0
        mov bl, 2
chiatiep:
        mov ah, 0
        div bl
        push ax
        inc cl
        cmp al, 0
        jg chiatiep
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ch, 0
        mov ah, 2
        
intiep:
        pop dx
        mov dl, dh
        add dl, 48
        int 21h
        loop intiep
        
        mov ah, 4ch
        int 21h
        main endp
    end main
        