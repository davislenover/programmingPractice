class Solution {
    // Use a hashmap to frequency count, if we ever encounter a defined key, return true
    // Time complexity is O(n) and spatial is O(n)
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var freqCount : [Int:Int] = [:];
        for (index,element) in nums.enumerated() {
            if let lookup : Int = freqCount[element] {
                return true;
            }
            freqCount[element] = 1;
        }
        return false;
    }
}
