/*Analysis of weak keys for the elliptic curve secp256k1
p=115792089237316195423570985008687907852837564279074904382605163141518161494337;
B=2^32;
/* Divisors of p-1 /*
div=divisors(p-1);
/* Divisors of p-1 below the bound B */
divB=div;
foreach(divB,d,if(d>B,{divB=setminus(divB,[d])}));
/* We ompute the number of weak keys with respect to the bound B */
s=0;
foreach(divB,d,s=s+eulerphi(d));
nB=log(s)/log(2); /* This is the base-2 log of the number of weak keys with order bounded by B*/
/* We compute RpB, i.e., the set of divisors d1<d2<...<dk<=B, such that di is NOT a divisor of dj, for all 1<=i<j<=k */
RpB=divB;
foreach(RpB,d,RpB=setminus(RpB,setminus(divisors(d),[d])));
/* We compute the worst-case number of elliptic curve operation */
t=0;
foreach(RpB,d,t=t+2*ceil(sqrt(d)));
cB=log(t)/log(2); /* This is the base-2 log of the worst-case number of elliptic curve group scalar multiplication 
required to test whether a key comes from a subgroup of order bounded by B*/
