.model SMALL
.stack 100h
.data
    px dw 100 ; dw = define word, reserva 16 bits com valor inicial 100
    py dw 10

.code


MAIN proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 0013h
    int 10h         ; modo (video, segmento come?a em A000h)
    
    mov ax, 0A000h
    mov es, ax
    
    
    
    ; deslocamento = x + y   * 320
    
    mov ax, py
    mov bx, 320
    mul bx
    
    mov dx, ax          ; armazena em dx o resultado da multiplica??o de y * 320
    add dx, px          ; soma com o x o resultado de y * 320
    
    mov di, dx          ; move pro destination index
    mov al, 0Ch         ; cor vermelho claro
    
    mov cx, 10          ; quantidade de linhas
    
linhas:
    push cx             ; guarda o contador de linhas na pilha
    mov cx, 20          ; quantos pixeis

colunas:
    mov es:[di], al
    inc di
    
    loop colunas
    
    pop cx
    
    add di, 300 
  
    loop linhas
    

    
    
    
    
    
    
    
    
    mov ax, 0000h
    int 16h         ; espera uma tecla
    
    mov ax, 0003h
    int 10h         ; modo (texto)
 
    
    mov ax, 4C00h
    int 21h
    
MAIN endp

end MAIN