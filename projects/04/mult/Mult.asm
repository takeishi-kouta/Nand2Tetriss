// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    //R2のアドレスをAレジスタに入れる
    //Aレジスタの値からメモリを参照し,0を入れる
    //R2 = 0と同じ
    @R2
    M=0 //データメモリ->Mと省略

(LOOP)
    //R0回R1をmultに加算する

    //DレジスタのR0が0ならばENDに飛ぶ
    @R0
    D=M
    @END
    D;JEQ 

    //R1のアドレス(1)をAレジスタに入れる
    //DレジスタにAレジスタの値からメモリを参照し、値を入れる
    //Dレジスタ=R1と同じ
    @R1
    D=M

    @R2
    M=D+M

    @R0
    M=M-1

    //AレジスタにLOOPを入れる
    //PCをAレジスタの値に書き換えることでジャンプする
    @LOOP
    0;JMP

//プログラム終了のための無限ループ
(END)
    @END
    0;JMP //HALT