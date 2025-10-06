airithemetic operators
+  =  unary(operats on single data item)ex +a,-a,-(a+b)
-  =unary
+,-=binary(a+b,A-b)

same as c program

logical operators:logic values true or false(true=1,false=0)
this operators can be used in conditional statements
! =logical negation
&& =logical and
|| =logical or

relational operators:perporm relational operation or in conditional statements
this operatorsgives boolen value
!= =not equal
== equal
>=
<=
>
<

Bitwise operators:
~ Bitwise not
& Bitwise and     (~ is called tilda)
| Bitwise or
^ Bitwise xor
~^ Bitwise xnor

redutional operators:take input from multifal bit and canvert single bit operation
this all are unary
it models a gate
~ Bitwise not
& Bitwise and     (~ is called tilda)
| Bitwise or
^ Bitwise xor
~^ Bitwise xnor
Ex: wire[3:0]a,b,c;wire f1;
    assign a=4'b0111;
    assign f1=^a;//gives 1 it perform xor gate operation by taking all bits as input

shift operators
>> right(/2)  add zeros on right side
<< left(*2)   add zeros on left side
>>> 2's compliment number system
    add the msb bit on rigt side


conditional operators:
cond_exp?true_exp:false_exp;
ex:  wire a,b,c;
     wire[7:0]x,y,z;
     assign a=(b>c)?b:c;
     assign z=(x==y)?x+2:x-2;

concatenation operators:Joins together bits from two or more com m a-separated expressions.
{....,....,...}
ex:assign f={a,b};//if a is 3 bit vector and b is 4 bit vector it concante the value and assign 7 bit vector
   assign g={a,3'b110,b};
   assign h={x[2],y[0],a};


Replication operators:joins togeter with n copies
ex:assign f=3{2'b11}


                      MODELIONG IN VERILOG
1)Beheviaral MODELIONG   
     starting point    
                   
2)structural modeling
     hardwzre implimentation
     using and gates