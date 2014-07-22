//======================================================================
//
// aes_inv_sbox.v
// --------------
// The inverse AES S-box. Basically a 256 Byte ROM.
//
//
// Copyright (c) 2013 Secworks Sweden AB
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or 
// without modification, are permitted provided that the following 
// conditions are met: 
// 
// 1. Redistributions of source code must retain the above copyright 
//    notice, this list of conditions and the following disclaimer. 
// 
// 2. Redistributions in binary form must reproduce the above copyright 
//    notice, this list of conditions and the following disclaimer in 
//    the documentation and/or other materials provided with the 
//    distribution. 
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS 
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, 
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF 
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module aes_inv_sbox(
                    input wire [31 : 0] sword,
                    output wire [31 : 0] new_sword
                   );

  
  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [7 : 0] tmp_new_sbox0;
  reg [7 : 0] tmp_new_sbox1;
  reg [7 : 0] tmp_new_sbox2;
  reg [7 : 0] tmp_new_sbox3;


  //----------------------------------------------------------------
  // Concurrent assignments for ports.
  //----------------------------------------------------------------
  assign new_sboxw = {tmp_new_sbox0, tmp_new_sbox1,
                      tmp_new_sbox2, tmp_new_sbox3};
  
  
  //----------------------------------------------------------------
  // inv_sbox_rom0
  //
  // The logic implemeting the ROM with mux.
  //----------------------------------------------------------------
  always @*
    begin : inv_sbox_rom0
      case(sboxw[31 : 24])
        8'h00: tmp_new_sbox0 = 8'h52;
	8'h01: tmp_new_sbox0 = 8'h09;
	8'h02: tmp_new_sbox0 = 8'h6a;
	8'h03: tmp_new_sbox0 = 8'hd5;
	8'h04: tmp_new_sbox0 = 8'h30;
	8'h05: tmp_new_sbox0 = 8'h36;
	8'h06: tmp_new_sbox0 = 8'ha5;
	8'h07: tmp_new_sbox0 = 8'h38;
	8'h08: tmp_new_sbox0 = 8'hbf;
	8'h09: tmp_new_sbox0 = 8'h40;
	8'h0a: tmp_new_sbox0 = 8'ha3;
	8'h0b: tmp_new_sbox0 = 8'h9e;
	8'h0c: tmp_new_sbox0 = 8'h81;
	8'h0d: tmp_new_sbox0 = 8'hf3;
	8'h0e: tmp_new_sbox0 = 8'hd7;
	8'h0f: tmp_new_sbox0 = 8'hfb;
	8'h10: tmp_new_sbox0 = 8'h7c;
	8'h11: tmp_new_sbox0 = 8'he3;
	8'h12: tmp_new_sbox0 = 8'h39;
	8'h13: tmp_new_sbox0 = 8'h82;
	8'h14: tmp_new_sbox0 = 8'h9b;
	8'h15: tmp_new_sbox0 = 8'h2f;
	8'h16: tmp_new_sbox0 = 8'hff;
	8'h17: tmp_new_sbox0 = 8'h87;
	8'h18: tmp_new_sbox0 = 8'h34;
	8'h19: tmp_new_sbox0 = 8'h8e;
	8'h1a: tmp_new_sbox0 = 8'h43;
	8'h1b: tmp_new_sbox0 = 8'h44;
	8'h1c: tmp_new_sbox0 = 8'hc4;
	8'h1d: tmp_new_sbox0 = 8'hde;
	8'h1e: tmp_new_sbox0 = 8'he9;
	8'h1f: tmp_new_sbox0 = 8'hcb;
	8'h20: tmp_new_sbox0 = 8'h54;
	8'h21: tmp_new_sbox0 = 8'h7b;
	8'h22: tmp_new_sbox0 = 8'h94;
	8'h23: tmp_new_sbox0 = 8'h32;
	8'h24: tmp_new_sbox0 = 8'ha6;
	8'h25: tmp_new_sbox0 = 8'hc2;
	8'h26: tmp_new_sbox0 = 8'h23;
	8'h27: tmp_new_sbox0 = 8'h3d;
	8'h28: tmp_new_sbox0 = 8'hee;
	8'h29: tmp_new_sbox0 = 8'h4c;
	8'h2a: tmp_new_sbox0 = 8'h95;
	8'h2b: tmp_new_sbox0 = 8'h0b;
	8'h2c: tmp_new_sbox0 = 8'h42;
	8'h2d: tmp_new_sbox0 = 8'hfa;
	8'h2e: tmp_new_sbox0 = 8'hc3;
	8'h2f: tmp_new_sbox0 = 8'h4e;
	8'h30: tmp_new_sbox0 = 8'h08;
	8'h31: tmp_new_sbox0 = 8'h2e;
	8'h32: tmp_new_sbox0 = 8'ha1;
	8'h33: tmp_new_sbox0 = 8'h66;
	8'h34: tmp_new_sbox0 = 8'h28;
	8'h35: tmp_new_sbox0 = 8'hd9;
	8'h36: tmp_new_sbox0 = 8'h24;
	8'h37: tmp_new_sbox0 = 8'hb2;
	8'h38: tmp_new_sbox0 = 8'h76;
	8'h39: tmp_new_sbox0 = 8'h5b;
	8'h3a: tmp_new_sbox0 = 8'ha2;
	8'h3b: tmp_new_sbox0 = 8'h49;
	8'h3c: tmp_new_sbox0 = 8'h6d;
	8'h3d: tmp_new_sbox0 = 8'h8b;
	8'h3e: tmp_new_sbox0 = 8'hd1;
	8'h3f: tmp_new_sbox0 = 8'h25;
	8'h40: tmp_new_sbox0 = 8'h72;
	8'h41: tmp_new_sbox0 = 8'hf8;
	8'h42: tmp_new_sbox0 = 8'hf6;
	8'h43: tmp_new_sbox0 = 8'h64;
	8'h44: tmp_new_sbox0 = 8'h86;
	8'h45: tmp_new_sbox0 = 8'h68;
	8'h46: tmp_new_sbox0 = 8'h98;
	8'h47: tmp_new_sbox0 = 8'h16;
	8'h48: tmp_new_sbox0 = 8'hd4;
	8'h49: tmp_new_sbox0 = 8'ha4;
	8'h4a: tmp_new_sbox0 = 8'h5c;
	8'h4b: tmp_new_sbox0 = 8'hcc;
	8'h4c: tmp_new_sbox0 = 8'h5d;
	8'h4d: tmp_new_sbox0 = 8'h65;
	8'h4e: tmp_new_sbox0 = 8'hb6;
	8'h4f: tmp_new_sbox0 = 8'h92;
	8'h50: tmp_new_sbox0 = 8'h6c;
	8'h51: tmp_new_sbox0 = 8'h70;
	8'h52: tmp_new_sbox0 = 8'h48;
	8'h53: tmp_new_sbox0 = 8'h50;
	8'h54: tmp_new_sbox0 = 8'hfd;
	8'h55: tmp_new_sbox0 = 8'hed;
	8'h56: tmp_new_sbox0 = 8'hb9;
	8'h57: tmp_new_sbox0 = 8'hda;
	8'h58: tmp_new_sbox0 = 8'h5e;
	8'h59: tmp_new_sbox0 = 8'h15;
	8'h5a: tmp_new_sbox0 = 8'h46;
	8'h5b: tmp_new_sbox0 = 8'h57;
	8'h5c: tmp_new_sbox0 = 8'ha7;
	8'h5d: tmp_new_sbox0 = 8'h8d;
	8'h5e: tmp_new_sbox0 = 8'h9d;
	8'h5f: tmp_new_sbox0 = 8'h84;
	8'h60: tmp_new_sbox0 = 8'h90;
	8'h61: tmp_new_sbox0 = 8'hd8;
	8'h62: tmp_new_sbox0 = 8'hab;
	8'h63: tmp_new_sbox0 = 8'h00;
	8'h64: tmp_new_sbox0 = 8'h8c;
	8'h65: tmp_new_sbox0 = 8'hbc;
	8'h66: tmp_new_sbox0 = 8'hd3;
	8'h67: tmp_new_sbox0 = 8'h0a;
	8'h68: tmp_new_sbox0 = 8'hf7;
	8'h69: tmp_new_sbox0 = 8'he4;
	8'h6a: tmp_new_sbox0 = 8'h58;
	8'h6b: tmp_new_sbox0 = 8'h05;
	8'h6c: tmp_new_sbox0 = 8'hb8;
	8'h6d: tmp_new_sbox0 = 8'hb3;
	8'h6e: tmp_new_sbox0 = 8'h45;
	8'h6f: tmp_new_sbox0 = 8'h06;
	8'h70: tmp_new_sbox0 = 8'hd0;
	8'h71: tmp_new_sbox0 = 8'h2c;
	8'h72: tmp_new_sbox0 = 8'h1e;
	8'h73: tmp_new_sbox0 = 8'h8f;
	8'h74: tmp_new_sbox0 = 8'hca;
	8'h75: tmp_new_sbox0 = 8'h3f;
	8'h76: tmp_new_sbox0 = 8'h0f;
	8'h77: tmp_new_sbox0 = 8'h02;
	8'h78: tmp_new_sbox0 = 8'hc1;
	8'h79: tmp_new_sbox0 = 8'haf;
	8'h7a: tmp_new_sbox0 = 8'hbd;
	8'h7b: tmp_new_sbox0 = 8'h03;
	8'h7c: tmp_new_sbox0 = 8'h01;
	8'h7d: tmp_new_sbox0 = 8'h13;
	8'h7e: tmp_new_sbox0 = 8'h8a;
	8'h7f: tmp_new_sbox0 = 8'h6b;
	8'h80: tmp_new_sbox0 = 8'h3a;
	8'h81: tmp_new_sbox0 = 8'h91;
	8'h82: tmp_new_sbox0 = 8'h11;
	8'h83: tmp_new_sbox0 = 8'h41;
	8'h84: tmp_new_sbox0 = 8'h4f;
	8'h85: tmp_new_sbox0 = 8'h67;
	8'h86: tmp_new_sbox0 = 8'hdc;
	8'h87: tmp_new_sbox0 = 8'hea;
	8'h88: tmp_new_sbox0 = 8'h97;
	8'h89: tmp_new_sbox0 = 8'hf2;
	8'h8a: tmp_new_sbox0 = 8'hcf;
	8'h8b: tmp_new_sbox0 = 8'hce;
	8'h8c: tmp_new_sbox0 = 8'hf0;
	8'h8d: tmp_new_sbox0 = 8'hb4;
	8'h8e: tmp_new_sbox0 = 8'he6;
	8'h8f: tmp_new_sbox0 = 8'h73;
	8'h90: tmp_new_sbox0 = 8'h96;
	8'h91: tmp_new_sbox0 = 8'hac;
	8'h92: tmp_new_sbox0 = 8'h74;
	8'h93: tmp_new_sbox0 = 8'h22;
	8'h94: tmp_new_sbox0 = 8'he7;
	8'h95: tmp_new_sbox0 = 8'had;
	8'h96: tmp_new_sbox0 = 8'h35;
	8'h97: tmp_new_sbox0 = 8'h85;
	8'h98: tmp_new_sbox0 = 8'he2;
	8'h99: tmp_new_sbox0 = 8'hf9;
	8'h9a: tmp_new_sbox0 = 8'h37;
	8'h9b: tmp_new_sbox0 = 8'he8;
	8'h9c: tmp_new_sbox0 = 8'h1c;
	8'h9d: tmp_new_sbox0 = 8'h75;
	8'h9e: tmp_new_sbox0 = 8'hdf;
	8'h9f: tmp_new_sbox0 = 8'h6e;
	8'ha0: tmp_new_sbox0 = 8'h47;
	8'ha1: tmp_new_sbox0 = 8'hf1;
	8'ha2: tmp_new_sbox0 = 8'h1a;
	8'ha3: tmp_new_sbox0 = 8'h71;
	8'ha4: tmp_new_sbox0 = 8'h1d;
	8'ha5: tmp_new_sbox0 = 8'h29;
	8'ha6: tmp_new_sbox0 = 8'hc5;
	8'ha7: tmp_new_sbox0 = 8'h89;
	8'ha8: tmp_new_sbox0 = 8'h6f;
	8'ha9: tmp_new_sbox0 = 8'hb7;
	8'haa: tmp_new_sbox0 = 8'h62;
	8'hab: tmp_new_sbox0 = 8'h0e;
	8'hac: tmp_new_sbox0 = 8'haa;
	8'had: tmp_new_sbox0 = 8'h18;
	8'hae: tmp_new_sbox0 = 8'hbe;
	8'haf: tmp_new_sbox0 = 8'h1b;
	8'hb0: tmp_new_sbox0 = 8'hfc;
	8'hb1: tmp_new_sbox0 = 8'h56;
	8'hb2: tmp_new_sbox0 = 8'h3e;
	8'hb3: tmp_new_sbox0 = 8'h4b;
	8'hb4: tmp_new_sbox0 = 8'hc6;
	8'hb5: tmp_new_sbox0 = 8'hd2;
	8'hb6: tmp_new_sbox0 = 8'h79;
	8'hb7: tmp_new_sbox0 = 8'h20;
	8'hb8: tmp_new_sbox0 = 8'h9a;
	8'hb9: tmp_new_sbox0 = 8'hdb;
	8'hba: tmp_new_sbox0 = 8'hc0;
	8'hbb: tmp_new_sbox0 = 8'hfe;
	8'hbc: tmp_new_sbox0 = 8'h78;
	8'hbd: tmp_new_sbox0 = 8'hcd;
	8'hbe: tmp_new_sbox0 = 8'h5a;
	8'hbf: tmp_new_sbox0 = 8'hf4;
	8'hc0: tmp_new_sbox0 = 8'h1f;
	8'hc1: tmp_new_sbox0 = 8'hdd;
	8'hc2: tmp_new_sbox0 = 8'ha8;
	8'hc3: tmp_new_sbox0 = 8'h33;
	8'hc4: tmp_new_sbox0 = 8'h88;
	8'hc5: tmp_new_sbox0 = 8'h07;
	8'hc6: tmp_new_sbox0 = 8'hc7;
	8'hc7: tmp_new_sbox0 = 8'h31;
	8'hc8: tmp_new_sbox0 = 8'hb1;
	8'hc9: tmp_new_sbox0 = 8'h12;
	8'hca: tmp_new_sbox0 = 8'h10;
	8'hcb: tmp_new_sbox0 = 8'h59;
	8'hcc: tmp_new_sbox0 = 8'h27;
	8'hcd: tmp_new_sbox0 = 8'h80;
	8'hce: tmp_new_sbox0 = 8'hec;
	8'hcf: tmp_new_sbox0 = 8'h5f;
	8'hd0: tmp_new_sbox0 = 8'h60;
	8'hd1: tmp_new_sbox0 = 8'h51;
	8'hd2: tmp_new_sbox0 = 8'h7f;
	8'hd3: tmp_new_sbox0 = 8'ha9;
	8'hd4: tmp_new_sbox0 = 8'h19;
	8'hd5: tmp_new_sbox0 = 8'hb5;
	8'hd6: tmp_new_sbox0 = 8'h4a;
	8'hd7: tmp_new_sbox0 = 8'h0d;
	8'hd8: tmp_new_sbox0 = 8'h2d;
	8'hd9: tmp_new_sbox0 = 8'he5;
	8'hda: tmp_new_sbox0 = 8'h7a;
	8'hdb: tmp_new_sbox0 = 8'h9f;
	8'hdc: tmp_new_sbox0 = 8'h93;
	8'hdd: tmp_new_sbox0 = 8'hc9;
	8'hde: tmp_new_sbox0 = 8'h9c;
	8'hdf: tmp_new_sbox0 = 8'hef;
	8'he0: tmp_new_sbox0 = 8'ha0;
	8'he1: tmp_new_sbox0 = 8'he0;
	8'he2: tmp_new_sbox0 = 8'h3b;
	8'he3: tmp_new_sbox0 = 8'h4d;
	8'he4: tmp_new_sbox0 = 8'hae;
	8'he5: tmp_new_sbox0 = 8'h2a;
	8'he6: tmp_new_sbox0 = 8'hf5;
	8'he7: tmp_new_sbox0 = 8'hb0;
	8'he8: tmp_new_sbox0 = 8'hc8;
	8'he9: tmp_new_sbox0 = 8'heb;
	8'hea: tmp_new_sbox0 = 8'hbb;
	8'heb: tmp_new_sbox0 = 8'h3c;
	8'hec: tmp_new_sbox0 = 8'h83;
	8'hed: tmp_new_sbox0 = 8'h53;
	8'hee: tmp_new_sbox0 = 8'h99;
	8'hef: tmp_new_sbox0 = 8'h61;
	8'hf0: tmp_new_sbox0 = 8'h17;
	8'hf1: tmp_new_sbox0 = 8'h2b;
	8'hf2: tmp_new_sbox0 = 8'h04;
	8'hf3: tmp_new_sbox0 = 8'h7e;
	8'hf4: tmp_new_sbox0 = 8'hba;
	8'hf5: tmp_new_sbox0 = 8'h77;
	8'hf6: tmp_new_sbox0 = 8'hd6;
	8'hf7: tmp_new_sbox0 = 8'h26;
	8'hf8: tmp_new_sbox0 = 8'he1;
	8'hf9: tmp_new_sbox0 = 8'h69;
	8'hfa: tmp_new_sbox0 = 8'h14;
	8'hfb: tmp_new_sbox0 = 8'h63;
	8'hfc: tmp_new_sbox0 = 8'h55;
	8'hfd: tmp_new_sbox0 = 8'h21;
	8'hfe: tmp_new_sbox0 = 8'h0c;
	8'hff: tmp_new_sbox0 = 8'h7d;
      endcase // case (addr)
    end // inv_sbox_rom0


  //----------------------------------------------------------------
  // inv_sbox_rom1
  //
  // The logic implemeting the ROM with mux.
  //----------------------------------------------------------------
  always @*
    begin : inv_sbox_rom1
      case(sboxw[16 : 23])
        8'h00: tmp_new_sbox1 = 8'h52;
	8'h01: tmp_new_sbox1 = 8'h09;
	8'h02: tmp_new_sbox1 = 8'h6a;
	8'h03: tmp_new_sbox1 = 8'hd5;
	8'h04: tmp_new_sbox1 = 8'h30;
	8'h05: tmp_new_sbox1 = 8'h36;
	8'h06: tmp_new_sbox1 = 8'ha5;
	8'h07: tmp_new_sbox1 = 8'h38;
	8'h08: tmp_new_sbox1 = 8'hbf;
	8'h09: tmp_new_sbox1 = 8'h40;
	8'h0a: tmp_new_sbox1 = 8'ha3;
	8'h0b: tmp_new_sbox1 = 8'h9e;
	8'h0c: tmp_new_sbox1 = 8'h81;
	8'h0d: tmp_new_sbox1 = 8'hf3;
	8'h0e: tmp_new_sbox1 = 8'hd7;
	8'h0f: tmp_new_sbox1 = 8'hfb;
	8'h10: tmp_new_sbox1 = 8'h7c;
	8'h11: tmp_new_sbox1 = 8'he3;
	8'h12: tmp_new_sbox1 = 8'h39;
	8'h13: tmp_new_sbox1 = 8'h82;
	8'h14: tmp_new_sbox1 = 8'h9b;
	8'h15: tmp_new_sbox1 = 8'h2f;
	8'h16: tmp_new_sbox1 = 8'hff;
	8'h17: tmp_new_sbox1 = 8'h87;
	8'h18: tmp_new_sbox1 = 8'h34;
	8'h19: tmp_new_sbox1 = 8'h8e;
	8'h1a: tmp_new_sbox1 = 8'h43;
	8'h1b: tmp_new_sbox1 = 8'h44;
	8'h1c: tmp_new_sbox1 = 8'hc4;
	8'h1d: tmp_new_sbox1 = 8'hde;
	8'h1e: tmp_new_sbox1 = 8'he9;
	8'h1f: tmp_new_sbox1 = 8'hcb;
	8'h20: tmp_new_sbox1 = 8'h54;
	8'h21: tmp_new_sbox1 = 8'h7b;
	8'h22: tmp_new_sbox1 = 8'h94;
	8'h23: tmp_new_sbox1 = 8'h32;
	8'h24: tmp_new_sbox1 = 8'ha6;
	8'h25: tmp_new_sbox1 = 8'hc2;
	8'h26: tmp_new_sbox1 = 8'h23;
	8'h27: tmp_new_sbox1 = 8'h3d;
	8'h28: tmp_new_sbox1 = 8'hee;
	8'h29: tmp_new_sbox1 = 8'h4c;
	8'h2a: tmp_new_sbox1 = 8'h95;
	8'h2b: tmp_new_sbox1 = 8'h0b;
	8'h2c: tmp_new_sbox1 = 8'h42;
	8'h2d: tmp_new_sbox1 = 8'hfa;
	8'h2e: tmp_new_sbox1 = 8'hc3;
	8'h2f: tmp_new_sbox1 = 8'h4e;
	8'h30: tmp_new_sbox1 = 8'h08;
	8'h31: tmp_new_sbox1 = 8'h2e;
	8'h32: tmp_new_sbox1 = 8'ha1;
	8'h33: tmp_new_sbox1 = 8'h66;
	8'h34: tmp_new_sbox1 = 8'h28;
	8'h35: tmp_new_sbox1 = 8'hd9;
	8'h36: tmp_new_sbox1 = 8'h24;
	8'h37: tmp_new_sbox1 = 8'hb2;
	8'h38: tmp_new_sbox1 = 8'h76;
	8'h39: tmp_new_sbox1 = 8'h5b;
	8'h3a: tmp_new_sbox1 = 8'ha2;
	8'h3b: tmp_new_sbox1 = 8'h49;
	8'h3c: tmp_new_sbox1 = 8'h6d;
	8'h3d: tmp_new_sbox1 = 8'h8b;
	8'h3e: tmp_new_sbox1 = 8'hd1;
	8'h3f: tmp_new_sbox1 = 8'h25;
	8'h40: tmp_new_sbox1 = 8'h72;
	8'h41: tmp_new_sbox1 = 8'hf8;
	8'h42: tmp_new_sbox1 = 8'hf6;
	8'h43: tmp_new_sbox1 = 8'h64;
	8'h44: tmp_new_sbox1 = 8'h86;
	8'h45: tmp_new_sbox1 = 8'h68;
	8'h46: tmp_new_sbox1 = 8'h98;
	8'h47: tmp_new_sbox1 = 8'h16;
	8'h48: tmp_new_sbox1 = 8'hd4;
	8'h49: tmp_new_sbox1 = 8'ha4;
	8'h4a: tmp_new_sbox1 = 8'h5c;
	8'h4b: tmp_new_sbox1 = 8'hcc;
	8'h4c: tmp_new_sbox1 = 8'h5d;
	8'h4d: tmp_new_sbox1 = 8'h65;
	8'h4e: tmp_new_sbox1 = 8'hb6;
	8'h4f: tmp_new_sbox1 = 8'h92;
	8'h50: tmp_new_sbox1 = 8'h6c;
	8'h51: tmp_new_sbox1 = 8'h70;
	8'h52: tmp_new_sbox1 = 8'h48;
	8'h53: tmp_new_sbox1 = 8'h50;
	8'h54: tmp_new_sbox1 = 8'hfd;
	8'h55: tmp_new_sbox1 = 8'hed;
	8'h56: tmp_new_sbox1 = 8'hb9;
	8'h57: tmp_new_sbox1 = 8'hda;
	8'h58: tmp_new_sbox1 = 8'h5e;
	8'h59: tmp_new_sbox1 = 8'h15;
	8'h5a: tmp_new_sbox1 = 8'h46;
	8'h5b: tmp_new_sbox1 = 8'h57;
	8'h5c: tmp_new_sbox1 = 8'ha7;
	8'h5d: tmp_new_sbox1 = 8'h8d;
	8'h5e: tmp_new_sbox1 = 8'h9d;
	8'h5f: tmp_new_sbox1 = 8'h84;
	8'h60: tmp_new_sbox1 = 8'h90;
	8'h61: tmp_new_sbox1 = 8'hd8;
	8'h62: tmp_new_sbox1 = 8'hab;
	8'h63: tmp_new_sbox1 = 8'h00;
	8'h64: tmp_new_sbox1 = 8'h8c;
	8'h65: tmp_new_sbox1 = 8'hbc;
	8'h66: tmp_new_sbox1 = 8'hd3;
	8'h67: tmp_new_sbox1 = 8'h0a;
	8'h68: tmp_new_sbox1 = 8'hf7;
	8'h69: tmp_new_sbox1 = 8'he4;
	8'h6a: tmp_new_sbox1 = 8'h58;
	8'h6b: tmp_new_sbox1 = 8'h05;
	8'h6c: tmp_new_sbox1 = 8'hb8;
	8'h6d: tmp_new_sbox1 = 8'hb3;
	8'h6e: tmp_new_sbox1 = 8'h45;
	8'h6f: tmp_new_sbox1 = 8'h06;
	8'h70: tmp_new_sbox1 = 8'hd0;
	8'h71: tmp_new_sbox1 = 8'h2c;
	8'h72: tmp_new_sbox1 = 8'h1e;
	8'h73: tmp_new_sbox1 = 8'h8f;
	8'h74: tmp_new_sbox1 = 8'hca;
	8'h75: tmp_new_sbox1 = 8'h3f;
	8'h76: tmp_new_sbox1 = 8'h0f;
	8'h77: tmp_new_sbox1 = 8'h02;
	8'h78: tmp_new_sbox1 = 8'hc1;
	8'h79: tmp_new_sbox1 = 8'haf;
	8'h7a: tmp_new_sbox1 = 8'hbd;
	8'h7b: tmp_new_sbox1 = 8'h03;
	8'h7c: tmp_new_sbox1 = 8'h01;
	8'h7d: tmp_new_sbox1 = 8'h13;
	8'h7e: tmp_new_sbox1 = 8'h8a;
	8'h7f: tmp_new_sbox1 = 8'h6b;
	8'h80: tmp_new_sbox1 = 8'h3a;
	8'h81: tmp_new_sbox1 = 8'h91;
	8'h82: tmp_new_sbox1 = 8'h11;
	8'h83: tmp_new_sbox1 = 8'h41;
	8'h84: tmp_new_sbox1 = 8'h4f;
	8'h85: tmp_new_sbox1 = 8'h67;
	8'h86: tmp_new_sbox1 = 8'hdc;
	8'h87: tmp_new_sbox1 = 8'hea;
	8'h88: tmp_new_sbox1 = 8'h97;
	8'h89: tmp_new_sbox1 = 8'hf2;
	8'h8a: tmp_new_sbox1 = 8'hcf;
	8'h8b: tmp_new_sbox1 = 8'hce;
	8'h8c: tmp_new_sbox1 = 8'hf0;
	8'h8d: tmp_new_sbox1 = 8'hb4;
	8'h8e: tmp_new_sbox1 = 8'he6;
	8'h8f: tmp_new_sbox1 = 8'h73;
	8'h90: tmp_new_sbox1 = 8'h96;
	8'h91: tmp_new_sbox1 = 8'hac;
	8'h92: tmp_new_sbox1 = 8'h74;
	8'h93: tmp_new_sbox1 = 8'h22;
	8'h94: tmp_new_sbox1 = 8'he7;
	8'h95: tmp_new_sbox1 = 8'had;
	8'h96: tmp_new_sbox1 = 8'h35;
	8'h97: tmp_new_sbox1 = 8'h85;
	8'h98: tmp_new_sbox1 = 8'he2;
	8'h99: tmp_new_sbox1 = 8'hf9;
	8'h9a: tmp_new_sbox1 = 8'h37;
	8'h9b: tmp_new_sbox1 = 8'he8;
	8'h9c: tmp_new_sbox1 = 8'h1c;
	8'h9d: tmp_new_sbox1 = 8'h75;
	8'h9e: tmp_new_sbox1 = 8'hdf;
	8'h9f: tmp_new_sbox1 = 8'h6e;
	8'ha0: tmp_new_sbox1 = 8'h47;
	8'ha1: tmp_new_sbox1 = 8'hf1;
	8'ha2: tmp_new_sbox1 = 8'h1a;
	8'ha3: tmp_new_sbox1 = 8'h71;
	8'ha4: tmp_new_sbox1 = 8'h1d;
	8'ha5: tmp_new_sbox1 = 8'h29;
	8'ha6: tmp_new_sbox1 = 8'hc5;
	8'ha7: tmp_new_sbox1 = 8'h89;
	8'ha8: tmp_new_sbox1 = 8'h6f;
	8'ha9: tmp_new_sbox1 = 8'hb7;
	8'haa: tmp_new_sbox1 = 8'h62;
	8'hab: tmp_new_sbox1 = 8'h0e;
	8'hac: tmp_new_sbox1 = 8'haa;
	8'had: tmp_new_sbox1 = 8'h18;
	8'hae: tmp_new_sbox1 = 8'hbe;
	8'haf: tmp_new_sbox1 = 8'h1b;
	8'hb0: tmp_new_sbox1 = 8'hfc;
	8'hb1: tmp_new_sbox1 = 8'h56;
	8'hb2: tmp_new_sbox1 = 8'h3e;
	8'hb3: tmp_new_sbox1 = 8'h4b;
	8'hb4: tmp_new_sbox1 = 8'hc6;
	8'hb5: tmp_new_sbox1 = 8'hd2;
	8'hb6: tmp_new_sbox1 = 8'h79;
	8'hb7: tmp_new_sbox1 = 8'h20;
	8'hb8: tmp_new_sbox1 = 8'h9a;
	8'hb9: tmp_new_sbox1 = 8'hdb;
	8'hba: tmp_new_sbox1 = 8'hc0;
	8'hbb: tmp_new_sbox1 = 8'hfe;
	8'hbc: tmp_new_sbox1 = 8'h78;
	8'hbd: tmp_new_sbox1 = 8'hcd;
	8'hbe: tmp_new_sbox1 = 8'h5a;
	8'hbf: tmp_new_sbox1 = 8'hf4;
	8'hc0: tmp_new_sbox1 = 8'h1f;
	8'hc1: tmp_new_sbox1 = 8'hdd;
	8'hc2: tmp_new_sbox1 = 8'ha8;
	8'hc3: tmp_new_sbox1 = 8'h33;
	8'hc4: tmp_new_sbox1 = 8'h88;
	8'hc5: tmp_new_sbox1 = 8'h07;
	8'hc6: tmp_new_sbox1 = 8'hc7;
	8'hc7: tmp_new_sbox1 = 8'h31;
	8'hc8: tmp_new_sbox1 = 8'hb1;
	8'hc9: tmp_new_sbox1 = 8'h12;
	8'hca: tmp_new_sbox1 = 8'h10;
	8'hcb: tmp_new_sbox1 = 8'h59;
	8'hcc: tmp_new_sbox1 = 8'h27;
	8'hcd: tmp_new_sbox1 = 8'h80;
	8'hce: tmp_new_sbox1 = 8'hec;
	8'hcf: tmp_new_sbox1 = 8'h5f;
	8'hd0: tmp_new_sbox1 = 8'h60;
	8'hd1: tmp_new_sbox1 = 8'h51;
	8'hd2: tmp_new_sbox1 = 8'h7f;
	8'hd3: tmp_new_sbox1 = 8'ha9;
	8'hd4: tmp_new_sbox1 = 8'h19;
	8'hd5: tmp_new_sbox1 = 8'hb5;
	8'hd6: tmp_new_sbox1 = 8'h4a;
	8'hd7: tmp_new_sbox1 = 8'h0d;
	8'hd8: tmp_new_sbox1 = 8'h2d;
	8'hd9: tmp_new_sbox1 = 8'he5;
	8'hda: tmp_new_sbox1 = 8'h7a;
	8'hdb: tmp_new_sbox1 = 8'h9f;
	8'hdc: tmp_new_sbox1 = 8'h93;
	8'hdd: tmp_new_sbox1 = 8'hc9;
	8'hde: tmp_new_sbox1 = 8'h9c;
	8'hdf: tmp_new_sbox1 = 8'hef;
	8'he0: tmp_new_sbox1 = 8'ha0;
	8'he1: tmp_new_sbox1 = 8'he0;
	8'he2: tmp_new_sbox1 = 8'h3b;
	8'he3: tmp_new_sbox1 = 8'h4d;
	8'he4: tmp_new_sbox1 = 8'hae;
	8'he5: tmp_new_sbox1 = 8'h2a;
	8'he6: tmp_new_sbox1 = 8'hf5;
	8'he7: tmp_new_sbox1 = 8'hb0;
	8'he8: tmp_new_sbox1 = 8'hc8;
	8'he9: tmp_new_sbox1 = 8'heb;
	8'hea: tmp_new_sbox1 = 8'hbb;
	8'heb: tmp_new_sbox1 = 8'h3c;
	8'hec: tmp_new_sbox1 = 8'h83;
	8'hed: tmp_new_sbox1 = 8'h53;
	8'hee: tmp_new_sbox1 = 8'h99;
	8'hef: tmp_new_sbox1 = 8'h61;
	8'hf0: tmp_new_sbox1 = 8'h17;
	8'hf1: tmp_new_sbox1 = 8'h2b;
	8'hf2: tmp_new_sbox1 = 8'h04;
	8'hf3: tmp_new_sbox1 = 8'h7e;
	8'hf4: tmp_new_sbox1 = 8'hba;
	8'hf5: tmp_new_sbox1 = 8'h77;
	8'hf6: tmp_new_sbox1 = 8'hd6;
	8'hf7: tmp_new_sbox1 = 8'h26;
	8'hf8: tmp_new_sbox1 = 8'he1;
	8'hf9: tmp_new_sbox1 = 8'h69;
	8'hfa: tmp_new_sbox1 = 8'h14;
	8'hfb: tmp_new_sbox1 = 8'h63;
	8'hfc: tmp_new_sbox1 = 8'h55;
	8'hfd: tmp_new_sbox1 = 8'h21;
	8'hfe: tmp_new_sbox1 = 8'h0c;
	8'hff: tmp_new_sbox1 = 8'h7d;
      endcase // case (addr)
    end // inv_sbox_rom1


  //----------------------------------------------------------------
  // inv_sbox_rom2
  //
  // The logic implemeting the ROM with mux.
  //----------------------------------------------------------------
  always @*
    begin : inv_sbox_rom2
      case(sboxw[15 : 8])
        8'h00: tmp_new_sbox2 = 8'h52;
	8'h01: tmp_new_sbox2 = 8'h09;
	8'h02: tmp_new_sbox2 = 8'h6a;
	8'h03: tmp_new_sbox2 = 8'hd5;
	8'h04: tmp_new_sbox2 = 8'h30;
	8'h05: tmp_new_sbox2 = 8'h36;
	8'h06: tmp_new_sbox2 = 8'ha5;
	8'h07: tmp_new_sbox2 = 8'h38;
	8'h08: tmp_new_sbox2 = 8'hbf;
	8'h09: tmp_new_sbox2 = 8'h40;
	8'h0a: tmp_new_sbox2 = 8'ha3;
	8'h0b: tmp_new_sbox2 = 8'h9e;
	8'h0c: tmp_new_sbox2 = 8'h81;
	8'h0d: tmp_new_sbox2 = 8'hf3;
	8'h0e: tmp_new_sbox2 = 8'hd7;
	8'h0f: tmp_new_sbox2 = 8'hfb;
	8'h10: tmp_new_sbox2 = 8'h7c;
	8'h11: tmp_new_sbox2 = 8'he3;
	8'h12: tmp_new_sbox2 = 8'h39;
	8'h13: tmp_new_sbox2 = 8'h82;
	8'h14: tmp_new_sbox2 = 8'h9b;
	8'h15: tmp_new_sbox2 = 8'h2f;
	8'h16: tmp_new_sbox2 = 8'hff;
	8'h17: tmp_new_sbox2 = 8'h87;
	8'h18: tmp_new_sbox2 = 8'h34;
	8'h19: tmp_new_sbox2 = 8'h8e;
	8'h1a: tmp_new_sbox2 = 8'h43;
	8'h1b: tmp_new_sbox2 = 8'h44;
	8'h1c: tmp_new_sbox2 = 8'hc4;
	8'h1d: tmp_new_sbox2 = 8'hde;
	8'h1e: tmp_new_sbox2 = 8'he9;
	8'h1f: tmp_new_sbox2 = 8'hcb;
	8'h20: tmp_new_sbox2 = 8'h54;
	8'h21: tmp_new_sbox2 = 8'h7b;
	8'h22: tmp_new_sbox2 = 8'h94;
	8'h23: tmp_new_sbox2 = 8'h32;
	8'h24: tmp_new_sbox2 = 8'ha6;
	8'h25: tmp_new_sbox2 = 8'hc2;
	8'h26: tmp_new_sbox2 = 8'h23;
	8'h27: tmp_new_sbox2 = 8'h3d;
	8'h28: tmp_new_sbox2 = 8'hee;
	8'h29: tmp_new_sbox2 = 8'h4c;
	8'h2a: tmp_new_sbox2 = 8'h95;
	8'h2b: tmp_new_sbox2 = 8'h0b;
	8'h2c: tmp_new_sbox2 = 8'h42;
	8'h2d: tmp_new_sbox2 = 8'hfa;
	8'h2e: tmp_new_sbox2 = 8'hc3;
	8'h2f: tmp_new_sbox2 = 8'h4e;
	8'h30: tmp_new_sbox2 = 8'h08;
	8'h31: tmp_new_sbox2 = 8'h2e;
	8'h32: tmp_new_sbox2 = 8'ha1;
	8'h33: tmp_new_sbox2 = 8'h66;
	8'h34: tmp_new_sbox2 = 8'h28;
	8'h35: tmp_new_sbox2 = 8'hd9;
	8'h36: tmp_new_sbox2 = 8'h24;
	8'h37: tmp_new_sbox2 = 8'hb2;
	8'h38: tmp_new_sbox2 = 8'h76;
	8'h39: tmp_new_sbox2 = 8'h5b;
	8'h3a: tmp_new_sbox2 = 8'ha2;
	8'h3b: tmp_new_sbox2 = 8'h49;
	8'h3c: tmp_new_sbox2 = 8'h6d;
	8'h3d: tmp_new_sbox2 = 8'h8b;
	8'h3e: tmp_new_sbox2 = 8'hd1;
	8'h3f: tmp_new_sbox2 = 8'h25;
	8'h40: tmp_new_sbox2 = 8'h72;
	8'h41: tmp_new_sbox2 = 8'hf8;
	8'h42: tmp_new_sbox2 = 8'hf6;
	8'h43: tmp_new_sbox2 = 8'h64;
	8'h44: tmp_new_sbox2 = 8'h86;
	8'h45: tmp_new_sbox2 = 8'h68;
	8'h46: tmp_new_sbox2 = 8'h98;
	8'h47: tmp_new_sbox2 = 8'h16;
	8'h48: tmp_new_sbox2 = 8'hd4;
	8'h49: tmp_new_sbox2 = 8'ha4;
	8'h4a: tmp_new_sbox2 = 8'h5c;
	8'h4b: tmp_new_sbox2 = 8'hcc;
	8'h4c: tmp_new_sbox2 = 8'h5d;
	8'h4d: tmp_new_sbox2 = 8'h65;
	8'h4e: tmp_new_sbox2 = 8'hb6;
	8'h4f: tmp_new_sbox2 = 8'h92;
	8'h50: tmp_new_sbox2 = 8'h6c;
	8'h51: tmp_new_sbox2 = 8'h70;
	8'h52: tmp_new_sbox2 = 8'h48;
	8'h53: tmp_new_sbox2 = 8'h50;
	8'h54: tmp_new_sbox2 = 8'hfd;
	8'h55: tmp_new_sbox2 = 8'hed;
	8'h56: tmp_new_sbox2 = 8'hb9;
	8'h57: tmp_new_sbox2 = 8'hda;
	8'h58: tmp_new_sbox2 = 8'h5e;
	8'h59: tmp_new_sbox2 = 8'h15;
	8'h5a: tmp_new_sbox2 = 8'h46;
	8'h5b: tmp_new_sbox2 = 8'h57;
	8'h5c: tmp_new_sbox2 = 8'ha7;
	8'h5d: tmp_new_sbox2 = 8'h8d;
	8'h5e: tmp_new_sbox2 = 8'h9d;
	8'h5f: tmp_new_sbox2 = 8'h84;
	8'h60: tmp_new_sbox2 = 8'h90;
	8'h61: tmp_new_sbox2 = 8'hd8;
	8'h62: tmp_new_sbox2 = 8'hab;
	8'h63: tmp_new_sbox2 = 8'h00;
	8'h64: tmp_new_sbox2 = 8'h8c;
	8'h65: tmp_new_sbox2 = 8'hbc;
	8'h66: tmp_new_sbox2 = 8'hd3;
	8'h67: tmp_new_sbox2 = 8'h0a;
	8'h68: tmp_new_sbox2 = 8'hf7;
	8'h69: tmp_new_sbox2 = 8'he4;
	8'h6a: tmp_new_sbox2 = 8'h58;
	8'h6b: tmp_new_sbox2 = 8'h05;
	8'h6c: tmp_new_sbox2 = 8'hb8;
	8'h6d: tmp_new_sbox2 = 8'hb3;
	8'h6e: tmp_new_sbox2 = 8'h45;
	8'h6f: tmp_new_sbox2 = 8'h06;
	8'h70: tmp_new_sbox2 = 8'hd0;
	8'h71: tmp_new_sbox2 = 8'h2c;
	8'h72: tmp_new_sbox2 = 8'h1e;
	8'h73: tmp_new_sbox2 = 8'h8f;
	8'h74: tmp_new_sbox2 = 8'hca;
	8'h75: tmp_new_sbox2 = 8'h3f;
	8'h76: tmp_new_sbox2 = 8'h0f;
	8'h77: tmp_new_sbox2 = 8'h02;
	8'h78: tmp_new_sbox2 = 8'hc1;
	8'h79: tmp_new_sbox2 = 8'haf;
	8'h7a: tmp_new_sbox2 = 8'hbd;
	8'h7b: tmp_new_sbox2 = 8'h03;
	8'h7c: tmp_new_sbox2 = 8'h01;
	8'h7d: tmp_new_sbox2 = 8'h13;
	8'h7e: tmp_new_sbox2 = 8'h8a;
	8'h7f: tmp_new_sbox2 = 8'h6b;
	8'h80: tmp_new_sbox2 = 8'h3a;
	8'h81: tmp_new_sbox2 = 8'h91;
	8'h82: tmp_new_sbox2 = 8'h11;
	8'h83: tmp_new_sbox2 = 8'h41;
	8'h84: tmp_new_sbox2 = 8'h4f;
	8'h85: tmp_new_sbox2 = 8'h67;
	8'h86: tmp_new_sbox2 = 8'hdc;
	8'h87: tmp_new_sbox2 = 8'hea;
	8'h88: tmp_new_sbox2 = 8'h97;
	8'h89: tmp_new_sbox2 = 8'hf2;
	8'h8a: tmp_new_sbox2 = 8'hcf;
	8'h8b: tmp_new_sbox2 = 8'hce;
	8'h8c: tmp_new_sbox2 = 8'hf0;
	8'h8d: tmp_new_sbox2 = 8'hb4;
	8'h8e: tmp_new_sbox2 = 8'he6;
	8'h8f: tmp_new_sbox2 = 8'h73;
	8'h90: tmp_new_sbox2 = 8'h96;
	8'h91: tmp_new_sbox2 = 8'hac;
	8'h92: tmp_new_sbox2 = 8'h74;
	8'h93: tmp_new_sbox2 = 8'h22;
	8'h94: tmp_new_sbox2 = 8'he7;
	8'h95: tmp_new_sbox2 = 8'had;
	8'h96: tmp_new_sbox2 = 8'h35;
	8'h97: tmp_new_sbox2 = 8'h85;
	8'h98: tmp_new_sbox2 = 8'he2;
	8'h99: tmp_new_sbox2 = 8'hf9;
	8'h9a: tmp_new_sbox2 = 8'h37;
	8'h9b: tmp_new_sbox2 = 8'he8;
	8'h9c: tmp_new_sbox2 = 8'h1c;
	8'h9d: tmp_new_sbox2 = 8'h75;
	8'h9e: tmp_new_sbox2 = 8'hdf;
	8'h9f: tmp_new_sbox2 = 8'h6e;
	8'ha0: tmp_new_sbox2 = 8'h47;
	8'ha1: tmp_new_sbox2 = 8'hf1;
	8'ha2: tmp_new_sbox2 = 8'h1a;
	8'ha3: tmp_new_sbox2 = 8'h71;
	8'ha4: tmp_new_sbox2 = 8'h1d;
	8'ha5: tmp_new_sbox2 = 8'h29;
	8'ha6: tmp_new_sbox2 = 8'hc5;
	8'ha7: tmp_new_sbox2 = 8'h89;
	8'ha8: tmp_new_sbox2 = 8'h6f;
	8'ha9: tmp_new_sbox2 = 8'hb7;
	8'haa: tmp_new_sbox2 = 8'h62;
	8'hab: tmp_new_sbox2 = 8'h0e;
	8'hac: tmp_new_sbox2 = 8'haa;
	8'had: tmp_new_sbox2 = 8'h18;
	8'hae: tmp_new_sbox2 = 8'hbe;
	8'haf: tmp_new_sbox2 = 8'h1b;
	8'hb0: tmp_new_sbox2 = 8'hfc;
	8'hb1: tmp_new_sbox2 = 8'h56;
	8'hb2: tmp_new_sbox2 = 8'h3e;
	8'hb3: tmp_new_sbox2 = 8'h4b;
	8'hb4: tmp_new_sbox2 = 8'hc6;
	8'hb5: tmp_new_sbox2 = 8'hd2;
	8'hb6: tmp_new_sbox2 = 8'h79;
	8'hb7: tmp_new_sbox2 = 8'h20;
	8'hb8: tmp_new_sbox2 = 8'h9a;
	8'hb9: tmp_new_sbox2 = 8'hdb;
	8'hba: tmp_new_sbox2 = 8'hc0;
	8'hbb: tmp_new_sbox2 = 8'hfe;
	8'hbc: tmp_new_sbox2 = 8'h78;
	8'hbd: tmp_new_sbox2 = 8'hcd;
	8'hbe: tmp_new_sbox2 = 8'h5a;
	8'hbf: tmp_new_sbox2 = 8'hf4;
	8'hc0: tmp_new_sbox2 = 8'h1f;
	8'hc1: tmp_new_sbox2 = 8'hdd;
	8'hc2: tmp_new_sbox2 = 8'ha8;
	8'hc3: tmp_new_sbox2 = 8'h33;
	8'hc4: tmp_new_sbox2 = 8'h88;
	8'hc5: tmp_new_sbox2 = 8'h07;
	8'hc6: tmp_new_sbox2 = 8'hc7;
	8'hc7: tmp_new_sbox2 = 8'h31;
	8'hc8: tmp_new_sbox2 = 8'hb1;
	8'hc9: tmp_new_sbox2 = 8'h12;
	8'hca: tmp_new_sbox2 = 8'h10;
	8'hcb: tmp_new_sbox2 = 8'h59;
	8'hcc: tmp_new_sbox2 = 8'h27;
	8'hcd: tmp_new_sbox2 = 8'h80;
	8'hce: tmp_new_sbox2 = 8'hec;
	8'hcf: tmp_new_sbox2 = 8'h5f;
	8'hd0: tmp_new_sbox2 = 8'h60;
	8'hd1: tmp_new_sbox2 = 8'h51;
	8'hd2: tmp_new_sbox2 = 8'h7f;
	8'hd3: tmp_new_sbox2 = 8'ha9;
	8'hd4: tmp_new_sbox2 = 8'h19;
	8'hd5: tmp_new_sbox2 = 8'hb5;
	8'hd6: tmp_new_sbox2 = 8'h4a;
	8'hd7: tmp_new_sbox2 = 8'h0d;
	8'hd8: tmp_new_sbox2 = 8'h2d;
	8'hd9: tmp_new_sbox2 = 8'he5;
	8'hda: tmp_new_sbox2 = 8'h7a;
	8'hdb: tmp_new_sbox2 = 8'h9f;
	8'hdc: tmp_new_sbox2 = 8'h93;
	8'hdd: tmp_new_sbox2 = 8'hc9;
	8'hde: tmp_new_sbox2 = 8'h9c;
	8'hdf: tmp_new_sbox2 = 8'hef;
	8'he0: tmp_new_sbox2 = 8'ha0;
	8'he1: tmp_new_sbox2 = 8'he0;
	8'he2: tmp_new_sbox2 = 8'h3b;
	8'he3: tmp_new_sbox2 = 8'h4d;
	8'he4: tmp_new_sbox2 = 8'hae;
	8'he5: tmp_new_sbox2 = 8'h2a;
	8'he6: tmp_new_sbox2 = 8'hf5;
	8'he7: tmp_new_sbox2 = 8'hb0;
	8'he8: tmp_new_sbox2 = 8'hc8;
	8'he9: tmp_new_sbox2 = 8'heb;
	8'hea: tmp_new_sbox2 = 8'hbb;
	8'heb: tmp_new_sbox2 = 8'h3c;
	8'hec: tmp_new_sbox2 = 8'h83;
	8'hed: tmp_new_sbox2 = 8'h53;
	8'hee: tmp_new_sbox2 = 8'h99;
	8'hef: tmp_new_sbox2 = 8'h61;
	8'hf0: tmp_new_sbox2 = 8'h17;
	8'hf1: tmp_new_sbox2 = 8'h2b;
	8'hf2: tmp_new_sbox2 = 8'h04;
	8'hf3: tmp_new_sbox2 = 8'h7e;
	8'hf4: tmp_new_sbox2 = 8'hba;
	8'hf5: tmp_new_sbox2 = 8'h77;
	8'hf6: tmp_new_sbox2 = 8'hd6;
	8'hf7: tmp_new_sbox2 = 8'h26;
	8'hf8: tmp_new_sbox2 = 8'he1;
	8'hf9: tmp_new_sbox2 = 8'h69;
	8'hfa: tmp_new_sbox2 = 8'h14;
	8'hfb: tmp_new_sbox2 = 8'h63;
	8'hfc: tmp_new_sbox2 = 8'h55;
	8'hfd: tmp_new_sbox2 = 8'h21;
	8'hfe: tmp_new_sbox2 = 8'h0c;
	8'hff: tmp_new_sbox2 = 8'h7d;
      endcase // case (addr)
    end // inv_sbox_rom2


  //----------------------------------------------------------------
  // inv_sbox_rom3
  //
  // The logic implemeting the ROM with mux.
  //----------------------------------------------------------------
  always @*
    begin : inv_sbox_rom3
      case(sboxw[7 : 0])
        8'h00: tmp_new_sbox3 = 8'h52;
	8'h01: tmp_new_sbox3 = 8'h09;
	8'h02: tmp_new_sbox3 = 8'h6a;
	8'h03: tmp_new_sbox3 = 8'hd5;
	8'h04: tmp_new_sbox3 = 8'h30;
	8'h05: tmp_new_sbox3 = 8'h36;
	8'h06: tmp_new_sbox3 = 8'ha5;
	8'h07: tmp_new_sbox3 = 8'h38;
	8'h08: tmp_new_sbox3 = 8'hbf;
	8'h09: tmp_new_sbox3 = 8'h40;
	8'h0a: tmp_new_sbox3 = 8'ha3;
	8'h0b: tmp_new_sbox3 = 8'h9e;
	8'h0c: tmp_new_sbox3 = 8'h81;
	8'h0d: tmp_new_sbox3 = 8'hf3;
	8'h0e: tmp_new_sbox3 = 8'hd7;
	8'h0f: tmp_new_sbox3 = 8'hfb;
	8'h10: tmp_new_sbox3 = 8'h7c;
	8'h11: tmp_new_sbox3 = 8'he3;
	8'h12: tmp_new_sbox3 = 8'h39;
	8'h13: tmp_new_sbox3 = 8'h82;
	8'h14: tmp_new_sbox3 = 8'h9b;
	8'h15: tmp_new_sbox3 = 8'h2f;
	8'h16: tmp_new_sbox3 = 8'hff;
	8'h17: tmp_new_sbox3 = 8'h87;
	8'h18: tmp_new_sbox3 = 8'h34;
	8'h19: tmp_new_sbox3 = 8'h8e;
	8'h1a: tmp_new_sbox3 = 8'h43;
	8'h1b: tmp_new_sbox3 = 8'h44;
	8'h1c: tmp_new_sbox3 = 8'hc4;
	8'h1d: tmp_new_sbox3 = 8'hde;
	8'h1e: tmp_new_sbox3 = 8'he9;
	8'h1f: tmp_new_sbox3 = 8'hcb;
	8'h20: tmp_new_sbox3 = 8'h54;
	8'h21: tmp_new_sbox3 = 8'h7b;
	8'h22: tmp_new_sbox3 = 8'h94;
	8'h23: tmp_new_sbox3 = 8'h32;
	8'h24: tmp_new_sbox3 = 8'ha6;
	8'h25: tmp_new_sbox3 = 8'hc2;
	8'h26: tmp_new_sbox3 = 8'h23;
	8'h27: tmp_new_sbox3 = 8'h3d;
	8'h28: tmp_new_sbox3 = 8'hee;
	8'h29: tmp_new_sbox3 = 8'h4c;
	8'h2a: tmp_new_sbox3 = 8'h95;
	8'h2b: tmp_new_sbox3 = 8'h0b;
	8'h2c: tmp_new_sbox3 = 8'h42;
	8'h2d: tmp_new_sbox3 = 8'hfa;
	8'h2e: tmp_new_sbox3 = 8'hc3;
	8'h2f: tmp_new_sbox3 = 8'h4e;
	8'h30: tmp_new_sbox3 = 8'h08;
	8'h31: tmp_new_sbox3 = 8'h2e;
	8'h32: tmp_new_sbox3 = 8'ha1;
	8'h33: tmp_new_sbox3 = 8'h66;
	8'h34: tmp_new_sbox3 = 8'h28;
	8'h35: tmp_new_sbox3 = 8'hd9;
	8'h36: tmp_new_sbox3 = 8'h24;
	8'h37: tmp_new_sbox3 = 8'hb2;
	8'h38: tmp_new_sbox3 = 8'h76;
	8'h39: tmp_new_sbox3 = 8'h5b;
	8'h3a: tmp_new_sbox3 = 8'ha2;
	8'h3b: tmp_new_sbox3 = 8'h49;
	8'h3c: tmp_new_sbox3 = 8'h6d;
	8'h3d: tmp_new_sbox3 = 8'h8b;
	8'h3e: tmp_new_sbox3 = 8'hd1;
	8'h3f: tmp_new_sbox3 = 8'h25;
	8'h40: tmp_new_sbox3 = 8'h72;
	8'h41: tmp_new_sbox3 = 8'hf8;
	8'h42: tmp_new_sbox3 = 8'hf6;
	8'h43: tmp_new_sbox3 = 8'h64;
	8'h44: tmp_new_sbox3 = 8'h86;
	8'h45: tmp_new_sbox3 = 8'h68;
	8'h46: tmp_new_sbox3 = 8'h98;
	8'h47: tmp_new_sbox3 = 8'h16;
	8'h48: tmp_new_sbox3 = 8'hd4;
	8'h49: tmp_new_sbox3 = 8'ha4;
	8'h4a: tmp_new_sbox3 = 8'h5c;
	8'h4b: tmp_new_sbox3 = 8'hcc;
	8'h4c: tmp_new_sbox3 = 8'h5d;
	8'h4d: tmp_new_sbox3 = 8'h65;
	8'h4e: tmp_new_sbox3 = 8'hb6;
	8'h4f: tmp_new_sbox3 = 8'h92;
	8'h50: tmp_new_sbox3 = 8'h6c;
	8'h51: tmp_new_sbox3 = 8'h70;
	8'h52: tmp_new_sbox3 = 8'h48;
	8'h53: tmp_new_sbox3 = 8'h50;
	8'h54: tmp_new_sbox3 = 8'hfd;
	8'h55: tmp_new_sbox3 = 8'hed;
	8'h56: tmp_new_sbox3 = 8'hb9;
	8'h57: tmp_new_sbox3 = 8'hda;
	8'h58: tmp_new_sbox3 = 8'h5e;
	8'h59: tmp_new_sbox3 = 8'h15;
	8'h5a: tmp_new_sbox3 = 8'h46;
	8'h5b: tmp_new_sbox3 = 8'h57;
	8'h5c: tmp_new_sbox3 = 8'ha7;
	8'h5d: tmp_new_sbox3 = 8'h8d;
	8'h5e: tmp_new_sbox3 = 8'h9d;
	8'h5f: tmp_new_sbox3 = 8'h84;
	8'h60: tmp_new_sbox3 = 8'h90;
	8'h61: tmp_new_sbox3 = 8'hd8;
	8'h62: tmp_new_sbox3 = 8'hab;
	8'h63: tmp_new_sbox3 = 8'h00;
	8'h64: tmp_new_sbox3 = 8'h8c;
	8'h65: tmp_new_sbox3 = 8'hbc;
	8'h66: tmp_new_sbox3 = 8'hd3;
	8'h67: tmp_new_sbox3 = 8'h0a;
	8'h68: tmp_new_sbox3 = 8'hf7;
	8'h69: tmp_new_sbox3 = 8'he4;
	8'h6a: tmp_new_sbox3 = 8'h58;
	8'h6b: tmp_new_sbox3 = 8'h05;
	8'h6c: tmp_new_sbox3 = 8'hb8;
	8'h6d: tmp_new_sbox3 = 8'hb3;
	8'h6e: tmp_new_sbox3 = 8'h45;
	8'h6f: tmp_new_sbox3 = 8'h06;
	8'h70: tmp_new_sbox3 = 8'hd0;
	8'h71: tmp_new_sbox3 = 8'h2c;
	8'h72: tmp_new_sbox3 = 8'h1e;
	8'h73: tmp_new_sbox3 = 8'h8f;
	8'h74: tmp_new_sbox3 = 8'hca;
	8'h75: tmp_new_sbox3 = 8'h3f;
	8'h76: tmp_new_sbox3 = 8'h0f;
	8'h77: tmp_new_sbox3 = 8'h02;
	8'h78: tmp_new_sbox3 = 8'hc1;
	8'h79: tmp_new_sbox3 = 8'haf;
	8'h7a: tmp_new_sbox3 = 8'hbd;
	8'h7b: tmp_new_sbox3 = 8'h03;
	8'h7c: tmp_new_sbox3 = 8'h01;
	8'h7d: tmp_new_sbox3 = 8'h13;
	8'h7e: tmp_new_sbox3 = 8'h8a;
	8'h7f: tmp_new_sbox3 = 8'h6b;
	8'h80: tmp_new_sbox3 = 8'h3a;
	8'h81: tmp_new_sbox3 = 8'h91;
	8'h82: tmp_new_sbox3 = 8'h11;
	8'h83: tmp_new_sbox3 = 8'h41;
	8'h84: tmp_new_sbox3 = 8'h4f;
	8'h85: tmp_new_sbox3 = 8'h67;
	8'h86: tmp_new_sbox3 = 8'hdc;
	8'h87: tmp_new_sbox3 = 8'hea;
	8'h88: tmp_new_sbox3 = 8'h97;
	8'h89: tmp_new_sbox3 = 8'hf2;
	8'h8a: tmp_new_sbox3 = 8'hcf;
	8'h8b: tmp_new_sbox3 = 8'hce;
	8'h8c: tmp_new_sbox3 = 8'hf0;
	8'h8d: tmp_new_sbox3 = 8'hb4;
	8'h8e: tmp_new_sbox3 = 8'he6;
	8'h8f: tmp_new_sbox3 = 8'h73;
	8'h90: tmp_new_sbox3 = 8'h96;
	8'h91: tmp_new_sbox3 = 8'hac;
	8'h92: tmp_new_sbox3 = 8'h74;
	8'h93: tmp_new_sbox3 = 8'h22;
	8'h94: tmp_new_sbox3 = 8'he7;
	8'h95: tmp_new_sbox3 = 8'had;
	8'h96: tmp_new_sbox3 = 8'h35;
	8'h97: tmp_new_sbox3 = 8'h85;
	8'h98: tmp_new_sbox3 = 8'he2;
	8'h99: tmp_new_sbox3 = 8'hf9;
	8'h9a: tmp_new_sbox3 = 8'h37;
	8'h9b: tmp_new_sbox3 = 8'he8;
	8'h9c: tmp_new_sbox3 = 8'h1c;
	8'h9d: tmp_new_sbox3 = 8'h75;
	8'h9e: tmp_new_sbox3 = 8'hdf;
	8'h9f: tmp_new_sbox3 = 8'h6e;
	8'ha0: tmp_new_sbox3 = 8'h47;
	8'ha1: tmp_new_sbox3 = 8'hf1;
	8'ha2: tmp_new_sbox3 = 8'h1a;
	8'ha3: tmp_new_sbox3 = 8'h71;
	8'ha4: tmp_new_sbox3 = 8'h1d;
	8'ha5: tmp_new_sbox3 = 8'h29;
	8'ha6: tmp_new_sbox3 = 8'hc5;
	8'ha7: tmp_new_sbox3 = 8'h89;
	8'ha8: tmp_new_sbox3 = 8'h6f;
	8'ha9: tmp_new_sbox3 = 8'hb7;
	8'haa: tmp_new_sbox3 = 8'h62;
	8'hab: tmp_new_sbox3 = 8'h0e;
	8'hac: tmp_new_sbox3 = 8'haa;
	8'had: tmp_new_sbox3 = 8'h18;
	8'hae: tmp_new_sbox3 = 8'hbe;
	8'haf: tmp_new_sbox3 = 8'h1b;
	8'hb0: tmp_new_sbox3 = 8'hfc;
	8'hb1: tmp_new_sbox3 = 8'h56;
	8'hb2: tmp_new_sbox3 = 8'h3e;
	8'hb3: tmp_new_sbox3 = 8'h4b;
	8'hb4: tmp_new_sbox3 = 8'hc6;
	8'hb5: tmp_new_sbox3 = 8'hd2;
	8'hb6: tmp_new_sbox3 = 8'h79;
	8'hb7: tmp_new_sbox3 = 8'h20;
	8'hb8: tmp_new_sbox3 = 8'h9a;
	8'hb9: tmp_new_sbox3 = 8'hdb;
	8'hba: tmp_new_sbox3 = 8'hc0;
	8'hbb: tmp_new_sbox3 = 8'hfe;
	8'hbc: tmp_new_sbox3 = 8'h78;
	8'hbd: tmp_new_sbox3 = 8'hcd;
	8'hbe: tmp_new_sbox3 = 8'h5a;
	8'hbf: tmp_new_sbox3 = 8'hf4;
	8'hc0: tmp_new_sbox3 = 8'h1f;
	8'hc1: tmp_new_sbox3 = 8'hdd;
	8'hc2: tmp_new_sbox3 = 8'ha8;
	8'hc3: tmp_new_sbox3 = 8'h33;
	8'hc4: tmp_new_sbox3 = 8'h88;
	8'hc5: tmp_new_sbox3 = 8'h07;
	8'hc6: tmp_new_sbox3 = 8'hc7;
	8'hc7: tmp_new_sbox3 = 8'h31;
	8'hc8: tmp_new_sbox3 = 8'hb1;
	8'hc9: tmp_new_sbox3 = 8'h12;
	8'hca: tmp_new_sbox3 = 8'h10;
	8'hcb: tmp_new_sbox3 = 8'h59;
	8'hcc: tmp_new_sbox3 = 8'h27;
	8'hcd: tmp_new_sbox3 = 8'h80;
	8'hce: tmp_new_sbox3 = 8'hec;
	8'hcf: tmp_new_sbox3 = 8'h5f;
	8'hd0: tmp_new_sbox3 = 8'h60;
	8'hd1: tmp_new_sbox3 = 8'h51;
	8'hd2: tmp_new_sbox3 = 8'h7f;
	8'hd3: tmp_new_sbox3 = 8'ha9;
	8'hd4: tmp_new_sbox3 = 8'h19;
	8'hd5: tmp_new_sbox3 = 8'hb5;
	8'hd6: tmp_new_sbox3 = 8'h4a;
	8'hd7: tmp_new_sbox3 = 8'h0d;
	8'hd8: tmp_new_sbox3 = 8'h2d;
	8'hd9: tmp_new_sbox3 = 8'he5;
	8'hda: tmp_new_sbox3 = 8'h7a;
	8'hdb: tmp_new_sbox3 = 8'h9f;
	8'hdc: tmp_new_sbox3 = 8'h93;
	8'hdd: tmp_new_sbox3 = 8'hc9;
	8'hde: tmp_new_sbox3 = 8'h9c;
	8'hdf: tmp_new_sbox3 = 8'hef;
	8'he0: tmp_new_sbox3 = 8'ha0;
	8'he1: tmp_new_sbox3 = 8'he0;
	8'he2: tmp_new_sbox3 = 8'h3b;
	8'he3: tmp_new_sbox3 = 8'h4d;
	8'he4: tmp_new_sbox3 = 8'hae;
	8'he5: tmp_new_sbox3 = 8'h2a;
	8'he6: tmp_new_sbox3 = 8'hf5;
	8'he7: tmp_new_sbox3 = 8'hb0;
	8'he8: tmp_new_sbox3 = 8'hc8;
	8'he9: tmp_new_sbox3 = 8'heb;
	8'hea: tmp_new_sbox3 = 8'hbb;
	8'heb: tmp_new_sbox3 = 8'h3c;
	8'hec: tmp_new_sbox3 = 8'h83;
	8'hed: tmp_new_sbox3 = 8'h53;
	8'hee: tmp_new_sbox3 = 8'h99;
	8'hef: tmp_new_sbox3 = 8'h61;
	8'hf0: tmp_new_sbox3 = 8'h17;
	8'hf1: tmp_new_sbox3 = 8'h2b;
	8'hf2: tmp_new_sbox3 = 8'h04;
	8'hf3: tmp_new_sbox3 = 8'h7e;
	8'hf4: tmp_new_sbox3 = 8'hba;
	8'hf5: tmp_new_sbox3 = 8'h77;
	8'hf6: tmp_new_sbox3 = 8'hd6;
	8'hf7: tmp_new_sbox3 = 8'h26;
	8'hf8: tmp_new_sbox3 = 8'he1;
	8'hf9: tmp_new_sbox3 = 8'h69;
	8'hfa: tmp_new_sbox3 = 8'h14;
	8'hfb: tmp_new_sbox3 = 8'h63;
	8'hfc: tmp_new_sbox3 = 8'h55;
	8'hfd: tmp_new_sbox3 = 8'h21;
	8'hfe: tmp_new_sbox3 = 8'h0c;
	8'hff: tmp_new_sbox3 = 8'h7d;
      endcase // case (addr)
    end // inv_sbox_rom3

endmodule // aes_inv_sbox

//======================================================================
// EOF aes_inv_sbox.v
//======================================================================
