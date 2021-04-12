%1. Editer et compiler 
{Browse 1}
{Browse 2}
{Browse 3}
{Browse 4}
% 2. Expressions arithmétiques.
{Browse (1+5)*(9-2)} % -> 42

{Browse (192 - 780) * (~3) - 191 * 967} % para un numero negativo se pone ~

% 3. Entiers et flottants.
%los enteros y flotantes no se mesclan 
{Browse 123 + 456.0} %-> incorrecto 
{Browse 123 + {FloatToInt 456.0}} %-> correcto

%4. Variables. L’instruction declare permet de créer une variable et de lui assigner une valeur.

declare
X=(6+5)*(9-7)

{Browse X} %-> return 22

% l’instruction local ... in ... end permet de déclarer des variables qui ne sont accessible
%que entre le in et le end.

local
    X
in
    X=1
    {Browse X} % Affiche 1
end
{Browse X} % ERREUR: X n'est pas accessible

%5. Déclarations multiples. Encodez le programme suivant dans Mozart :
declare
X=42
Z=~3
{Browse X} % (1)
{Browse Z}

declare
Y=X+5
{Browse Y} % (2)

declare
X=1234567890
{Browse X} % (3)
{Browse Z}

%6. Expressions booléennes

{Browse 3 == 7} % egaux
{Browse 3 \= 7} % differents
{Browse 3 < 7} % plus petit
{Browse 3 =< 7} % plus petit ou egal
{Browse 3 > 7} % plus grand
{Browse 3 >= 7} % plus grand ou egal


declare 
fun{Max X Y Z} 
    if X>Y andthen X>Z then found(X)
    elseif Y>X andthen Y>Z then found(Y)
    else
     found(Z)
    end
end
{Browse {Max 2 4 8}}

declare %funcion que reconoce si es un numero positivo o negativo
fun{Not N}
    if N == nil then 0
    else
        if N > 0 then 1
        else  ~1
        end
    end
end

{Browse {Not ~2}}

% 8. Portée lexicale et environnement.
%la portée d’une déclaration est la zone d’un programme
%où un identificateur est défini et correspond à cette déclaration. L’environnement à un moment donné de
%l’exécution est l’ensemble des identificateurs définis et leurs variables correspondantes en mémoire.

local P Q X Y Z in % (1)
    fun {P X}
        X*Y+Z % (2)
    end
    fun {Q Y}
        X*Y+Z % (3)
    end
X=1
Y=2
Z=3
{Browse {P 4}} %-> 11
{Browse {Q 4}} %-> 7
{Browse {Q {P 4}}} % 14 car {P 4} = 11 et {Q 11] = 1*11+3 = 14(4)
end

% 9. L’abstraction procédurale. 

declare
X=3

declare
fun {Add2 }
    X + 2
end 
{Browse {Add2}} % (1)

declare
fun {Mul2}
    X*2
end
{Browse {Mul2}} % (2)

% La programmation récursive avec des entiers

declare
fun {Sum I}
    if I == 0 then 1
    else I*2 +{Sum I-1}
    end
end
{Browse {Sum 9}}

%RECURSIVE TERMINAL 
declare 
fun {Sum2 I Acc}
    if I == 0 then Acc
    else {Sum2 I-1 (I*2)+Acc}
    end
end

{Browse {Sum2 9 1}}

%5. Un, deux, trois, nous irons au bois (première partie).


declare
proc {BrowseNumber N} 
    {Browse N}
    {Browse N+1}
end

