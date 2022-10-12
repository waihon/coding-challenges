class PriorityQueue {
  constructur(comparator = (a, b) => a > b) {
    this._heap = [];
    this._comparator = comparator;
  }
  
  size() {
    return this._heap.length;
  }
  
  isEmpty() {
    return size === 0;
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
  
  _leftChild(index) {
    (index * 2) + 1;
  }
  
  _rightChild(index) {
    (index * 2) + 2;
  }
  
  _siftUp() {
    let nodeIdx = this.size() - 1;
    while (nodeIdx > 0 && this._compare(nodeIdx, this._parent(nodeIdx)) {
      this._swap(nodeIdx, this._parent(nodeIdx));
      nodeIdx = this._peek(nodeIdx);
           
}
