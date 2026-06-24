class MyStack {
public:
    // This can be done with one queue
    // Every time there is a push, take the first element, pop it and enque it then length of the queue - 1 times
    // This shifts the queues ordering to a stack
    // Time complexity of push is thereby O(n)
    // Pop, top and empty is O(1)
    MyStack() {}
    
    void push(int x) {
        stk.push(x);
        for (int i = 0; i < stk.size()-1; i++) {
            int elem = stk.front();
            stk.pop();
            stk.push(elem);
        }
    }
    
    int pop() {
        int elem = stk.front();
        stk.pop();
        return elem;
    }
    
    int top() {
        return stk.front();
    }
    
    bool empty() {
        return stk.empty();
    }
private:
    queue<int> stk;
};

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack* obj = new MyStack();
 * obj->push(x);
 * int param_2 = obj->pop();
 * int param_3 = obj->top();
 * bool param_4 = obj->empty();
 */