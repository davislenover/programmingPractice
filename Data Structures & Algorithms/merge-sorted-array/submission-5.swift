class Solution {
    // Three pointer approach
    // Start at the end of nums1 (i.e. look at largest first)
    // Time complexity is O(m+n), Spatial is O(1) 
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var kPtr : Int = nums1.count-1;
        var ptr1 : Int = m-1;
        var ptr2 : Int = n-1;
        if (m <= 0 && n <= 0) {return;}
        while (kPtr >= 0) {
            if (ptr1 < 0) {
                nums1[kPtr] = nums2[ptr2];
                ptr2 -= 1;
                kPtr -= 1;
            } else if (ptr2 < 0) {
                nums1[kPtr] = nums1[ptr1];
                ptr1 -= 1;
                kPtr -= 1;
            } else if (nums1[ptr1] >= nums2[ptr2]) {
                nums1[kPtr] = nums1[ptr1];
                ptr1 -= 1;
                kPtr -= 1;
            } else {
                nums1[kPtr] = nums2[ptr2];
                ptr2 -= 1;
                kPtr -= 1;
            }
        }
    }
}
