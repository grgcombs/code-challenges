# Knowldye-Based Questions

# Coding Challenges

- 1. "Safer" setters/getters: use a combination of serial (getters) and concurrent (Setters) dispatch queues when implementing. Queues are cheap, so make a new pair for each property (or class instance?)

- 4. NSMutableDictionary: (Assume NSHashMap is off-limits). Start with a modest default capacity, create a C array The index to the array will be a ***log*** of a hash integer from the incoming dictionary "key". Without the log, you'd have to allocate an array with (maximum unsigned 64-bit) slots (one for each possible full hash value) Ridiculously large
considering the dictionary might only need a handful of slots. So use a log of the hash against the array capacity to find your slot, then append/read a linked list node at that slot. You'll store the string (or full hash?) key from earlier in that node along with the dictionary's "value" object. So accessing the right array slot is immediate, and then iterating through that slot's linked list is dependent on the number of logged hash key conflicts. Mitigate the likelihood of conflicts by setting a reasonable capacity at the start. Also, as the number of the dictionary's entries grows, you'll reverse the log, now on the number of objects -- when that value nears the initially set capacity, you'll need to copy your linked lists into a new, larger array
