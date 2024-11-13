.model small
.stack 100h
.data
    tb1 db "Nhap vao chuoi: $"
    tb2 db 13, 10, "Chuoi vua nhap la: $"
    str db 10, ?, 10 dup("$")  
    
.code
main proc
    mov ax, @data
    mov ds, ax
    

    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 0Ah
    lea dx, str
    int 21h
    
    mov ah, 9
    lea dx, tb2
    int 21h
    
    lea dx, str + 2  
    int 21h
    
    mov ah, 4Ch
    int 21h
main endp
end main