//You are given a string, s, and a list of words, words, that are all of the same length. Find all starting indices of substring(s) in s that is a concatenation of each word in words exactly once and without any intervening characters.
//
//Example 1:
//
//Input:
//s = "barfoothefoobarman",
//words = ["foo","bar"]
//Output: [0,9]
//Explanation: Substrings starting at index 0 and 9 are "barfoor" and "foobar" respectively.
//The output order does not matter, returning [9,0] is fine too.
//Example 2:
//
//Input:
//s = "wordgoodstudentgoodword",
//words = ["word","student"]
//Output: []

import UIKit

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {

        guard words.count > 0, s.count >= words.count * words[0].count  else {
            return []
        }

        var map: [String : Int] = [:]
        var result: [Int] = []
        let wordSize = words[0].count

        for i in 0..<words.count {
            let word = words[i]
            let count = map[word] ?? 0
            map[word] = count + 1
        }

        for i in 0...(s.count - words.count * wordSize) {
            let sub = substring(s: s, start: i, length: wordSize)

            if map[sub] != nil {
                var localMap: [String : Int] = [:]
                for j in 0..<words.count {
                    let wordSub = substring(s: s, start: i+j*wordSize, length: wordSize)
                    let count = localMap[wordSub] ?? 0
                    localMap[wordSub] = count + 1
                }

                if (map == localMap) {
                    result.append(i)
                }
            }
        }

        return result
    }

    func substring(s: String, start: Int, length: Int) -> String {
        let range: Range<String.Index> = Range(NSMakeRange(start, length), in: s)!
        let sub = s[range]
        return String(sub)
    }
}

assert(Solution().findSubstring("barfoothefoobarman", ["foo","bar"]) == [0,9])
assert(Solution().findSubstring("a", ["a","a"]) == [])
assert(Solution().findSubstring("wordgoodgoodgoodbestword",
                                ["word","good","best","good"]) == [8])

