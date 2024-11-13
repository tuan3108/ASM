.model small
.stack 100h
.data
    str db 100 dup("$")
    tb1 db 10, 13, "Chuoi da dao nguoc: $" 
    tb2 db 10, 13, "Nhap Chuoi: $"
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        lea dx, tb2
        mov ah, 9
        int 21h
        
        lea dx, str
        mov ah, 10
        int 21h
        
        lea dx, tb1
        mov ah, 9
        int 21h
        
        mov cl, [str+1]
        lea si, [str+2]
        
     lap:
        cmp cl, 0
        je lap2 
        mov al, [si]
        push ax
        inc si  
        dec cl
        jmp lap
     
        
     lap2:
        cmp cl, [str + 1]
        je ketthuc
        pop dx
        mov ah, 2
        int 21h
        inc cl
        jmp lap2
        
     ketthuc:  
        mov ah, 4ch
        int 21h
        
        main endp
    end main