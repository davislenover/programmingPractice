class Solution {
    /*
        Approach is to sort the array first then use three pointers
        One pointer is fixed to an element, the other two...one starts at idx right after the fixed element, the other idx end
        This will guarentee we never hit a duplicate value
        x + y + z = 0 -> -x = y+z -- x is fixed, we can move pointers for y and z
        so if y+z is smaller than -x, we need to remove the smaller number
        if y+z is greater than x, we need to remove the bigger number
        Since the array is sorted, all simillar values are grouped together
        This means if right or left pointer have identical values in their direction beside them, after just finding a valid triplet, move those pointers over again
        If my fixed pointer is also the same as the previous fixed pointer, then we will find the same values again so skip this iteration!
        these are the conditions for moving the left and right pointers
        If -x = y+z then we've found a possible solution, add it to a result array
    */
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var numsCpy : [Int] = nums;
        var resultArr : [[Int]] = [];
        // Sort the array (this is n*logn worst case)
        numsCpy.sort();
        for lockedIndex in 0...numsCpy.count-1 {
            if (lockedIndex > 0) {
                if (numsCpy[lockedIndex] == numsCpy[lockedIndex-1]) {
                    continue;
                }
            }
            let targetVal = (-1)*numsCpy[lockedIndex];
            var ptrLeft = lockedIndex+1;
            var ptrRight = numsCpy.count-1;
            while (ptrRight-ptrLeft > 0) {
                if (numsCpy[ptrLeft] + numsCpy[ptrRight] == targetVal) {
                    resultArr.append([numsCpy[lockedIndex],numsCpy[ptrLeft],numsCpy[ptrRight]]);
                    while(ptrLeft != numsCpy.count-1 && numsCpy[ptrLeft] == numsCpy[ptrLeft+1]) {
                        ptrLeft += 1;
                    }
                    while(ptrRight != 0 && numsCpy[ptrRight] == numsCpy[ptrRight-1]) {
                        ptrRight -= 1;
                    }
                    ptrLeft += 1;
                    ptrRight -= 1;
                } else if (numsCpy[ptrLeft] + numsCpy[ptrRight] < targetVal) {
                    // Remove smaller val
                    ptrLeft += 1; // ptrLeft will always be smaller or equal given array is sorted
                } else if (numsCpy[ptrLeft] + numsCpy[ptrRight] > targetVal) {
                    // Remove bigger val
                    ptrRight -= 1; // Will always be greater than or equal
                }
            }
        }
        return resultArr;
    } 
}
