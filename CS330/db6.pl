parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

related(X, Y) :-
	parent(X, Y).

related(X, Y) :-
	parent(X, Z),
	related(Z, Y).

valid_list(L),
	check_satisfied(L, L).

check_satisfied(L, [H|T]) :-
	depends(H, X), 
	not_in_list(X, L);
	check_unsatisfaction(L, T).