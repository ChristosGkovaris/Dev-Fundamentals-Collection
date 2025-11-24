%-------------------------------------------------------------------------------------------------------

f(0,X,Y,Res) :- Res is (Y+1).
f(1,X,0,Res) :- Res is X.
f(2,X,0,Res) :- Res is 0.
f(N,X,0,Res) :- N>=3, Res is 1.
f(N,X,Y,Res) :- N>=1, Y>=1, K is (N-1), H is (Y-1), f(N,X,H,L), f(K,X,L,Res1), Res is Res1.

%-------------------------------------------------------------------------------------------------------

f(A,B,I,Res) :- helper(A,B,A,Res).

helper(A,B,I,0) :- I>B.
helper(A,B,I,Res) :- calculate_mod(A,B,I,M,N),
                     S is (M+N),
                     value(S,X),
                     I1 is (I+1),
                     helper(A,B,I1,Res1),
                     Res is (Res1+X).

calculate_mod(A,B,I,M,N) :- M is (I mod A), N is (B mod I).

value(S,X) :- S is 0, X is 1.
value(S,X) :- S>0, X is 0.

%-------------------------------------------------------------------------------------------------------

sum_of_digits(0,0).
sum_of_digits(N,0) :- N<0.
sum_of_digits(N,Res) :- N>0,
                        LastDigits is (N mod 10),
                        RemainingDigits is (N // 10),
                        sum_of_digits(RemainingDigits, Sum),
                        Res is (LastDigits+Sum).

%-------------------------------------------------------------------------------------------------------

generate_list(M,M,L) :- L[M].
generate_list(M,N,L) :- M>N, L=[].
generate_list(M,N,[H|T]) :- M<N, H is M, K is (M+1), generate_list(K,N,T).

%-------------------------------------------------------------------------------------------------------

generate_list_ap(0,M,K,[]).
generate_list_ap(N,M,K,[]) :- N<0.
generate_list_ap(N,M,K,[M|T]) :- N>0,
                                 integer(M),
                                 integer(K),
                                 J is (M+K),
                                 N1 is (N-1).
                                 generate_list_ap(N1,J,K,T). 

%-------------------------------------------------------------------------------------------------------

insertAt(X,N,L,S) :- helper(X,N,L,S).

helper(X,0,L,[X|L]).
helper(X,N,[H|T1],[H|T2]) :- N>0,
                             integer(N),
                             N1 is (N-1),
                             helper(X,N1,T1,T2).

%-------------------------------------------------------------------------------------------------------

insertAfter(X,Y,L,S) :- helper(X,Y,L,S).

helper(X,Y,[Y|T],[Y,X|T]).
helper(X,Y,[H|T1],[H|T2]) :- Y\=H, helper(X,Y,T1,T2).

%-------------------------------------------------------------------------------------------------------

insertNew(X,L,S) :- helper(X,L,S).

helper(X,[],[X]).
helper(X,[X|T],[X|T]).
helper(X,[H|T1],[H|T2]) :- X\=H, helper(X,T1,T2).

%-------------------------------------------------------------------------------------------------------

deleteK(X,K,L,S) :- helper(X,K,L,S).

helper(_,0,L,L).
helper(X,1,[H|T],T).
helper(X,K,[H|T1],[H|T2]) :- X\=H, helper(X,K,T1,T2).
helper(X,K,[H|T1],[H|T2]) :- integer(K),
                             K>1,
                             K1 is (K-1),
                             helper(X,K1,T1,T2).

%-------------------------------------------------------------------------------------------------------

deleteN(X,N,L,S) :- helper(X,N,L,S).

helper(_,0,L,L).
helper(X,1,[X|T],T).
helper(X,N,[H|T1],FinalList) :- N>1,
                                N1 is (N-1),
                                helper(X,N1,T1,FinalList).
helper(X,N,[H|T1],[H|T2]) :- X\=H,
                             helper(X,N,T1,T2).

%-------------------------------------------------------------------------------------------------------

integral(F,A,B,D,Res) :- helper(F,A,B,D,Res).

helper(F,A,B,D,Res) :- C=<D, C is (B-A), Res is (C*((F(A)+F(B))/2)).
helper(F,A,B,D,Res) :- C>D, M is (A+((B-A)/2)), helper(F,A,M,D,Res1), helper(F,M,B,D,Res2), Res is (Res1+Res2).

%-------------------------------------------------------------------------------------------------------