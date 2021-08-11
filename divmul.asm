.386
.model flat, c

.code
IntegerMulDiv	proc
		push ebp
		mov ebp, esp
		push ebx ;Intend to change the contents of the ebx, so I am saving the old contents on the stack

		xor eax, eax ;Set the eax register to zero, in the fastest way possible(usually)
		mov ecx, [ebp+8] ;Move the first argument "a" into exc
		mov edx, [ebp+12] ;Move the second argument "b" into exc

		or edx, edx ;If result is 0, then ZF is set to 1, otherwise ZF is 0;
		jz InvalidDivisor ;Jump if zero flag is set which would normally result in a divide by zero erro
		imul edx, ecx ;Signed multiplaction of edx and ecx, basically a*b, stored in edx

		mov ebx, [ebp+16] ;Move the product pointer arguemnt into ebx, now the address of the prod variables is in ebx
		mov [ebx], edx ;Move the result of the earlier multiplication into the address stores in ebx aka the prod variable

		mov eax, ecx ;Move argument "a" into eax register
		cdq ;Converts the double word(32 bits) in EAX into a quad word(64 bits) where the most significant bits(Copies of the rightmost bit in EAX) is stored in EDX
		idiv dword ptr[ebp+12] ;Divide the contents of the EDX:EAX registers with the DWORD located at ebp+12, or argument "b"; EAX will store the quotient and EDX will store the remainder
		mov ebx, [ebp+20] ;Move the address in the quotient pointer into ebx
		mov [ebx], eax ;Move the quotient stored in EAX from the earlier IDIV into the address stored by ebx
		mov ebx, [ebp+24] ;;Move the address in the remainder pointer into ebx
		mov [ebx], edx ; ;Move the remainder stored in EDX from the earlier IDIV into the address stored by ebx
		mov eax, 10 ;1 is stores in EAX as the return value

InvalidDivisor: ;epilog, clear the stack and return in preparation for procedure and program end
		pop ebx
		pop ebp
		ret
IntegerMulDiv endp
		end

