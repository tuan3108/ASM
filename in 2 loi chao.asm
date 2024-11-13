.model small
.stack 100h
.data
    tb1 db "Xin Chao$"
    tb2 db 13, 10, "Hello$"
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        lea dx, tb2
        int 21h

        
        
    main endp
end main