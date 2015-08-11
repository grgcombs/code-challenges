/**
Given a string of words and a maxWidth, write a method that inserts new lines where appropriate to perform a word-wrap. (Wrap on word boundaries, assume " " is fine). 

Now, assume that you must call a provided method -widthOfString: for any combination of words in a string. This is to account for the differences in letter kerning and glyph sizes in the font. For example, the width of "ham" + the width of "burger" is not the same as the width of "hamburger". 

Now, how does your implementation handle string with multiple spaces between words ... Are those extra spaces lost or preserved? (Not necessary to actually preserve them, so long as you note the loss as a known caveat).
*/

import Foundation

/**
Wrap a given string to a maxWidth, at word boundaries.
- Requires a single grapheme for space and newline.
- Preserves extra spaces.
- Single words > maxWidth are not wrapped/clipped.
- No additional storage.
- O(N)

:param: string   A string to word-wrap
:param: maxWidth The maximum width per line

:returns: A newly wrapped string
*/
func wrapStringToMaxWidth(string : String, maxWidth : Int) -> String
{
    var str = string
    let length = count(str)
    assert(length > 0, "Invalid string length")

    var previousSpace = str.endIndex
    var i = str.startIndex
    var lineWidth = 0

    func wrapToSpaceAndResetNext(i: String.Index, space : String.Index) -> Int
    {
        let range = space...space;
        str.replaceRange(range, with: "\n")
        let width = distance(space.successor(), i)
        return width
    }

    for i in str.startIndex ..< str.endIndex {
        let char : Character = str[i]

        if (char == Character(" ")) {
            previousSpace = i
        }

        if (lineWidth >= maxWidth &&
            previousSpace < str.endIndex)
        {
            lineWidth = wrapToSpaceAndResetNext(i, previousSpace)
            previousSpace = str.endIndex
            continue
        }

        lineWidth++
    }
    return str
}

/**
A mock function that would  calculate the string with, with kerning.  It would account for the differences in letter kerning and glyph sizes in the font. For example, the width of "ham" + the width of "burger" is not the same as the width of "hamburger".

:param: string A string to calculate the width.  The string should not be an empty string.

:returns: The string's kerning width.  This mock method simply returns the number of characters in the string.
*/
func kerningWidthOfString(string : String) -> Int {
    return count(string)
}

/**
Wrap a given string to a maxWidth, at word boundaries.
- Requires a single grapheme for space and newline.
- Preserves extra spaces.
- Single words > maxWidth are not wrapped/clipped.
- Requires additional storage for current line.
- O(N)??? (excluding cost of kern width calculation)

:param: string   A string to word-wrap
:param: maxWidth The maximum width per line

:returns: A newly wrapped string
*/
func wrapStringToMaxKerningWidth(string : String, maxWidth : Int) -> String
{
    var str = string
    let length = count(str)
    assert(length > 0, "Invalid string length")

    var previousSpace = str.endIndex
    var i = str.startIndex
    var lineWidth = 0

    var lineStart = str.startIndex
    var currentLine = ""

    func wrapToSpaceAndResetNext(i: String.Index, space : String.Index) -> Int
    {
        let range = space...space;
        str.replaceRange(range, with: "\n")

        let nextRange = space.successor() ... i
        currentLine = str.substringWithRange(nextRange)
        return kerningWidthOfString(currentLine)
    }

    for i in str.startIndex ..< str.endIndex {
        let char : Character = str[i]

        if (char == Character(" ")) {
            previousSpace = i
        }

        if (lineWidth >= maxWidth &&
            previousSpace < str.endIndex)
        {
            lineWidth = wrapToSpaceAndResetNext(i, previousSpace)
            previousSpace = str.endIndex
            continue;
        }

        currentLine.append(char)
        lineWidth = kerningWidthOfString(currentLine)
    }
    return str
}


let str = "This is a very long string which has to be converted"
let wrapped = wrapStringToMaxWidth(str, 10)
println(wrapped)

let kernWrapped = wrapStringToMaxKerningWidth(str, 10)

assert(wrapped == kernWrapped, "Results should be equal")
