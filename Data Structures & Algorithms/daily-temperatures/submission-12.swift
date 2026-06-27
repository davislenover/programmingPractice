class Solution {
    /* 
        Approach is to use a monotonic stack, i.e., values on top will be less than values lower
        If a value is found to be less than the top of the stack, add it to the stack then move to next element in array
        If a value is found to be greater than the top of the stack, pop the element out, add 1 to count
        With this poped element move back in the result array until finding the given index of said element
        While moving back, if the element isin't the poped element, add 1 to the count
        once we find that element, insert count into the result array, reset count to the number of poped elements
        Then check if the next element in the stack is still less than the current array index, if it is add 1 to the count perform same backtrack
        Once pointer for main array reaches beyond end, stack no longer matters return results (as all other elements don't have a future date)
        This approach results in an O(n) time and spatial complexity
    */
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var resultsArr : [Int] = Array(repeating:0,count:temperatures.count);
        if (temperatures.count == 1) { return resultsArr; }
        var tracker : Stack = Stack();
        var tempPtr : Int = 1;
        // Add first value to the stack
        tracker.push(0);
        while(tempPtr != temperatures.count) {
            if (temperatures[tracker.peek()] >= temperatures[tempPtr]) {
                tracker.push(tempPtr);
            } else {
                var count : Int = 1;
                var tempPtr3 : Int = tempPtr;
                while(tracker.numOfElem() != 0 && temperatures[tracker.peek()] < temperatures[tempPtr]) {
                    var tempPtr2 : Int = tempPtr3 - 1;
                    var tempCount : Int = 0;
                    let popedIdx : Int = tracker.peek();
                    tracker.pop();
                    while(tempPtr2 != popedIdx) {
                        tempCount += 1;
                        tempPtr2 -= 1;
                    }
                    resultsArr[tempPtr2] = count + tempCount;
                    tempPtr3 -= 1;
                    count += 1;
                }
                tracker.push(tempPtr);
            }
            tempPtr += 1;
        }
        return resultsArr;
    }

    class Stack {
        private var storage : [Int] = [];
        private var curInsertPtr : Int = 0;
        private var count : Int = 0;

        public func push(_ elem : Int) {
            if (self.curInsertPtr == self.storage.count) {
                self.storage.append(elem);
            } else if (self.curInsertPtr < self.storage.count) {
                self.storage[self.curInsertPtr] = elem;
            }
            self.curInsertPtr += 1;
            self.count += 1;
        }

        public func pop() {
            if (self.curInsertPtr - 1 >= 0) {
                self.curInsertPtr -= 1;
                self.count -= 1;
            }
        }

        public func peek() -> Int {
            if (self.curInsertPtr - 1 >= 0) {
                return self.storage[self.curInsertPtr-1];
            }
            return 0;
        }

        public func numOfElem() -> Int {
            return self.count;
        }
    }
}
