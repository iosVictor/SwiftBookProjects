class ListNode<T> {
    var value: T
    var next: ListNode?
    var previous: ListNode?
    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T>: CustomStringConvertible {
    
    private var head: ListNode<T>?
    private var tail: ListNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: ListNode<T>? {
        return head
    }
    
    var last: ListNode<T>? {
        return tail
    }
    
    mutating func append(value: T) {
        let newNode = ListNode(value: value)
        if tail != nil {
            newNode.previous = tail
            tail?.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.value)"
            node = node?.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
    
    
    mutating func remove(node: ListNode<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.previous = nil
        node.next = nil
        
        return node.value
    }
}

struct Queue<T>: CustomStringConvertible {
    private var list = LinkedList<T>()
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    mutating func enqueue(element: T) {
        list.append(value: element)
    }
    
    mutating func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        list.remove(node: element)
        return element.value
    }
    
    mutating func peek() -> T? {
        return list.first?.value
    }
    
    var description: String {
        return list.description
    }
}

func minesweeper(bombs: [[Int]], rows: Int, columns: Int) -> [[Int]] {
    var field = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    for bomb in bombs {
        
        let row = bomb[0]
        let column = bomb[1]
        field[row][column] = -1
        for i in row - 1...row + 1 {
            for j in column - 1...column + 1 {
                if (0 <= i) && (i < rows) && (0 <= j) && (j < columns) && (field[i][j] != -1) {
                    field[i][j] += 1
                }
            }
        }
    }
    return field
}

var field = minesweeper(bombs: [[0,4],[3,1]], rows: 4, columns: 5)
field.map { (array) in
    print(array)
}

// Расширить доступную часть поля при нажатии
func click(field: inout [[Int]], givenI: Int, givenJ: Int) -> [[Int]] {
    var queue = Queue<[Int]>()
    let rows = field.count
    let columns = (field.first?.count)!
    
    if field[givenI][givenJ] == 0 {
        field[givenI][givenJ] = -2
        queue.enqueue(element: [givenI, givenJ])
    } else {
        return field
    }
    while !queue.isEmpty {
        let position = queue.dequeue()
        for i in (position?.first)! - 1...(position?.first)! + 1 {
            for j in (position?.last)! - 1...(position?.last)! + 1 {
                if (0 <= i) && (i < rows) && (0 <= j) && (j < columns) && (field[i][j] == 0) {
                    field[i][j] = -2
                    queue.enqueue(element: [i,j])
                }
            }
        }
    }
    return field
}

let newField = click(field: &field, givenI: 2, givenJ: 3)
print("-----------------")
newField.map { (array) in
    print(array)
}
