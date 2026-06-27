class Solution {
    // Approach is to use bucket sort since this is a very small range of values
    // Time complexity is O(n) and spatial is technically O(1)
    func sortColors(_ nums: inout [Int]) {
        // First, initalize buckets and fill them
        var buckets : [Int] = Array(repeating:0,count:3);
        for (index,element) in nums.enumerated() {
            buckets[element] += 1
        }
        // Now fill nums in place
        var i : Int = 0;
        for (index,element) in buckets.enumerated() {
            if (element > 0) {
                for count in 0...element-1 {
                    nums[i] = index;
                    i += 1;
                }
            }
        }
    }
}
