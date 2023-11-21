class ListNode {
    var value: Int
    var next: ListNode?
    init(value: Int, next: ListNode?) {
        self.value = value
        self.next = next
    }
}

func printList(head: ListNode?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? "")
        currentNode = currentNode?.next
    }
}

let forthNode = ListNode(value: 12, next: nil)
let threeNode = ListNode(value: 9, next: forthNode)
let twoNode = ListNode(value: 6, next: threeNode)
let head = ListNode(value: 1, next: twoNode)

let threeNode2 = ListNode(value: 8, next: nil)
let twoNode2 = ListNode(value: 5, next: threeNode2)
let head2 = ListNode(value: 2, next: twoNode2)

func mergeTwoLists(list1: ListNode?, list2: ListNode?) -> ListNode? {
    guard list1 != nil else { return list2}
    guard list2 != nil else { return list1}
    
    let dummyHead: ListNode = ListNode(value: 0, next: nil)
    var l1 = list1, l2 = list2
    var endOfSortedList: ListNode? = dummyHead
    
    while l1 != nil && l2 != nil {
        if l1!.value <= l2!.value {
            endOfSortedList!.next = l1
            l1 = l1!.next
        } else {
            endOfSortedList!.next = l2
            l2 = l2!.next
        }
        endOfSortedList = endOfSortedList?.next
    }
    
    endOfSortedList?.next = l1 == nil ? l2 : l1
    return dummyHead.next
}

let list = mergeTwoLists(list1: head, list2: head2)

printList(head: list)
