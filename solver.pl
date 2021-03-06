countdownsolve([H], Target, X):-H =:= Target, X = H.


countdownsolve([H1,H2|T], Target, X):-
    
    countdownsolve([H1 | T], Target, X);
    
    countdownsolve([H2 | T], Target, X);
    
    H1 > 1, H2 > 1, Mul = H1 * H2, 
    countdownsolve([Mul | T], Target, X);
    
    H2 > 1, Div = H1 / H2, H1 mod H2 =:= 0,
    countdownsolve([Div | T], Target, X);
    
    Add = H1 + H2,
    countdownsolve([Add | T], Target, X);
    
    Sub = H1 - H2, Sub > 0,
    countdownsolve([Sub | T], Target, X).


countdown([H|T], Target, X):-
    permutation([H|T], Perm),
    countdownsolve(Perm, Target, X).