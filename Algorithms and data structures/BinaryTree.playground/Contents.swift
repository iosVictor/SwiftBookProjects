struct Queue<T>: CustomStringConvertible {
    private var list = LinkedList<T>()
    
    mutating func enqueue(element: T) {
        list.append(element)
    }
    
    func dequeue() -> T? {
        guard !list.isEmpty, let element = list.first else { return nil }
        list.remove(element)
        return element.value
    }
    
    mutating func peek() -> T? {
        return list.first?.value
    }
    
    var description: String {
        return list.description
    }
}


// 1. Бинарное дерево
//
//           12
//          /  \
//         6    15
//        /    /  \
//       2    13   20

// 2. Объявление узла
class Node {
    let value: Int
    let leftChild: Node?
    let rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// левая ветвь
let secondNode = Node(value: 2, leftChild: nil, rightChild: nil)
let sixNode = Node(value: 6, leftChild: secondNode, rightChild: nil)

// правая ветвь
let thirteenNode = Node(value: 13, leftChild: nil, rightChild: nil)
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let fifteenNode = Node(value: 15, leftChild: thirteenNode, rightChild: twentyNode)

let headNode = Node(value: 12, leftChild: sixNode, rightChild: fifteenNode)

func search(node: Node?, searchValue: Int) -> Bool {
    
    if node == nil {
        return false
    }
    
    if node?.value == searchValue {
        return true
    } else if searchValue < node!.value {
            return search(node: node?.leftChild, searchValue: searchValue)
        } else {
            return search(node: node?.rightChild, searchValue: searchValue)
        }
    }
    
    search(node: headNode, searchValue: 13)

// Максимальная глубина бинарного дерева
func maxDepth(head: Node?) -> Int {
    guard let head = head else { return 0 }
    var maxLevel = 0
    var queue = Queue<Node>()
    queue.enqueue(element: head)
    while !queue.isEmpty {
        maxLevel += 1
        let count = queue.count
        for _ in 0..<count {
            let current = queue.dequeue()
            if let left = current?.leftChild {
                queue.enqueue(element: left)
            }
            if let right = current?.rightChild {
                queue.enqueue(element: right)
            }
        }
    }
    return maxLevel
}

maxDepth(head: headNode)
