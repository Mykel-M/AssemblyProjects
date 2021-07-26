.386
.model	flat

.data
intArray SWORD 0,0,0,1,3,0,-12,-18,5,7

.code
main	proc
		mov ebx, OFFSET intArray ;Returns the base + the offest from the start of the base and moves it into ebx. Essentially ebx now points to the start of the array
		mov ecx, LENGTHOF intArray ;Get the number of array elements and move into count register

LI:
		cmp WORD PTR[ebx], 0 ;cmp WORD PTR means compare the 16 bit representation of zero with the value stored AT the address in the register EBX
		jnz found ;if the zero flag is set, jump to found. The flag is set if cmp evals to zero
		add ebx, 2 ;point to the next two bytes/ next value in the array
		loop LI ;Will loop and decrement the count register until zero or until non-zero value is found.
		jmp notFound

found:
		movsx eax, WORD PTR[ebx] ;Convert the non-zero value pointed to by ebx into a regular WORD and move it into the eax register
		jmp quit ;Unconditional jump to quit

notFound:
		mov eax, 999999 ;Indicates that there was no non-zero value found

quit:
	ret

main	endp
end		main