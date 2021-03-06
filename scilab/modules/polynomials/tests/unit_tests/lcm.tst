// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2013 - Scilab Enterprises - Bruno JOFRET
// Copyright (C) 2017 - Samuel GOUGEON
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->
// <-- NO CHECK REF -->

s = poly(0,'s');
p = [s,s*(s+1)^2,s^2*(s+2)];
[pp, fact] = lcm(p);

assert_checkequal(pp, s^5+4*s^4+5*s^3+2*s^2);
assert_checkequal(fact, [2*s+5*s^2+4*s^3+s^4, 2*s+s^2, 1+2*s+s^2]);

V=int32([2^2*3^5, 2^3*3^2,2^2*3^4*5]);
assert_checkequal(lcm(V), int32(9720));

// Integer Overflow
V = int32([59356 44517]);
assert_checkequal(lcm(V), int32(178068));

V = int32([50000 50000]);
assert_checkequal(lcm(V), int32(50000));

// With negative integers
// ----------------------
// http://bugzilla.scilab.org/15058
v = [-2*3*5*7  7*11  -13*17];
LCMref = int32(2*3*5*7*11*13*17);
factRef = int32([-11*13*17, 2*3*5*13*17, -2*3*5*7*11]);
[LCM, fact] = lcm(v);
assert_checkequal(LCM, LCMref);
assert_checkequal(fact, factRef);
[LCM, fact] = lcm(-v);
assert_checkequal(LCM, LCMref);
assert_checkequal(fact, -factRef);
