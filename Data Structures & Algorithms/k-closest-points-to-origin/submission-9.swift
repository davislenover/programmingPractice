class Solution {
    /* The approach would be to sort the array based on it's distance to
    the origin using the euclidean distance
    To sort these values we can use quicksort
    This will result on average in n*logn time complexity however worst case
    is O(n^2)
    We can also perform quicksort in place to save spatial complexity
    */
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var ptsCpy = points;
        Self.quickSort(&ptsCpy,0,ptsCpy.count-1);
        // Now construct return array, storing the kth closest elements
        var returnArr : [[Int]] = Array(repeating:[0,0],count:k);
        for (index, element) in ptsCpy.enumerated() {
            if (index > k-1) {break;}
            returnArr[index] = element;
        }
        return returnArr;
    }
    private static func quickSort(_ arr : inout [[Int]],_ start : Int,_ end : Int) {
        if (end-start <= 0) {
            return;
        }
        // Choose pivot to be leftmost element
        var pivot : Float = Self.getEuclideanDistance(Float(arr[end][0]),Float(arr[end][1]),0.0,0.0);
        var swapPtr : Int = start;
        for index in start...end {
            var curPtDist : Float = Self.getEuclideanDistance(Float(arr[index][0]),Float(arr[index][1]),0.0,0.0);
            if (index == end || curPtDist < pivot || abs(curPtDist - pivot) < 1e-6) { // Comparing equality in floats
                // Perform swap
                var temp : [Int] = arr[swapPtr];
                arr[swapPtr] = arr[index];
                arr[index] = temp;
                swapPtr += 1;
            }
        }
        
        // Call quicksort on partitions
        // -2 as swapPtr will end up at a position one ahead of the sorted pivot point
        // and since the pivot point is sorted, we can ignore it thus -2
        Self.quickSort(&arr,start,swapPtr-2); // Left partition
        Self.quickSort(&arr,swapPtr,end); // Right partition
    }
    private static func getEuclideanDistance(_ xPos1 : Float, _ yPos1 : Float, _ xPos2 : Float, _ yPos2 : Float) -> Float {
        return sqrt(pow(xPos1-xPos2,2) + pow(yPos1-yPos2,2));
    }
}
