==ArrayList==

- ArrayList#new - O(1). Technically, the process is is really O(n), since I have to create the array itself, and that would require initializing each 'index' in this array.
- ArrayList#add - O(1), amortized constant time. The worst-case scenario is O(n), when we call ArrayList#resize_array.
- ArrayList#get - O(1).
- ArrayList#set - O(1).
- ArrayList#size - O(1).
- ArrayList#insert - O(n). Even if we do not need to call ArrayList#resize_array, we do have to spend some time shifting the other elements one index over.
- ArrayList#resize_array - O(n). We need to recreate a brand new array and then copy everything from the old array into the new one.

==LinkedList==

ArrayList Approach:

- LinkedList#new - O(1)
- LinkedList#insert_first - O(n). This requires inserting an item into the ArrayList, and since inserting is O(n), the LinkedList#insert_first is also O(n) as well.
- LinkedList#insert_last - O(1)
- LinkedList#set - O(1)
- LinkedList#get - O(1)
- LinkedList#remove_first - O(n). This method requires creating a new array to shift everything back one index.
- LinkedList#remove_last - O(1). This only requires deleting the last node in the array and reassigning the tail to the previous node.

Inserting a value in a LinkedList is faster than inserting a value in an ArrayList since you only need to change two elements (the one before and after the inserted Node) instead of having to change the entire array.

Node-Based Approach:

- LinkedList#new - O(1)
- LinkedList#insert_first - O(1).
- LinkedList#insert_last - O(1).
- LinkedList#set - O(n)
- LinkedList#get - O(n)
- LinkedList#remove_first - O(1).
- LinkedList#remove_last - O(1).

A node-based approach to linked lists is great for adding and removing nodes, but is pretty terrible at retreiving and inserting in nodes.

In both the ArrayList Approach and the Node-Based Approach, I have kept track of the "tail" of a Linked List, which was NOT a good idea.

1. First of all, the specs never mentioned keeping track of tails. This is why they mentioned LinkedList#insert_last should originally NOT be O(1)...because, after all, you don't have a pointer to the ending and have to traverse the Linked List to go to the 'tail'.
2. Secondly, it means I have to do some maintance work to make sure that LinkedList#set doesn't accidentally insert in a node that should be a new tail. It's not entirely horrible.

It seems that it might be better to move onto the next lesson in the Algos unit than to worry about some silliness like this.