==ArrayList==
- ArrayList#new - O(1). Technically, the process is is really O(n), since I have to create the array itself, and that would require initializing each 'index' in this array.
- ArrayList#add - O(n). To add the element into the array, we would have to recreate the array itself.
- ArrayList#get - O(1).
- ArrayList#set - O(1).
- ArrayList#size - O(1).
- ArrayList#insert - O(n). Same as ArrayList#add.