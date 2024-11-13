.model small
.stack 100h
.data
    tb1 db 10, 13, "Nhap day ki tu: $"
    tb2 db 10, 13, "In hoa: $"
    str db 100, ?, 100 dup("$")
.code     
    main proc
        
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, tb1
        int 21h
        
        lea dx, str
        mov ah, 10
        int 21h
        
        mov ah, 9
        lea dx, tb2
        int 21h
        
        lea si, [str+2]
        mov cl, [str+1]
        mov ch, 0
        
    intiep:
        cmp cl, 0
        je thoat
        
        mov al, [si]
        cmp al, 'a'
        jl in1
        cmp al, 'z'
        jg in1
        sub al, 32
        
    in1:
        mov dl, al
        mov ah, 2
        int 21h
        inc si
        loop intiep
    thoat:   
        mov ah, 4ch
        int 21h
        
        main endp
    end main