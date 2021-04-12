declare
fun{Take Xs N}
if (N == 1)then Xs.1|nil
else
case Xs
of H|T then H|{Take T N-1}
[] nil then nil
end 
end
end 

{Browse {Take[r a p h] 2}}

