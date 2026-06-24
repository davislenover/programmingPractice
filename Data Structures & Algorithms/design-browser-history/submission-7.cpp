class BrowserHistory {
public:
    // Approach is to use a doubly linked list
    // If we visit a url, set url as new tail (i.e., cutoff any further node)
    BrowserHistory(string homepage) {
       // Initalize doubly linked list
       ListNode<string>* home = new ListNode<string>{homepage,nullptr,nullptr};
       this->head = home;
       this->curUrl = this->head;
    }
    
    void visit(string url) {
        // Add Node right after curUrl
        ListNode<string>* beyondCurUrl = this->curUrl->next;
        ListNode<string>* newUrl = new ListNode<string>{url,nullptr,nullptr};
        newUrl->prev = this->curUrl;
        this->curUrl->next = newUrl;
        // All forward nodes will need to be freed from memory to avoid a memory leak
        while(beyondCurUrl) {
            ListNode<string>* nextNode = beyondCurUrl->next;
            delete beyondCurUrl;
            beyondCurUrl = nextNode;
        }
        this->curUrl = this->curUrl->next;
    }
    
    string back(int steps) {
        int stepsLeft = steps;
        while(this->curUrl->prev && stepsLeft) {
            this->curUrl = this->curUrl->prev;
            stepsLeft--;
        }
        return this->curUrl->val;
    }
    
    string forward(int steps) {
        int stepsLeft = steps;
        while(this->curUrl->next && stepsLeft) {
            this->curUrl = this->curUrl->next;
            stepsLeft--;
        }
        return this->curUrl->val;
    }
private:
    template<typename T>
    struct ListNode {
        T val;
        ListNode<T>* next;
        ListNode<T>* prev;
    };
    ListNode<string>* head;
    ListNode<string>* curUrl;

};

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * BrowserHistory* obj = new BrowserHistory(homepage);
 * obj->visit(url);
 * string param_2 = obj->back(steps);
 * string param_3 = obj->forward(steps);
 */