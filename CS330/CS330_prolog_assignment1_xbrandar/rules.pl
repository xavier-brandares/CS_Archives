valid_list([]).

valid_list([H|T]) :-
	package(H),
	valid_list(T).
%--------------------------------------------------
not_in_list(P, []).

not_in_list(P, [H|T]) :-
	different(P, H),
	not_in_list(P, T).

different(P, P) :- !, fail.
different(_,_).
%--------------------------------------------------
check_dependency(P, []) :- fail.

check_dependency(P, [H|T]) :-
	depends(H, P) ; check_dependency(P, T).
%--------------------------------------------------
unsatisfied_dependency(P, []) :- fail.

unsatisfied_dependency(P, L) :-
	valid_list(L),
	not_in_list(P, L),
	check_dependency(P, L).
%--------------------------------------------------
unsatisfied_dependency([]) :- fail.

unsatisfied_dependency(L) :-
	valid_list(L),
	check_unsatisfaction(L, L).
%--------------------------------------------------
check_unsatisfaction(L, []) :- fail.

check_unsatisfaction(L, [H|T]) :-
	depends(H, X), 
	not_in_list(X, L);
	check_unsatisfaction(L, T).
%--------------------------------------------------
dependency_check([]).

dependency_check(L) :-
	negate(unsatisfied_dependency(L)).

negate(X):- X, !, fail.
negate(X).
%--------------------------------------------------
ext_depends(P1, P2) :-
	depends(P1, P2).

ext_depends(P1, P2) :-
	depends(P1, P),
	ext_depends(P, P2).