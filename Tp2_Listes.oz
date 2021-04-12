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
