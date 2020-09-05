dist( X, X, 0 ).
dist( X, Y, Z ) :- X < Y, Z is Y-X.
dist( X, Y, Z ) :- X > Y, Z is X-Y.

canstrike( q(X1,Y1), q(X1,Y2) ).
canstrike( q(X1,Y1), q(X2,Y1) ).
canstrike( q(X1,Y1), q(X2,Y2) ) :- 
	dist(X1, X2, Z1), dist(Y1, Y2, Z2), Z1 is Z2.

betw( L, U, L ) :- L =< U. 
betw( L, U, X ) :- L < U, L1 is L + 1, betw(L1, U, X).

cannotstrike([], q(X, Y)).
cannotstrike( [H | T], q(X,Y) ) :- 
	\+ canstrike(H, q(X, Y)),
	cannotstrike(T, q(X, Y)).

queens( 0, N, P1, P1 ).
queens( I, N, P1, P2 ) :- 
	I > 0, I1 is I - 1,  
	betw(1, N, X), betw(1, N, Y),
	cannotstrike( P1, q(X, Y) ), P3 = [ q(X,Y) | P1 ],
	queens(I1, N, P3, P2 ).
