class Solution {
    // The idea is to binary search k where the upper bound of k is the max pile, lower bound is 1
    // Check if the guessed k value results in a time <= h, if it's the least we've seen thus far record it
    // Keep performing binary search, lowering/increasing k until binary search goes through all possible values which result in a time <= h
    // Results in a O(n*logn) time complexity (binary search is logn and need to check k everytime which takes n steps per k)
    // Spatial is O(1) (though technically O(n) as we copy the array)
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // Binary search k, where the upper bound for k is the maximum size for all the piles
        // Thus sort the piles (n*log n time)
        var pilesCpy : [Int] = piles;
        pilesCpy.sort();
        var right : Int = pilesCpy[pilesCpy.count-1];
        var left : Int = 1;
        var lastKWorked : Int = Int.max;
        while(left <= right) {
            let midPoint : Int = (right+left)/2;
            let numHours : Int = Self.simulate(pilesCpy,midPoint);
            if (numHours > h) {
                // k is too low, check bigger
                left = midPoint + 1;
            } else if (numHours <= h) {
                // k works but can we go lower?
                right = midPoint - 1;
                if (lastKWorked > midPoint) {
                    lastKWorked = midPoint;
                }
            }
        }
        return lastKWorked;
    }

    // Function to determine how long it takes to eat all piles at a rate of k banana's per hour
    // O(n) time
    private static func simulate(_ piles : [Int], _ k : Int) -> Int {
        var totalHours : Int = 0;
        for (_,element) in piles.enumerated() {
            totalHours += (element + k - 1)/k; // celling divison in swift
        }
        return totalHours;
    }
}
