.model small
.stack 100h
.data
    str db 100 dup("$")  ; Khai b�o chu?i d�ng format
    msg db 13, 10, "Ky tu lon nhat trong chuoi la: $"
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ; Nh?p chu?i
        lea dx, str
        mov ah, 0Ah
        int 21h
        
        ; T�m k� t? l?n nh?t
        lea si, str+2    ; B?t d?u t? k� t? d?u ti�n
        mov bl, [si]     ; G�n k� t? d?u ti�n l�m gi� tr? l?n nh?t
        inc si          ; Tang ch? s?
        mov cl, [str+1]  ; L?y d? d�i chu?i
        dec cl          ; Gi?m 1 do d� b?t d?u t? k� t? th? 2
    start:
        cmp cl, 0       ; Ki?m tra d� duy?t h?t chu?i chua
        je print_max
        mov al, [si]    ; L?y k� t? hi?n t?i
        cmp al, bl      ; So s�nh v?i gi� tr? l?n nh?t
        jge update_max  ; N?u l?n hon ho?c b?ng, c?p nh?t
        inc si         ; Tang ch? s?
        dec cl         ; Gi?m d? d�i c�n l?i
        jmp start      ; L?p
    update_max:
        mov bl, al     ; C?p nh?t gi� tr? l?n nh?t
        inc si        ; Tang ch? s?
        dec cl        ; Gi?m d? d�i c�n l?i
        jmp start     ; L?p
    print_max:
        ; In ra k� t? l?n nh?t
        lea dx, msg
        mov ah, 9
        int 21h
        mov dl, bl
        mov ah, 2
        int 21h
        
        ; K?t th�c chuong tr�nh
        mov ah, 4Ch
        int 21h
    main endp
end main