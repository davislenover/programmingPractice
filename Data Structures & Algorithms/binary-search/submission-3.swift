class Solution {
    // Approach is to use binary search which will satisfy the O(logn) time
    func search(_ nums: [Int], _ target: Int) -> Int {
        return Self.binarySearch(nums,target,0,nums.count-1);
    }
    private static func binarySearch(_ nums : [Int], _ target : Int, _ left : Int, _ right : Int) -> Int {
        var leftPoint : Int = left;
        var rightPoint : Int = right;
        while(leftPoint <= rightPoint) {
            let midPoint : Int = (leftPoint+rightPoint)/2;
            if (target == nums[midPoint]) {return midPoint;}
            if (target > nums[midPoint]) {
                leftPoint = midPoint + 1;
            } else if (target < nums[midPoint]) {
                rightPoint = midPoint - 1;
            }
        }
        return -1;
    }
}
