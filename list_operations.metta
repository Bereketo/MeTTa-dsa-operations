; FINDING THE LENGTH OF A LIST
; Checks if the list is empty (Nil), return 0.
; Otherwise, recursively compute the length by adding 1 to the length of the rest of the list.
(= (length Nil) 0)
(= (length (Cons $x $xs))
   (+ 1 (length $xs)))

; Finding the length of the list
! (length (Cons 1 (Cons 2 (Cons 3 Nil))))
; Output [3]


; IS A MEMBER -- Checks if an element is a member of a list
; Base case: if the list is empty (Nil), return False.
; Recursive case: check if the head of the list is the element; if not, check the rest of the list.
(: is-member (-> $t (List $t) Bool))
(= (is-member $x Nil) False)
(= (is-member $x (Cons $y $xs)) (if (== $x $y) True (is-member $x $xs)))

; Test Cases
! (is-member 1 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Output = [True]
! (is-member 4 (Cons 1 (Cons 2 (Cons 3 Nil)))) ; Output = [False]
! (is-member 2 Nil) ; Output = [False]


; APPENDING TO A LIST
; Append two lists. Base case: appending Nil to any list returns that list.
; Recursive case: prepend the head of the first list to the result of appending the tail of the first list to the second list.
(: append (-> List List List))
(= (append Nil $ys) $ys)
(= (append (Cons $x $xs) $ys) (Cons $x (append $xs $ys)))

! (append (Cons 1 (Cons 2 Nil)) (Cons 3 (Cons 4 Nil)))
; Output: (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))


; MAX-LIST -- A function to find the maximum value in a list
; Base case: if the list is empty, return Nil.
; Base case: if the list has only one element, return that element.
; Recursive case: compare the head of the list with the maximum of the rest of the list and return the greater value.
(= (max-list (Nil)) Nil)
(= (max-list (Cons $x Nil)) $x)
(= (max-list (Cons $x (Cons $y $ys)))
   (If (> $x (max-list (Cons $y $ys))) $x (max-list (Cons $y $ys))))


; MIN-LIST -- A function to find the minimum value in a list
; Similar to `max-list`, but returns the smaller of the two values.
(= (min-list (Nil)) Nil)
(= (min-list (Cons $x Nil)) $x)
(= (min-list (Cons $x (Cons $y $ys)))
   (If (< $x (min-list (Cons $y $ys))) $x (min-list (Cons $y $ys))))


; PUSHING TO A LIST
; Prepend an element to the front of a list.
(: push (-> Atom List List))
(= (push $x $xs) (Cons $x $xs))

! (push 1 (Cons 2 (Cons 3 Nil)))
; Output: (Cons 1 (Cons 2 (Cons 3 Nil)))


; POPPING FROM A LIST
; Remove the first element from a list, returning the rest.
(: pop (-> List List))
(= (pop Nil) Nil)
(= (pop (Cons $x $xs)) $xs)

! (pop (Cons 1 (Cons 2 (Cons 3 Nil))))
; Output: (Cons 2 (Cons 3 Nil))


; REMOVE AN ELEMENT
; Base case: remove the element from an empty list, returning Nil.
; If the element to remove matches the head of the list, recursively remove it from the tail.
; Otherwise, keep the head and recursively remove the element from the tail.
(: remove-element (-> Number List List))
(= (remove-element $elem Nil) Nil)
(= (remove-element $elem (Cons $elem $tail)) (remove-element $elem $tail))
(= (remove-element $elem (Cons $head $tail))
   (Cons $head (remove-element $elem $tail)))


; REMOVE DUPLICATE
; First, checks if an element is a member of the list using `is-member`.
; Builds a new list without repeating elements.
(: is-member (-> Atom List Bool))
(= (is-member $elem Nil) False)
(= (is-member $elem (Cons $head $tail))
   (if (= $elem $head) True (is-member $elem $tail)))

(: remove-duplicate (-> List List))
(= (remove-duplicate Nil) Nil)
(= (remove-duplicate (Cons $head $tail))
   (if (is-member $head $tail)
       (remove-duplicate $tail)
       (Cons $head (remove-duplicate $tail))))
! (remove-duplicate (Cons 1 (Cons 2 (Cons 1 (Cons 3 (Cons 2 Nil))))))


; MAP - a function that doubles a number
; Applies a function to each element of the list and returns a new list with the results.
(: map (-> (-> Atom Atom) List List))
(= (map $f Nil) Nil)
(= (map $f (Cons $head $tail))
   (Cons ($f $head) (map $f $tail)))

(= (double $x) (* $x 2))

! (map double (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
; Output [(Cons 2 (Cons 4 (Cons 6 (Cons 8 Nil))))]


; FILTER
; Filters a list based on a predicate function. Includes elements where the predicate returns True.
(= (filter $p Nil) Nil)
(= (filter $p (Cons $x $xs))
   (if ($p $x)
       (Cons $x (filter $p $xs))
       (filter $p $xs)))

; Example predicate to check if a number is greater than 2
(= (gt-2 $x) (> $x 2))
! (filter gt-2 (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
; Output: (Cons 3 (Cons 4 Nil))


; FOLDL EXAMPLE
; Left fold: accumulates a result by applying a function to the accumulator and each element from left to right.
(= (foldl $f $acc Nil) $acc)
(= (foldl $f $acc (Cons $x $xs)) (foldl $f ($f $acc $x) $xs))

; Example function to sum two numbers
(: add (-> Int Int Int))
(= (add $x $y) (+ $x $y))

; Output: [10]


; FOLDR EXAMPLE
; Right fold: accumulates a result by applying a function to each element and an accumulator from right to left.
(: foldr (-> (-> Atom Atom Atom) Atom List Atom))
(= (foldr $f $acc Nil) $acc)
(= (foldr $f $acc (Cons $head $tail))
   ($f $head (foldr $f $acc $tail)))

(= (multiply $a $b) (* $a $b))
! (foldr multiply 1 (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
; Output [24]


; REVERSE A LIST
; Reverses a list by appending the head of the list to the reverse of the tail.
(: reverse (-> List List))
(= (reverse Nil) Nil)
(= (reverse (Cons $head $tail))
   (append (reverse $tail) (Cons $head Nil)))

(: append (-> List List List))
(= (append Nil $list) $list)
(= (append (Cons $head $tail) $list)
   (Cons $head (append $tail $list)))

! (reverse (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
; Output [(Cons 4 (Cons 3 (Cons 2 (Cons 1 Nil))))]


; SORTING A LIST
; Sorts the entire list.
(: insert (-> Atom List List))
(= (insert $x Nil) (Cons $x Nil))
(= (insert $x (Cons $y $ys))
   (if (< $x $y)
       (Cons $x (Cons $y $ys))
       (Cons $y (insert $x $ys))))

(: sort (-> List List))
(= (sort Nil) Nil)
(= (sort (Cons $x $xs)) (insert $x (sort $xs)))

! (sort (Cons 4 (Cons 7 (Cons 3 (Cons 5 Nil)))))
; Output: (Cons 3 (Cons 4 (Cons 5 (Cons 7 Nil))))
