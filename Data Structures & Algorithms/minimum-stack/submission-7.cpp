class MinStack {
public:
    // Approach is to use a dynamic array (vector) to store elements
    // For every element pushed, check if it's the min element seen thus far
    MinStack() {} // Nothing to do
    
    void push(int val) {
        if (this->minVals.empty()) {
            this->minVals.push(val);
        } else if (this->minVals.top() >= val) {
            this->minVals.push(val);
        }
        this->myStack.push(val);
    }
    
    void pop() {
        int curMinVal = this->minVals.top();
        if (curMinVal == this->myStack.top()) {
            this->minVals.pop();
        }
        this->myStack.pop();
    }
    
    int top() {
        return this->myStack.top();
    }
    
    int getMin() { // Always called on non-empty stacks thus INT_MAX inital check is fine
        return this->minVals.top();
    }
private:
    stack<int> myStack;
    stack<int> minVals;
};
