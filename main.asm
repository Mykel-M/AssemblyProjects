.386
.model flat

PBYTE typedef	PTR BYTE ;Pointer to a byte
PWORD typedef	ptr	word	;Pointer to a word
PDWORD typedef	ptr	DWORD	;Pointer to a DWORD

.data
arrayB BYTE	10h,20h,30h
arrayW WORD 1,2,3
arrayD DWORD 4,5,6

pt_1 PBYTE	arrayB
pt_2 PWORD	arrayW
pt_3 PDWORD	arrayD

.code
start proc
	mov esi,pt_1
	mov al, [esi] ;Lower 8 bits up AX will be 10h
	mov esi, pt_2
	mov ax, [esi] ;Lower 16bits of EAX will be 1
	mov esi, pt_3
	mov eax, [esi] ;EAX will contain 4

	ret
start endp
end start