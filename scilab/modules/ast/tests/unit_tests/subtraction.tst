// ============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2012 - DIGITEO - Antoine ELIAS
//
//  This file is distributed under the same license as the Scilab package.
// ============================================================================

// <-- JVM NOT MANDATORY -->

r = 2;
R = [1,2;3,4];
R3(:,:,1) = R;
R3(:,:,2) = R';
c = 1 + 2*%i;
C = [1+2*%i,2+4*%i;3+6*%i,4+8*%i];
C3(:,:,1) = C;
C3(:,:,2) = C';
e = eye();
ei = (5+%i) * eye();
p = 1 + %s - %s**2;
pc = 1 + %s - %s**2 + ( 2 - 3 * %s + 4 * %s**2 ) * %i;
P = [2*p, -3*p;4*p,-5*p];
PC = [2*pc, -3*pc;4*pc,-5*pc];
SP = sparse([1,2;4,5;3,10],[1,2,3]);
SPC = sparse([1,2;4,5;3,10],[1,2,3]) * ( 1 + 4*%i);

i8 = int8(-8);
i16 = int16(-16);
i32 = int32(-32);
i64 = int64(-64);
ui8 = uint8(8);
ui16 = uint16(16);
ui32 = uint32(32);
ui64 = uint64(64);

I8 = int8([-8 -16 ; -24 -32]);
I16 = int16([-16 -32 ; -48 -64]);
I32 = int32([-32 -64 ; -96 -128]);
I64 = int64([-64 -128 ; -192 -256]);
UI8 = uint8([8 16 ; 24 32]);
UI16 = uint16([16 32 ; 48 64]);
UI32 = uint32([32 64 ; 96 128]);
UI64 = uint64([64 128 ; 192 256]);
// double - double

//r - r
assert_checkequal(r - r, 0);
//r - c
assert_checkequal(r - c, 1-%i*2);
//c - r
assert_checkequal(c - r, -1+%i*2);
//c - c
assert_checkequal(c - c, 0*%i);


//double - DOUBLE

//r - R
assert_checkequal(r - R, [1,0;-1,-2]);
rR3ref(:,:,1) = [1,0;-1,-2];
rR3ref(:,:,2) = [1,-1;0,-2] ;
assert_checkequal(r - R3, rR3ref);
//r - C
assert_checkequal(r - C, [ 1-%i*2,-%i*4;-1-%i*6,-2-%i*8]);
rC3ref(:,:,1) = [ 1-%i*2,-%i*4;-1-%i*6,-2-%i*8];
rC3ref(:,:,2) = [ 1+%i*2,-1+%i*6;%i*4,-2+%i*8];
assert_checkequal(r - C3, rC3ref);
//c - R
assert_checkequal(c - R, [%i*2,-1+%i*2;-2+%i*2,-3+%i*2]);
cR3ref(:,:,1) = [%i*2,-1+%i*2;-2+%i*2,-3+%i*2];
cR3ref(:,:,2) = [%i*2,-2+%i*2;-1+%i*2,-3+%i*2];
assert_checkequal(c - R3, cR3ref);
//c - C
assert_checkequal(c - C, [0,-1-%i*2;-2-%i*4,-3-%i*6]);
cC3ref(:,:,1) = [0,-1-%i*2;-2-%i*4,-3-%i*6];
cC3ref(:,:,2) = [%i*4,-2+%i*8;-1+%i*6,-3+%i*10];
assert_checkequal(c - C3, cC3ref);


//DOUBLE - double

//R - r
assert_checkequal(R - r, [-1,0;1,2]);
R3rref(:,:,1) = [-1,0;1,2];
R3rref(:,:,2) = [-1,1;0,2];
assert_checkequal(R3 - r, R3rref);
//R - c
assert_checkequal(R - c, [-%i*2, 1-%i*2; 2-%i*2, 3-%i*2]);
R3cref(:,:,1) = [-%i*2, 1-%i*2; 2-%i*2, 3-%i*2];
R3cref(:,:,2) = [-%i*2, 2-%i*2; 1-%i*2, 3-%i*2];
assert_checkequal(R3 - c, R3cref);
//C - r
assert_checkequal(C - r, [-1+%i*2,%i*4; 1+%i*6, 2+%i*8]);
C3rref(:,:,1) = [-1+%i*2,%i*4; 1+%i*6, 2+%i*8];
C3rref(:,:,2) = [-1-%i*2, 1-%i*6;-%i*4, 2-%i*8];
assert_checkequal(C3 - r, C3rref);
//c - c
assert_checkequal(C - c, [0, 1+%i*2; 2+%i*4, 3+%i*6]);
C3cref(:,:,1) = [0, 1+%i*2; 2+%i*4, 3+%i*6];
C3cref(:,:,2) = [-%i*4, 2-%i*8; 1-%i*6, 3-%i*10];
assert_checkequal(C3 - c, C3cref);

//DOUBLE - DOUBLE
//R - R
assert_checkequal(R - R, [0,0;0,0]);
R3R3ref(:,:,1) = [0,0;0,0];
R3R3ref(:,:,2) = [0,0;0,0];
assert_checkequal(R3 - R3, R3R3ref);
//R - C
assert_checkequal(R - C, [-%i*2,-%i*4;-%i*6,-%i*8]);
R3C3ref(:,:,1) = [-%i*2,-%i*4;-%i*6,-%i*8];
R3C3ref(:,:,2) = [%i*2,%i*6;%i*4,%i*8];
assert_checkequal(R3 - C3, R3C3ref);
//C - R
assert_checkequal(C - R, [%i*2,%i*4;%i*6,%i*8]);
C3R3ref(:,:,1) = [%i*2,%i*4;%i*6,%i*8];
C3R3ref(:,:,2) = [-%i*2,-%i*6;-%i*4,-%i*8];
assert_checkequal(C3 - R3, C3R3ref);
//C - C
assert_checkequal(C - C, [0,0;0,0]*%i);
C3C3ref(:,:,1) = [0,0;0,0];
C3C3ref(:,:,2) = [0,0;0,0];
assert_checkequal(C3 - C3, C3C3ref*%i);


// OPPOSITE

// - []
assert_checkequal(-[], []);
// - eye
assert_checkequal(-e, eye() * -1);
// - eye complex
assert_checkequal(-ei, (-5-%i) * eye());
// - double
assert_checkequal(-r, -2);
// - double complex
assert_checkequal(-c, - 1 - 2*%i);
// - DOUBLE
assert_checkequal(-R, [-1 -2;-3 -4]);
// - DOUBLE COMPLEX
assert_checkequal(-C, [-1-2*%i -2-4*%i;-3-6*%i -4-8*%i]);
// - int
assert_checkequal(-i8, int8(8));
assert_checkequal(-i16, int16(16));
assert_checkequal(-i32, int32(32));
assert_checkequal(-i64, int64(64));
assert_checkequal(-ui8, uint8(-8));
assert_checkequal(-ui16, uint16(-16));
assert_checkequal(-ui32, uint32(-32));
assert_checkequal(-ui64, uint64(-64));
// - INT
assert_checkequal(-I8, int8([8 16 ; 24 32]));
assert_checkequal(-I16, int16([16 32 ; 48 64]));
assert_checkequal(-I32, int32([32 64 ; 96 128]));
assert_checkequal(-I64, int64([64 128 ; 192 256]));
assert_checkequal(-UI8, uint8([-8 -16 ; -24 -32]));
assert_checkequal(-UI16, uint16([-16 -32 ; -48 -64]));
assert_checkequal(-UI32, uint32([-32 -64 ; -96 -128]));
assert_checkequal(-UI64, uint64([-64 -128 ; -192 -256]));
// - SPARSE
assert_checkequal(-SP, sparse([1,2;4,5;3,10],[-1,-2,-3]));
// - SPARSE COMPLEX
assert_checkequal(-SPC, sparse([1,2;4,5;3,10],[1,2,3]) * ( -1 - 4*%i));
// - polynom
assert_checkequal(-p, -1-%s+%s**2);
// - polynom complex
assert_checkequal(-pc, - 1 - %s + %s**2 + ( - 2 + 3 * %s - 4 * %s**2 ) * %i);
// - POLYNOM
assert_checkequal(-P, [-2-2*%s+2*%s**2 3+3*%s-3*%s**2; -4-4*%s+4*%s**2, 5+5*%s-5*%s**2]);
// - POLYNOM COMPLEX
assert_checkequal(-PC, [-2-2*%s+2*%s**2 3+3*%s-3*%s**2; -4-4*%s+4*%s**2, 5+5*%s-5*%s**2] + ([-4+6*%s-8*%s**2 6-9*%s+12*%s**2; -8+12*%s-16*%s**2 10-15*%s+20*%s**2] * %i));
