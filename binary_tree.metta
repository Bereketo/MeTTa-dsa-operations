; Define the Node and Empty constructors.
(= (Node $value $left $right) (Node $value $left $right))
(= (Empty) Empty)

; Create a sample binary tree.
(= (sample-tree)
   (Node 1 
         (Node 2 
               (Node 4 (Empty) (Empty))   ; Left subtree of Node 2
               (Node 5 (Empty) (Empty)))  ; Right subtree of Node 2
         (Node 3 
               (Empty)                    ; Left subtree of Node 3
               (Node 6 (Empty) (Empty))))) ; Right subtree of Node 3



; Define the append function to concatenate two lists.
(= (append Nil $list) $list)   ; Base case: appending to an empty list.
(= (append (Cons $head $tail) $list) 
   (Cons $head (append $tail $list))) ; Recursive case: append head and recursively append the tail.


; Define the in-order traversal function.
(= (in-order-traversal (Empty)) Nil) ; Base case: an empty node results in an empty list.
(= (in-order-traversal (Node $value $left $right))
   (append 
      (in-order-traversal $left)      ; Traverse left subtree.
      (Cons $value                    ; Visit the root node.
         (in-order-traversal $right)))) ; Traverse right subtree.


; Test the in-order traversal on the sample tree.
! (in-order-traversal (sample-tree))
