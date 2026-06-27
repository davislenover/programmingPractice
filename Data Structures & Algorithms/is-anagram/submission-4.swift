class Solution {
    // For an O(1) space solution, create two hashmaps which count the frequency
    // The hashmaps can be at most 26 in size thus it's bounded by O(1)
    // Then compare to differences
    // Runtime complexity is O(n+m)
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sMap : [Character:Int] = [:];
        var tMap : [Character:Int] = [:];
        for index in s.indices {
            if let curCount = sMap[s[index]] {
                sMap[s[index]]! += 1; // returns optional but we know it's valid so force (!)
            } else {
                sMap[s[index]] = 1;
            }
        }
        for index in t.indices {
            if let curCount = tMap[t[index]] {
                tMap[t[index]]! += 1;
            } else {
                tMap[t[index]] = 1;
            }
        }
        // Compare
        if t.count != s.count {return false;}
        for charVal in sMap.keys {
            if let curValinT = tMap[charVal] {
                if curValinT != sMap[charVal] {
                    return false;
                }
            } else {
                return false;
            }
        }
        return true;
    }
}
