==ArrayList==
- ArrayList#new - O(1). Technically, the process is is really O(n), since I have to create the array itself, and that would require initializing each 'index' in this array.
- ArrayList#add - O(1), amortized constant time. The worst-case scenario is O(n), when we call ArrayList#resize_array.
- ArrayList#get - O(1).
- ArrayList#set - O(1).
- ArrayList#size - O(1).
- ArrayList#insert - O(n). Even if we do not need to call ArrayList#resize_array, we do have to spend some time shifting the other elements one index over.
- ArrayList#resize_array - O(n). We need to recreate a brand new array and then copy everything from the old array into the new one.

==LinkedList==
- LinkedList#new - O(1)
- LinkedList#insert_first - O(n). This requires inserting an item into the ArrayList, and since inserting is O(n), the LinkedList#insert_first is also O(n) as well.
- LinkedList#insert_last - O(1)
- LinkedList#set - O(1)
- LinkedList#remove_first - O(n). This method requires creating a new array to shift everything back one index.
- LinkedList#remove_last - O(1). This only requires deleting the last node in the array and reassigning the tail to the previous node.

Inserting a value in a LinkedList is faster than inserting a value in an ArrayList since you only need to change two elements (the one before and after the inserted Node) instead of having to change the entire array.

