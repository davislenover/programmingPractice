class Solution {
    /* 
        Approach is to use two pointers and two hashmaps, basically for some index i with n elements in nums-
        need to know the product of nums[0]*nums[1]*...*nums[i-1] * nums[i+1]*nums[i+2]*...nums[n-1]
        as such slide two pointers on opposite ends, constructing product left and right hand sides
        This results in an O(n) time and spatial solution
    */
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var mapLeft : [Int:Int] = [:];
        var mapRight : [Int:Int] = [:];
        var leftRunningProduct : Int = nums[0];
        var rightRunningProduct : Int = nums[nums.count-1];
        var leftPtr : Int = 0;
        var rightPtr : Int = nums.count-1;
        while(leftPtr < nums.count) {
            mapLeft[leftPtr] = leftRunningProduct;
            mapRight[rightPtr] = rightRunningProduct;
            leftPtr += 1;
            rightPtr -= 1;
            if (leftPtr < nums.count && rightPtr >= 0) {
                leftRunningProduct *= nums[leftPtr];
                rightRunningProduct *= nums[rightPtr];
            }
        }
        var returnArr : [Int] = Array<Int>();
        for (index,_) in nums.enumerated() {
            if (index - 1 < 0) {
                returnArr.append(mapRight[index+1]!);
            } else if (index + 1 == nums.count) {
                returnArr.append(mapLeft[index-1]!);
            } else {
                returnArr.append(mapLeft[index-1]!*mapRight[index+1]!);
            }
        }
        return returnArr;
    }
}
