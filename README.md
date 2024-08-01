# Overview

This repository contains MeTTa files that demonstrate various list and binary tree operations. The files include implementations for common list manipulations and binary tree structures.

**`list_operations.metta`**

### Overview

The `list_operations.metta` file includes a variety of functions for list operations, such as:

- **Finding the Length of a List**: Computes the number of elements in a list.
- **Membership Check**: Determines if an element is present in the list.
- **Appending and Removing Elements**: Functions for modifying lists by adding or removing elements.
- **Removing Duplicates**: Eliminates duplicate elements from a list.
- **Mapping and Filtering**: Applies functions to elements and filters lists based on predicates.
- **Reversing and Sorting**: Reverses the order of elements and sorts the list.

### Example Usage

- **Length of a List**
  ```meTTa
  ! (length (Cons 1 (Cons 2 (Cons 3 Nil))))
    ```
- **Output**
    ```meTTa
    [3]
   ```
- **Checking membership**
    ```meTTa
! (is-member 1 (Cons 1 (Cons 2 (Cons 3 Nil))))
    ```
- **Output**
    ```meTTA
    [True]
    ```

- **Reverse a list** 
    ```meTTa
    ! (reverse (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil)))))
    ```
- **Output**
    ```meTTa
    (Cons 4 (Cons 3 (Cons 2 (Cons 1 Nil))))

    ```
**`binary_tree.metta`** file demonstrates basic binary tree operations:
- **Binary Tree Definition:** Creates and manipulates binary tree nodes.
- **Sample Tree:** Provides a sample binary tree for testing.
- **In-Order Traversal:** Performs an in-order traversal of a binary tree.



- **Node Constructor**
    ```meTTa
    (= (Node $value $left $right) (Node $value $left $right))

    ```

- **Empty Constructor**
    ```meTTa
    (= (Empty) Empty)

    ```
- **Creating a sample binary tree**
    ```meTTa
    (= (sample-tree)
   (Node 1 
         (Node 2 
               (Node 4 (Empty) (Empty))   ; Left subtree of Node 2
               (Node 5 (Empty) (Empty)))  ; Right subtree of Node 2
         (Node 3 
               (Empty)                    ; Left subtree of Node 3
               (Node 6 (Empty) (Empty))))) ; Right subtree of Node 3

    ```

