# turing complete 8 bit overture cpu

# instructions
const push  0b00000000 # immediate
const mov   0b10000000 # copy
const jmp   0b11000100 # condalways
const jmpif 0b11000000 # condition
const in    0b10110000 # input
const out   0b10000110 # output

# alu
const or    0b01000000 # or
const nand  0b01000001 # nand
const nor   0b01000010 # nor
const and   0b01000011 # and
const add   0b01000100 # add
const sub   0b01000101 # sub

# arguments (condition)
const no    0b00000000 # never
const eq0   0b00000001 # ==0
const lt0   0b00000010 # <0
const le0   0b00000011 # <=0
const yes   0b00000100 # always
const ne0   0b00000101 # !=0
const ge0   0b00000110 # >=0
const gt0   0b00000111 # >0

# registers
const r0_s  0b00000000 # reg0
const r0_d  0b00000000 # reg0
const a1_s  0b00001000 # reg1/alu1
const a1_d  0b00000001 # reg1/alu1
const a2_s  0b00010000 # reg2/alu2
const a2_d  0b00000010 # reg2/alu2
const a3_s  0b00011000 # reg3/alu3
const a3_d  0b00000011 # reg3/alu3
const r4_s  0b00100000 # reg4
const r4_d  0b00000100 # reg4
const r5_s  0b00101000 # reg5
const r5_d  0b00000101 # reg5

# robo cmds
const right 0
const down  1
const left  2
const up    3
const wait  4
const use   5
const shoot 6

const null  0
const wall  1
const door  3
const coin  8

push | up
mov | r0_s | r5_d

label start
push | use
out | r0_s
out | r5_s
mov | r5_s | a2_d
push | 1
mov | r0_s | a1_d
add
push | 3
mov | r0_s | a1_d
mov | a3_s | a2_d
and
mov | a3_s | r5_d
out | r5_s
push | use
out | r0_s
label change
in | a2_d
push | 7
mov | r0_s | a1_d
and
push | start
jmpif | eq0
push | 3
mov | r0_s | a1_d
mov | r5_s | a2_d
add
mov | a3_s | a2_d
and
mov | a3_s | r5_d
out | r5_s
push | use
out | r0_s
push | change
jmp
