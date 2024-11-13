.model small
.stack 100h
.data
    tb1 db "Nhap 1 ki tu: $"
    tb2 db 13, 10, "Ki tu vua nhap la: $"
    c db ?
.code
    main proc ;Nhap 1 ki tu va xuat ra man hinh
       mov ax, @data
       mov ds, ax
       
       mov ah, 9
       lea dx, tb1 
       int 21h
       
       mov ah, 1
       int 21h
       mov bl, al
       
       
       mov ah, 9
       lea dx, tb2
       int 21h
       
       mov dl, bl
       mov ah, 2
       int 21h 

    main endp
end main