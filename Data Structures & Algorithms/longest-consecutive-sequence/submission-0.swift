class Solution {
    /*
        Approach is to convert the array to a hashset. Then iterate through that hashset, looking to see if set[idx]-1 is not in the set
        If it isin't then we found the start of a sequence, count up (checking if current+1 is in the set still) until reaching a value not in the set
        Keep track of how long we can count up for the longest sequence length
        n steps to convert the array + n times to iterate over the set + n (at most) to count up in the set thus
        O(n) time/spatial
    */
    func longestConsecutive(_ nums: [Int]) -> Int {
        var checkSet : Set<Int> = Set<Int>();
        for element in nums {
            checkSet.insert(element);
        }
        var maxLenFound : Int = 0;
        // Iterate through set
        for setElement in checkSet {
            if (!checkSet.contains(setElement-1)) {
                // Found start of sequence, count up
                var curLengthFound : Int = 1;
                var curElem : Int = setElement+1;
                while(checkSet.contains(curElem)) {
                    curLengthFound += 1;
                    curElem += 1;
                }
                if (curLengthFound > maxLenFound) {
                    maxLenFound = curLengthFound;
                }
            }
        }
        return maxLenFound;
    }
}
