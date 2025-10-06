//FSM finite state machins

//moores roole =output depends only on current state not on what is the input

module slight(clk,light);
input clk;
output reg[0:2] light;
parameter s0 =0,s1=1,s2=2 ;
parameter red=3'b100,green=3'b010,yellow=3'b001;
reg[0:1] state;

always @(posedge clk)
    case (state)
        s0:begin   //like if s0==1
            light<=green; state<=s1;  ///non bloking assignment 
        end
        s1:begin
            light<=yellow; state<=s2;
        end
        s2:begin
            light<=red; state<=s0;
        end 
        default: begin
            light<=red;
            state<=s0;
            end
        
    endcase
endmodule


 
//desgine of serial parity ditector
/*A continuous stream Of bits is fed to a circuit in synchronism with a Clock. The
circuit will be generating a bit stream as output, where a O will indicate "even
number Of I's seen so far" and a I will indicate "odd nurnber Of 1 's seen so far'*/
//moores machine
module parity_gen(x,clk,z);
input clk,x;
output reg z;
reg even_odd; //the machine state
parameter Even=0, Odd=1;
always @(posedge clk)
  case(even_odd)
   Even:begin
    z<= x?1:0;
    even_odd<=x?Odd:Even;    //hear we are using non blockig assignment so it generates laches to store the values of z
   end
   Odd:begin
    z<=x?Even:Odd;
    even_odd<=x?Even:Odd;
   end
   default:even_odd<=Even;
 endcase
   /*                    //this code will suthesis latch for the output
   case(even_odd)
     Even:even_odd<=x?Odd:Even;
     Odd:even_odd<=x?Even:Odd;
     default:even_odd<=even;
    endcase
    always @(even_odd) begin
        case(even_odd)
        Even:z=0;
        Odd:z=1;
        endcase
        
    end
     */
endmodule