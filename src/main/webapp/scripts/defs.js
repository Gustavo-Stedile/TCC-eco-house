HTMLElement.prototype.show = function() {
    this.style.display = 'flex';
}
HTMLElement.prototype.invisible = function() {
    this.style.display = 'none';
}

const Node = value => ({
    value: value, 
    previous: null,
    next: null
});

const DoublyLinkedList = (values) => {
    values = Array.from(values);
    let head = Node(values[0]);
    values.shift();
    let tail = head;

    const append = value => {
        const n = Node(value);
        tail.next = n;
        n.previous = tail;
        tail = n;
    }

    if (values.length != 0) {
        values.forEach(val => append(val));       
    }

    return {
        head() {
            return head;
        },
        isTail(n) {
			return n === tail;
		}
    }
    
}