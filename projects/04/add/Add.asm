    @i //適当なアドレスが振られる.DRAMの16番地から変数が割り当てられる
    M=1 //Aレジスタが指す16番地のレジスタに1を代入
    @sum //17番地にsumを宣言
    M=0 //Aレジスタのsum番地のレジスタに0を代入
(LOOP)
    @i //Aレジスタにiのアドレスを代入
    D=M //Aレジスタが指すiの値をDレジスタに代入
    @99 //Aレジスタに99を代入
    D=D-A //i-100を計算し,Dレジスタに代入
    @END //プログラムROMのENDラベルがあるところのアドレスをAregに代入
    D;JGT //Dregの値が0以上ならAreg(END)にジャンプ
    @i
    D=M
    @sum
    M=D+M
    @i
    M=M+1
    @LOOP
    0;JMP
(END)
    @END
    0;JMP