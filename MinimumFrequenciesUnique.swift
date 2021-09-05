print("Hello  Minimum Deletions to Make Character Frequencies Unique!")

var sol = Solution()

var s = "25525511135"
print(sol.minDeletions(s))
s = "aab"
print(sol.minDeletions(s))
s = "aaabbbcc"
print(sol.minDeletions(s))
s = "ceabaacb"
print(sol.minDeletions(s))
s = "hhsswwddddiiifgfgw"
print(sol.minDeletions(s))


func tests() {
    let s = Solution()
    assert(s.minDeletions("aab") == 0 )
    assert(s.minDeletions("aaabbbcc") == 2 )
    assert(s.minDeletions("ceabaacb") == 2 )
}

tests()


class Solution {
    func minDeletions(_ s: String) -> Int {
        
        // base case
        guard s.count > 0 else { return 0}
        
        var count: Int = 0
        
        var dict: [Character:Int] = [:]
        s.forEach({dict[$0, default: 0] += 1 })
        
        var set: Set<Int> = []
        
        dict.forEach({
            guard var value = dict[$0.key] else { return }
            
            while set.contains(value) {
                value -= 1
                count += 1
            }
            
            if value > 0 { set.insert(value) }
            
        })
        return count
        
    }
}
