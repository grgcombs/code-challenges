import Foundation

/**
 *  Swift function to test if two strings are anagrams    
 */
func isAnagram(one: String, two: String) -> Bool
{
    if one.startIndex != two.startIndex ||
       one.endIndex != two.endIndex
    {
        return false
    }

    var occurances : [Character : Int] = [:]

    for var i=one.startIndex; i < one.endIndex; i++ {

        var count = 0
        let oneChar = one[i]
        let twoChar = two[i]

        func storeOrRemoveOccurance(key : Character, count : Int) {
            if count == 0 {
                occurances.removeValueForKey(key)
                return
            }
            occurances[key] = count
        }

        count = occurances[oneChar] ?? 0
        count++ // add for this 'one' occurance
        storeOrRemoveOccurance(oneChar, count)

        count = occurances[twoChar] ?? 0
        count-- // subtract for this 'two' occurrance
        storeOrRemoveOccurance(twoChar, count)
    }

    return occurances.isEmpty
}

var result = isAnagram("thing", "ghint")
println("thing vs ghint? (exp. true) \(result)")

result = isAnagram("thingg", "hintt")
println("thingg vs hintt? (exp. false) \(result)")
