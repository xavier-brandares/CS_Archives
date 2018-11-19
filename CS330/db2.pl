happy(albert).
happy(alice).
happy(bob).
happy(bill).
with_albert(alice).

dances(alice) :-
	happy(alice),
	with_albert(alice).

male(albert).
male(bob).
male(bill).
male(carl).
male(charlie).
male(dan).
male(edward).

female(alice).
female(betsy).
female(diana).

parent(albert, bob).
parent(albert, betsy).
parent(albert, bill).

parent(alice, bob).
parent(alice, betsy).
parent(alice, bill).

parent(bob, carl).
parent(bob, charlie).

get_parent :-
	parent(X, carl),
	parent(X, charlie),
	format('~w ~s parent~n', [X, "is the"]).

brother(bob, bill).

get_kids(X) :-
	parent(X, Y),
	format('~w is the parent of ~w~n', [X, Y]),
	get_kids(X).

grand_parent(Y, X) :-
	parent(Z, X),
	parent(Y, Z).

blushes(X) :- human(X).
human(derek).

stabs(tybalt, mercutio, sword).
hates(romeo, X) :- stabs(X, mercutio, sword).