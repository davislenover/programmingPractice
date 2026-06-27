class Solution {
    /* 
    Approach is to use two pointers, one on either end of the array
    Recall area is L*H (where height would be smallest height out of the two elements)
    Check the height of each element, if left pointer is bigger or equal, decrement right pointer
    If right pointer is bigger, increment left pointer
    Keep track of the largest area found
    Once both pointers reach eachother, return the maximum area found
    Time complexity is 0(n), spatial is O(1)
    */
    func maxArea(_ heights: [Int]) -> Int {
        var ptrLeft : Int = 0;
        var ptrRight : Int = heights.count-1;
        var maxArea : Int = 0;
        while(ptrLeft != ptrRight) {
            if (heights[ptrLeft] >= heights[ptrRight]) {
                var curArea = heights[ptrRight] * (ptrRight-ptrLeft);
                if (curArea > maxArea) {maxArea = curArea;}
                ptrRight -= 1;
            } else {
                var curArea = heights[ptrLeft] * (ptrRight-ptrLeft);
                if (curArea > maxArea) {maxArea = curArea;}
                ptrLeft += 1;
            }
        }
        return maxArea;
    }
}
