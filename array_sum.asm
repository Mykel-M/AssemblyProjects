.386
.model flat

.data
intArray DWORD 10000h, 20000h, 30000h, 40000h;

.code
start proc
	mov edi, OFFSET intArray ;Move the offset of the intArray into the edi register. We are moving how far the array is from the start of the data segment its on
	mov ecx, LENGTHOF intArray ;Get the number of elements in the array and move it into the count register
	mov eax, 0 ;Set accumulator to zero  

LP:
	add eax, [edi]  ;Add the content, not the address, to the eax register which was set to zero earlier                           
	add edi, TYPE intArray ;The type of intArray is DWORD which is 2 bytes or 16 bits. The address in edi is incremented by 16 bits, pointing to the next element in the array
	loop LP ;loops the program
	ret

start	endp
end		start
