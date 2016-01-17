==ArrayList==
- ArrayList#new - O(1). Technically, the process is is really O(n), since I have to create the array itself, and that would require initializing each 'index' in this array.
- ArrayList#add - O(1), amortized constant time. The worst-case scenario is O(n), when we call ArrayList#resize_array.
- ArrayList#get - O(1).
- ArrayList#set - O(1).
- ArrayList#size - O(1).
- ArrayList#insert - O(n). Even if we do not need to call ArrayList#resize_array, we do have to spend some time shifting the other elements one index over.
- ArrayList#resize_array - O(n). We need to recreate a brand new array and then copy everything from the old array into the new one.