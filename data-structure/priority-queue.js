class PriorityQueue {
  /* Public methods */
  
  constructur(comparator = (a, b) => a > b) {
    this._heap = [];
    this._comparator = comparator;
  }
  
  size() {
    return this._heap.length;
  }
  
  isEmpty() {
    return this.size() === 0;
  }
  
  peek() {
    this._heap[0];
  }

  push(value) {
    this._heap.push(value);
    this._siftUp();
    
    return this.size();
  }
  
  pop() {
    if (this.size() > 1) {
      // For sapce complexity consideration, instead of calling `shift`
      // to retrieve the greatest value, we swap the 1st and last element
      // of the array, and then calling `pop` to get the greatest value.
      this._swap(0, this.size() - 1);
    }
    const poppedValue = this._heap.pop();
    this._siftDown();

    return poppedValue;
  }

  _parent(index) {
    return Math.floor((index - 1) / 2);
  }
  
  /* Private method */
  
  _leftChild(index) {
    (index * 2) + 1;
  }

  _leftChildExists(index) {
    this._leftChild(index) < this.size();
  }
  
  _rightChild(index) {
    (index * 2) + 2;
  }
  
  _rightChildExists(index) {
    this._rightChild(index) < this.size();
  }

  _swap(i, j) {
    const temp = this._heap[i];
    this._heap[j] = this._heap[i];
    this._heap[i] = temp;
  }
  
  _compare(i, j) {
    return this._comparator(this._heap[i], this._heap[j]);
  }
  
  _siftUp() {
    // Starting with the newly inserted node which is the last element of array
    let nodeIndex = this.size() - 1;
    // We'll iterate until we reach the 2nd level, at which we'll compare one last
    // time with the parent node.
    while (nodeIndex > 0 && this._compare(nodeIndex, this._parent(nodeIndex)) {
      this._swap(nodeIndex, this._parent(nodeIndex));
      nodeIndex = this._parent(nodeIndex);
    }
  }       

  _siftDown() {
    // Starting at the root
    let nodeIndex = 0;
    while (
      (this._leftChildExists(nodeIndex) &&
      this._compare(this._leftChild(nodeIndex), nodeIndex)) || 
      (this._rightChildExists(nodeIndex) &&
      this._compare(this._rightChild(nodeIndex), nodeIndex))
    ) {
      const greaterNodeIndex = this._rightChildExists(index) &&
        this._compare(this._rightChild(nodeIndex), this._leftChild(nodeIndex))
          ? this._rightChild(nodeIndex)
          : this._leftChild(nodeIndex);
      this._swap(greaterChildIndex, nodeIndex);
      nodeIndex = greaterChildIndex;
    }
  }
}
