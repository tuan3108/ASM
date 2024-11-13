.model small
.stack 100h
.data
    tb1 db "Nhap 1 ki tu: $:"
    tb2 db 13, 10, "Ki tu in hoa la: $"
    
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 1
        ;mov bl, al
        int 21h
        
        sub al, 20h
        mov bl, al
        int 21h
        
        mov ah, 9
        lea dx, tb2
        int 21h
        
        lea dl, bl
        mov ah, 2
        int 21h
          
        
    main endp
end main