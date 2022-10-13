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
    if (this.size() > 1 {
      this._shape(0, this.rec(c) - 1
    }

  _parent(index) {
    return Math.floor((index - 1) / 2);
  }
  
  /* Private method */
  
  _leftChild(index) {
    (index * 2) + 1;
  }
  
  _rightChild(index) {
    (index * 2) + 2;
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
}
