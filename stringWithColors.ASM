format MZ
stack stk:256
entry codseg:main
segment sdat use16
znak db 18h,6Eh,89h,89h,88h,48h,28h,18h,8h,0Ch,0Ah,09h,89h,89h,6Eh,18h
segment stk use16
db 256 dup (?)
segment codseg use16
main:
push es
mov bx,sdat
mov es,bx

mov al, 03h  ; ustawienie trybu graficznego
mov ah, 0h
int 10h

mov ah, 11h   ;
mov al, 00h
mov bp, znak  ;przesylamy znak do BP
mov cx, 1      ; liczba znakow na bajt
mov dx, 45h   ; offset pierwszego znaku
mov bl, 0     ; liczba wierszy zdefiniowana w rejestrze DL
mov bh, 16    ; liczba znakow ba bajt
int 10h

mov ah, 09h   ; ustawienie funkcji 09h
mov al, 45h   ; kod znaku, kod ascii dla litery D - 44h, ktora ma byc zamieniona na dany ksztalt
mov bh, 0h    ; numer strony pamieci ekranu
mov bl, 00001110b     ; kolor   _ migotanie:_ _ _ : RGB kolor
;mov bl, 00000101b     ; kolor   _ migotanie:_ _ _ : RGB kolor
mov cx, 08h	      ; ile razy ma sie wyswietlic znak
int 10h

mov ah, 01h	    ; zakonczenie programu
mov al, 44h
int 21h

pop es
mov ax,4C00h
int 21h
ret