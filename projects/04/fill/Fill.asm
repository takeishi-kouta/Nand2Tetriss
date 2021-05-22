// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//R1=0(ループ回数)
@0
D=A
@R1
M=D

(MAINLOOP)
@24576
D=M

@LOOP
D;JEQ

//Keyが押されているときはR0=-1を代入して黒くする
@32767
D=A+1
D=D|A
//2^16-1をR0に保存
@R0
M=D

(LOOP)
@R1
D=M
@8192
D=D-A

@ENDFILL
D;JEQ

@R1
D=M

//R2=SCREEN+R0とする
@SCREEN
D=A+D
@R2
M=D

@R0
D=M

//R2のアドレスをAレジスタに入力
//Aレジスタの値を参照してSCREEN+R0をAレジスタに入力
//AレジスタのアドレスのROMを参照し、0xffffを書き込む
@R2
A=M
M=D

//R1++
@R1
M=M+1

@LOOP
0;JMP

(ENDFILL)
//R0,R1=0に初期化
@0
D=A
@R0
M=D
@R1
M=D

@MAINLOOP
0;JMP