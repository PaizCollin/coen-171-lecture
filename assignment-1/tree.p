program bst(input, output);
    type 
    tree = ^node;
    node = record
        info : integer;
        left : tree;
        right : tree;
    end;
    var t : tree;
    var x : integer;

    function insert(var root : tree; value : integer) : tree;
    begin
        if root = nil then
        begin
            new(root);
            root^.left := nil;
            root^.right := nil;
            root^.info := value
        end
        else if root^.info < value then
        begin
            root^.right := insert(root^.right, value)
        end
        else if root^.info > value then
        begin
            root^.left := insert(root^.left, value)
        end;

        insert := root
    end;

    function member(var root : tree; value : integer) : boolean;
    begin
        if root = nil then 
            member := FALSE
        else if value < root^.info then
            member := member(root^.left, value)
        else if value > root^.info then
            member := member(root^.right, value)
        else 
            member := TRUE;
    end;

begin
    t := nil;
    readln(x);

    while x <> -1 do
    begin
        t := insert(t, x);
        readln(x)
    end;

    readln(x);

    while x <> -1 do
    begin
        writeln(member(t, x));
        readln(x)
    end;
end.