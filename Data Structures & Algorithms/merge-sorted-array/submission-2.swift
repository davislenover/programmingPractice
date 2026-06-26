class Solution {
    // Three pointer approach
    // Time complexity is O(m+n), Spatial is O(m+n) 
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var nums1Cpy = nums1;
        var kPtr : Int = 0;
        var ptr1 : Int = 0;
        var ptr2 : Int = 0;
        if (m == 0 && n == 0) {return;}
        while (kPtr != m+n) {
            if (ptr1 == m) {
                nums1[kPtr] = nums2[ptr2];
                ptr2 += 1;
                kPtr += 1;
            } else if (ptr2 == n) {
                nums1[kPtr] = nums1Cpy[ptr1];
                ptr1 += 1;
                kPtr += 1;
            } else if (nums1Cpy[ptr1] <= nums2[ptr2]) {
                nums1[kPtr] = nums1Cpy[ptr1];
                ptr1 += 1;
                kPtr += 1;
            } else {
                nums1[kPtr] = nums2[ptr2];
                ptr2 += 1;
                kPtr += 1;
            }
        }
    }
}
