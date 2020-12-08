/**********
* not_A
* input: logic [7:0] a
* output: tri [7:0] s
**********/
module not_A(
	input logic [7:0] a,
	output tri [7:0] s);
	assign s =~ a;
endmodule

/**********
* not_B
* input: logic [7:0] b
* output: tri [7:0] s
**********/
module not_B(
	input logic [7:0] b,
	output tri [7:0] s);
	assign s =~ b;
endmodule

/**********
* A_or_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_or_B(
	input logic [7:0] a,
	input logic [7:0] b,
	output tri [7:0] s);
	assign s = a | b;
endmodule

/**********
* A_and_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_and_B(
	input logic [7:0] a,
	input logic [7:0] b,
	output tri [7:0] s);
	assign s = a & b;
endmodule

/**********
* A_xor_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_xor_B(
	input logic [7:0] a,
	input logic [7:0] b,
	output tri [7:0] s);
	assign s = a ^ b;
endmodule

/**********
* mux16
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module mux16(input logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15,
			 input logic [3:0] s,
			 output tri [7:0] y);
	assign y = s[3]?(s[2]?(s[1]?(s[0]?d15:d14):(s[0]?d13:d12))
				:(s[1]?(s[0]?d11:d10):(s[0]?d9:d8)))
				:(s[2]?(s[1]?(s[0]?d7:d6):(s[0]?d5:d4)):
				(s[1]?(s[0]?d3:d2):(s[0]?d1:d0)));	
endmodule

/**********
* fulladder
* input: logic a
* input: logic b
* input: logic c_in
* output: tri s
* output: tri c_out
**********/
module fulladder(
	input logic a, b, c_in,
	output tri s, c_out);	
	assign s = a ^ b ^ c_in;
	assign c_out = ((a ^ b) & c_in) | (a & b);
endmodule

/**********
* A_lsl_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_lsl_B(input logic [7:0] a,
			   input logic [7:0] b,
			   output tri [7:0] s);
	
	assign s = b[2] ? (b[1] ? (b[0] ? a<<7 : a<<6)
				   		    : (b[0] ? a<<5 : a<<4))
					: (b[1] ? (b[0] ? a<<3 : a<<2)
				   		    : (b[0] ? a<<1 : a<<0));
endmodule

/**********
* A_lsr_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_lsr_B(input logic [7:0] a,
			   input logic [7:0] b,
			   output tri [7:0] s);
	
	assign s = b[2] ? (b[1] ? (b[0] ? a>>7 : a>>6)
				   		    : (b[0] ? a>>5 : a>>4))
					: (b[1] ? (b[0] ? a>>3 : a>>2)
				   		    : (b[0] ? a>>1 : a>>0));
endmodule

/**********
* A_asr_B
* input: logic signed [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_asr_B(input logic [7:0] a,
			   input logic [7:0] b,
			   output tri [7:0] s);
		
	assign s = b[2] ? (b[1] ? (b[0] ? a>>>7 : a>>>6)
				   		    : (b[0] ? a>>>5 : a>>>4))
		 			: (b[1] ? (b[0] ? a>>>3 : a>>>2)
				   		    : (b[0] ? a>>>1 : a>>>0));
endmodule

/**********
* A_rol_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_rol_B(input logic [7:0] a,
			   input logic [7:0] b,
			   output tri [7:0] s);

	assign s = b[2] ? (b[1] ? (b[0] ? {a[0],a[7:1]} : {a[1:0],a[7:2]})
				   		    : (b[0] ? {a[2:0],a[7:3]} : {a[3:0],a[7:4]}))
		 			: (b[1] ? (b[0] ? {a[4:0],a[7:5]} : {a[5:0],a[7:6]})
				   		    : (b[0] ? {a[6:0],a[7]} : a));


endmodule 

/**********
* A_ror_B
* input: logic [7:0] a
*        logic [7:0] b
* output: tri [7:0] s
**********/
module A_ror_B(input logic [7:0] a,
			   input logic [7:0] b,
			   output tri [7:0] s;

	assign s = b[2] ? (b[1] ? (b[0] ? {a[6:0],a[7]} : {a[5:0],a[7:6]})
				   		    : (b[0] ? {a[4:0],a[7:5]} : {a[3:0],a[7:4]}))
		 			: (b[1] ? (b[0] ? {a[2:0],a[7:3]} : {a[1:0],a[7:2]})
				   		    : (b[0] ? {a[0],a[7:1]} : a));

endmodule 