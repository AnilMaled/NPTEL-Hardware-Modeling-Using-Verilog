//generate blok

module bitwise_xor (f,a,b);
       parameter N = 16;
       input[N-1:0] a,b;
       output[N-1:0] f;
       genvar i;

       generate for(i=0;i<N;i=i+1)
           begin:xorlp
           xor xg (f[i],a[i],b[i]);
           end
       endgenerate

    
endmodule