declare 
fun{Promenade BT}
    if BT == empty
    then skip
    else
        {Browse BT.1}
        {Promenade BT.left}
        {Promenade BT.right}
    end
end