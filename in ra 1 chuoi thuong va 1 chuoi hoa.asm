.model small
.stack 100h
.data
    tb1 db 13, 10, "Chuoi in thuong: $"
    tb2 db 13, 10, "Chuoi in hoa: $"
    str db 100, ?,  100 dup("$")

.code
    main proc
        
        mov ax, @data
        mov ds, ax
        
        lea dx, str
        mov ah, 0ah
        int 21h
        
        lea dx, tb1
        mov ah, 9
        
        int 21h
        call inthuong
        
        lea dx, tb2
        mov ah, 9
        
        int 21h
        call inhoa
        
        mov ah, 4ch
        int 21h
        
        main endp
    
    inthuong proc
        lea si, str+2
        lap1:
            mov dl, [si]
            cmp dl, "$"
            je thoat1
            
            cmp dl, 'A'
            jb in1
            cmp dl, 'Z'
            ja in1
            add dl, 32
        in1:
            mov ah, 2
            int 21h
            inc si
            jmp lap1
        thoat1:
            ret
    inthuong endp
    
    inhoa proc
        lea si, str+ 2
        lap2:
            mov dl, [si]
            cmp dl, "$"
            je thoat2
            cmp dl, 'a'
            jb in2
            cmp dl, 'z'
            ja in2
            sub dl, 32
        in2:
            mov ah, 2
            int 21h
            inc si
            jmp lap2
        thoat2:
            ret
    inhoa endp
end main
    
    
        
        
        
        