#32-bit program
.data 
	str1: .string "$102220110221def"
	str2: .string "1024"
.text
main:
	addi s2,x0,16 #母串长度len1
	addi s3,x0,4 #子串长度len2
	lui s4,0x00010010  #母串地址str
	addi s5,s4,17    #子串地址pattern
	jal ra,find_substr
	ori a7,x0,1
	ecall
	jal x0,exit
	
find_substr:
	addi sp,sp,-16
	sw ra 16(sp)
	sw s2 12(sp)
	sw s3 8(sp)
	sw s4 4(sp)
	sw s5 0(sp) #保存参数
	addi t0,x0,-1 #pos
	addi t1,x0,0 #i
L1:
	bge t1,s2,exit1
	addi t2,x0,0 #j
L2:
	bge t2,s3,exit2
	add t3,t1,t2 #i+j
	add t3,s4,t3 #s[i+j]:char,address
	add t4,s5,t2 #p[j]:char.address
	lb t3,0(t3) #s[i+j]:char
	lb t4,0(t4) #p[j]:char
	bne t3,t4,exit2 #s[i+j]!=p[j] break
	addi t3,t2,0 #j.copy
	addi t4,s3,-1 #len2-1
	beq t3,t4,if #j==len2-1 break
	addi t2,t2,1 #j++
	jal x0,L2 #jump
if:
	addi t0,t1,0 #pos=i
	jal x0,exit2 #jump
exit2:
	addi t2,x0,-1 #-1
	bne t0,t2,exit1 #pos!=-1 break
	addi t1,t1,1 #i++
	jal x0,L1 #jump
exit1:
	addi a0,t0,0
	lw ra 16(sp)
	lw s2 12(sp)
	lw s3 8(sp)
	lw s4 4(sp)
	lw s5 0(sp)
	addi sp,sp,16 #取出参数
	jalr x0,0(ra)
exit:
