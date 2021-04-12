%----------------tP2-------------------------

%1. Le minimum syndical. 
%Rappelons qu’une liste est soit la liste vide nil, soit une paire H|T, où H est l’élément
%de tête et T est la queue, c’est-à-dire la liste des éléments restants
declare 
L1=[a]
declare
L11 = a|nil
declare
L2=[a [b c] d]
declare
L22 = a|(b|c|nil)|d|nil
declare
L3=[proc {$} {Browse oui} 
    end 
    proc {$} {Browse non} 
    end] 
 
declare
L33 = oui|non|nil
declare
L4=[est une liste]
declare
L44 = est|une|liste|nil
declare
L5=[[a p]]
declare
L55= (a|p|nil)|nil

{Browse L1}
{Browse L11}
{Browse L2}
{Browse L22}
{Browse L33}
{Browse L4}
{Browse L44}
{Browse L5}
{Browse L55}

declare
Lista = [L4.1 L4.2.1 L4.2.2.1 1 2]
{Browse Lista} %-> [est une liste 1 2]

{Browse {L3.1}} %-------commet afficher oui et non ???? !!!!!

declare 
Lista2 = [L2.2.1 d] %-> [[b c] d]
{Browse Lista2}

%Ecrivez deux fonctions Head et Tail qui retournent respectivement la tête et la queue de la liste passée en
%argument.

declare {Head L}
    case L
    of nil then nil
    [] H|_ then H
    else nil
    end
end

{Browse {Head [a b c]}}

declare {Tail L}
    case L
    of nil then nil
    [] _|T then T
    else nil
    end
end
{Browse {Tail [a b c]}}

declare 
fun {Sum N}
    if N==1 then 1
    else N*N + {Sum N-1}
    end
end

{Browse {Sum 2}}

declare Sum in
proc {Sum N ?R} %R est 
    local Num Uno in
    Uno = 1
    Num = (N == Uno)
    if Num then 
        R = 1
    else
        local R1 N1 One Carre in
            One = 1
            N1 = N - One
            {Sum N1 R1}
            Carre = N*N
            R = Carre+N1
        end
        end
    end
end 

{Browse {Sum 2}}


%Languaje Noyaou 

declare
    fun {SumAux N Acc}
        if N == 1 then Acc + 1
        else {SumAux N-1 N*N+Acc} 
        end
    end
    fun {Sum N}
        {SumAux N 0}
    end

{Browse {SumAux 3 0}}