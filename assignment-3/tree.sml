datatype tree = empty 
 | node of (int * tree * tree);

fun insert empty x = node(x, empty, empty)
 | insert (node(y, left, right)) x =
    if x<y then node(y, insert left x, right)
    else if x>y then node(y, left, insert right x)
    else node(y, left, right);

fun member empty x = false
 | member (node(y, left, right)) x = 
    if x<y then member left x
    else if x>y then member right x
    else true;