%introduccion al lenguaje de nucleo 
%programcion con invariantes 
%programacion simbolica
%progracion de alto nivel 


%declarar una variable --> declare y luego la variable 
%imprimir {Browse X}
%declara una variable con nombre X y luego otra con el mismo nombre l'anterior se actualiza siempre y cuando escribamos declare denuevo entonces pedemos acceso a la primera 

declare X
X = 11
{Browse X}

declare X
X = 12
{Browse X}

declare 
fun {Sqr X} X*X end % declarar una funcion 
{Browse {Sqr 2}} %IMPRIMIR EL RESULTADO

 % dos tipos de donnes 1. numeros exactos 2. numeros float ellos no se cambian automaticamente para convertir un entero a float hay que llamar 
 %la funcion IntToFloat y floar a entero es FloatToInt

declare 
fun {SumDigits3 N}
    (N mod 10 ) + ((N div 10)mod 10)+ ((N div 100)mod 10)
end
{Browse {SumDigits3 123}} %-- resultado 6


%mod y div trabajan con eneteros 
% / division con floats
% multiplicacion con floats y enteros

% una funcion puedo llevar una funcion detro de esta 

declare 
fun {SumDigits6 N}
    {SumDigits3 (N div 1000)}+ {SumDigits3 (N mod 1000)}
end 
{Browse {SumDigits6 234112}} %--resultado 13

% RECURCION
% COMO PARA UNA RECURCION ? CON iF 

declare
fun {SumDigitsR N}
    if N == 0 then 0 % caso de base para para la recursion
    else
        (N mod 10) + {SumDigitsR (N div 10)}
    end
end 
{Browse {SumDigitsR 123}}

%----------------- S2 ---------------------------------------------------------------------

declare
fun {Fact1 N}
    if N==0 then 1
    else N*{Fact1 N-1}  %mouvais maniere
    end 
end

%avec des inverients siempre aumentamos una variable y disminuimos otras pero quedandonos con la formula verdadera

declare 
fun{Fact2 I A} %mieux niveau memoire car la multiplication s'est fait inmediatement    
    if I==0 then A
    else {Fact2 I-1 I*A} %invarient
    end
end
{Browse {Fact2 5 1}}

declare
fun {SumDigits2 S A} % A = accumulateur
    if S==0 then A % condition d'arret
    else {SumDigits2 (S div 10) A+ (S mod 10)} %invariante
    end 
end

{Browse {SumDigits2 23 0}}

%boucles en Oz

%boucle for 
for I in 1..10 do
    {Browse I}
end 

%--- Procedure ----

local P Q in
    proc {P} {Browse 100} end
    proc {Q} {P} end
    local P in 
        proc {P} {Browse 200} end
        {Q}
    end
end

% IDENTIFICADOR LIBRE   -> SON VARIABLES DECLARADAS FUERA DE LA INSTRUCCION QUE LAS LLAMA   

%------------------------------------- lISTES --------------------------------- es una secuencia de valores

%una lista es una lista vide o con un elemento 
<List T> %c'est une liste de elements de type T 
<List <Int>> %representacion santactique de tous les entiers 
<List T> ::= nil | T % la | signofica ou 

%examples 
nil
10|nil
10|11|nil
10|11|12|nil
10|11|12|13|nil

%MANIERS DE DECLARE UNE LISTE
declare
A = 1|22|1|3|nil

declare
B = [1 2 3 22] %plus facile Oz va a print de cette maniere 
%sucre syntactique -> manera de print lisibles y confortablees para el programador 

%calcules avec listes 

declare X 
X = [1 2 3 4 5]
{Browse X}

{Browse X.1} %-> return 1
{Browse X.2} %-> return [2 3 4 5]

%commet on accede au troicieme element

{Browse X.2.2} %-> return [3 4 5]
{Browse X.2.2.1} %-> RETURN 3

declare

fun{Somme L A}
    if L == nil then 0
    else L.1 + {Somme L.2}end 
end

%definition recursive terminal
declare 
fun{SommeT L A}
    if L== nil then A
    else {SommeT L.2 L.1 +A}end 
end 

{Browse {SommeT [1 2 3 4 5] 0}}

%--------------------------------------------------------S3 -------------------------------------- 

%OBTENIR LE nEME element d'une liste 
declare
fun {Nth L N}
    if N ==1 then L.1
    elseif N>1 then 
    {Nth L.2 N-1}
    end
end

{Browse {Nth [1 2 3 4] 2}}


%Pattern Matching
declare 
fun {Sum L}
    case L 
    of nil then 0
    [] H1|H2|T  then H1+H2+{Sum T}
    [] H|nil then H
    end
end
 
{Browse {Sum [4 6 8 10]}}

%lenguaje de nucleo 
%UNA FUNCION PUEDE SER REPRESENTADA COMO UNa procedure con un argumento mas ex:

N = {Length L Z} %---> EQUIVALENTE A -> {Length L Z N}
%COMMET ON TRADUIT un programe

% no necesitamos funciones solo procedures
% no hay funciones imbriques 
% todas la funciones tienen que ser procedures
% las funciones anidadas tienen que convertirse en secuencias 

 %-------------tREES ----------------------
declare
T = tree(key:chien value:dog
    tree(key:chat value:cat
        tree(key:babooin value:baboon leaf leaf)
        tree(key:chenille value:caterpillar leaf leaf))
    tree(key:singe value:ape leaf leaf))

declare 
fun {Lookup K T}
    case T of 
        tree(key:Y value:V Left Right) andthen K==Y then
        found(V)
    [] tree(key:Y value:V Left Right) andthen K<Y then
       {Lookup K Left}
    [] tree(key:Y value:V Left Right) andthen K>Y then 
       {Lookup K Right}
    [] leaf then 
       notfound
    end
end

{Browse {Lookup babooin T}}

declare
fun{Insert X V T}
    case T of 
        tree(key:K value:W Left Right) andthen X==K then 
        tree(key:K value:V Left Right)
    []tree(key:K value:W Left Right) andthen X<K then
        tree(key:K value:W {Insert X V Left} Right)
    []tree(key:K value:W Left Right) andthen X>K then
        tree(key:K value:W Left {Insert X V Right})
    []leaf then
        tree(key:X value:V leaf leaf)
    end
end

declare 
T2 = {Insert cheval hourse T}
{Browse T2}
{Browse T}

%------------------------------------- S4 ----------------------------------