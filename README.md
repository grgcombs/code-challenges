objc-code-challenges
====================

Objective-C/Swift Code Challenges -- Or: How we cope with shame and embarrassment in presence of the masters.

# Knowledge-based Questions

Not coding challenges, but nevertheless you should be able to speak fluently on these subjects. 

- "What is the one question you wish I would've asked?  What question are you sure to nail if I ask it right now?"
- What are some problems with, and advantages to using Core Data for persistence?
- What is the difference between atomic properties and nonatomic? (Be sure to explain how atomic properties are implemented and the performance implications).
- How does NSCache work?
- What are the appropriate cases for implementing delegates, blocks, notifications -- what do you get with notifications that you don't get with others? What do you get with blocks that you don't get with the others. 
- What are the appropriate use-cases where you would use subclassing or use categories?  What are some limitations of each?
- Explain each of the various bitwise operators. What is the result of performing an XOR on two identical integers?
- What happens behind the scenes when you call retain and release on an object? (Don't simply say "it's like malloc() and free()" -- make sure to talk about retain counts increasing/decreasing)
- How does ARC work?  How is it like garbage collection and how is it not?  How does it differ from manual retain/release?
- Explain retain cycles -- what are the common causes of them? (I mentioned blocks referencing self, strong delegates, timers targeting their owners) 
- What's the difference between nil, NULL, and NSNull?  

# Coding Questions

1. What is a good, performant way to implement thread-friendly (if not completely thread-safe) property setters/getters. (Don't say `@synchronized()` or NSLock).

2. (follow-up to NSCache question above) How would you reimplement NSURLCache? Keep in mind, when a response hasn't been stored or accessed in a long time, it should be pruned first when the cache is near capacity. 

3. How would you implement UIView animateWithDuration:animations: (think of using CALayers instead of views)

4. How would you reimplement NSMutableDictionary?

5. How would you restructure an array of strings to be searchable by prefix. Minimize the processing in cases where the user is live-typing in a search bar over a tableView of your strings. (Build a Radix Tree, or "Prefix Tree")

6. Given a single-linked list, how would you find the Nth mode from the end?

7. Given a family tree starting with yourself or some other contemporary person, how would you find the most recent ancestor with the first name "John". (Depth first recursion isn't a good choice here). 

8. How would you implement a gesture recognizer for a "tap, touch-drag" sequence?

9. Given an array of strings, how would you eliminate duplicates?  (I got a "clever, but not sufficient" response when I suggested putting the array into NSOrderedSet and then returning the resulting array.)

10. Given a string of words, write a function to return the number of anagrams found. 

11. Given a histogram data representation, how would you find the adjacent bar columns that collectively yield a rectangle with the largest coverage area. 

12. Given a string of words and a maxWidth, write a method that inserts new lines where appropriate to perform a word-wrap. (Wrap on word boundaries, assume " " is fine). 
 - Now, assume that you must call a provided method -widthOfString: for any combination of words in a string. This is to account for the differences in letter kerning and glyph sizes in the font. 
 - For example, the width of "ham" + the width of "burger" is not the same as the width of "hamburger". 
 - Now, how does your implementation handle string with multiple spaces between words ... Are those extra spaces lost or preserved? (Not important to necessarily preserve them, so long as you note the loss as a known caveat). 

13. Given a list of integers, your task is to write a program to output an integer-valued list of equal length such that the output element at index 'i' is the product of all input elements, except for the input element at 'i'.  
 - As an example, if `inputArray = { 1, 2, 3, 4 }`, then `outputArray = { 2*3*4, 1*3*4, 1*2*4, 1*2*3 }` 
 - It should run in O(n) time and should be space efficient.

14. Write a method to find the first non-repeating integer given an array of integers. 

15. Write a method to determine the maximum depth of a binary tree. This was an add-on for the family tree question. How many generations are recorded for a given person/node

16. Write a function to determine whether one integer is a palindrome of another integer. 
 - Example: 1234 is a palindrome of 4321.  
 - Don't get cute trying to convert them to strings or an array of characters first, do this mathematically and be performance/space conscious. 

17. How would you implement the palindrome test for two strings?

18. How can you tell if a linked-list has a loop in it?

