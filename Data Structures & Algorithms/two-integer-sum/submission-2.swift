class Solution {
    /* 
        nums1 + nums2 = target -> target - nums1 = nums2
        One pass over the array...
        If target - nums1 does not exist within the hashmap, add nums1 it long with the index as it's value
        We know that there is exactly one pair of indicies which satisfies the solution-
        then we don't need to store a list of indicies because only one other value works
        If target - nums1 exists, then we found the other index which adds with nums1 to the target
        This approach is O(n) time and spatial
    */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var seen : [Int:Int] = [:];
        var index1 : Int = 0;
        var index2 : Int = 0;
        for (index,nums1) in nums.enumerated() {
            let checkVal : Int = target-nums1;
            guard let nums2Idx : Int = seen[checkVal] else {
                // Store the value in the hashmap, continue to the next element
                seen[nums1] = index;
                continue;
            }
            // Otherwise we found the value
            index1 = index;
            index2 = nums2Idx;
            break;
        }
        return [index2,index1];
    }
}
