.386 
.model flat,c
.code
Reverser	proc ;Prolog pusing registers unto stack
			push ebp
			mov ebp,esp
			push esi
			push edi	

			;Invalid Array size check.
			xor eax,eax
			;Getting function parameters by offsetting the base pointer.
			mov edi, [ebp+8]
			mov esi, [ebp+12]
			mov ecx, [ebp+16]
			test	ecx,ecx

			lea esi, [esi+ecx*4-4] ;Getting address of last index in source array
			pushfd
			std
			;Loop to reverse array
@@:			lodsd	
			mov [edi], eax
			add edi,4
			dec ecx
			jnz @B

			popfd
			mov eax,1

			;Epilog
			pop edi
			pop esi
			pop ebp

			ret

Reverser	endp
			end

