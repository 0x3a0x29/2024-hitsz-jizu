#32-bit program
.data 
	str1: .string "input str:"
	str2: .string "input pattern:"
	str: .string ","
.text
main:
	lui a0,0x00010010
	addi a7,x0,4
	ecall #��ӡstr1
	addi a0,a0,64 #ĸ���洢
	addi a1,x0,64 #������볤��
	addi a7,x0,8
	ecall #����ĸ��
	lui a0,0x00010010
	addi a0,a0,11
	addi a7,x0,4
	ecall #��ӡstr2
	lui a0,0x00010010
	addi a0,a0,132 #�Ӵ��洢
	addi a7,x0,8
	ecall
	lui t1,0x00010010
	addi s4,t1,64  #ĸ����ַ
	addi s5,t1,132 #�Ӵ���ַ
	addi s6,t1,26 #�������ַ
	jal ra,find_substr
	jal x0,end
find_substr:
	addi sp,sp,-20
	sw ra 20(sp)
	sw s2 16(sp)#�ں�����ʹ�õ��Ĵ���s2��Ϊ��ʱ�Ĵ���,��ǰ������ѹ��ջ
	sw s3 12(sp) #�ں�����ʹ�õ��Ĵ���s3��Ϊ��ʱ�Ĵ���,��ǰ������ѹ��ջ
	sw s4 8(sp)
	sw s5 4(sp)
	sw s6 0(sp) #�������
	addi t5,x0,0
	addi t6,sp,0 #����sp
	addi s2,x0,-1 #len1
	addi s3,x0,-1 #len2
	addi t1,x0,10
L4: #���len1
	addi s2,s2,1
	add t5,s2,s4
	lb t5,0(t5)
	bne t5,t1,L4
L5: #���len2
	addi s3,s3,1
	add t5,s3,s5
	lb t5,0(t5)
	bne t5,t1,L5
	addi t0,x0,-1 #pos
	addi t1,x0,0 #i
L1:
	bge t1,s2,exit1 #i<len1
	addi t2,x0,0 #j
L2:
	bge t2,s3,exit2 #j<len2
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
	bne t0,t2,addnum #pos!=-1 
	addi t1,t1,1 #i++
	jal x0,L1 #jump
addnum:
	addi sp,sp,-4
	sw t0,0(sp)
	addi t0,x0,-1
	jal x0,exit2 #jump
exit1:
	bne sp,t6,print
	ori a0,x0,-1
	ori a7,x0,1
	ecall   #outcome:-1
	jal x0,exit
print:
	lw a0,0(sp)
	ori a7,x0,1
	ecall #outcome
	addi a0,s6,0
	ori a7,x0,4 #�����
	ecall
	addi sp,sp,4
	bne sp,t6,print
exit:
	lw ra 20(sp)
	lw s2 16(sp)
	lw s3 12(sp)
	lw s4 8(sp)
	lw s5 4(sp)
	lw s6 0(sp)
	addi sp,sp,20 #ȡ������
	jalr x0,0(ra)
end:
