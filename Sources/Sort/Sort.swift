
public func bubbleSorted(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    var input = input
    
    for index in input.indices.dropFirst() {
        var flag = false
        for _index in input.indices.dropLast(index) where input[_index] > input[_index + 1] {
            input.swapAt(_index + 1, _index)
            flag = true
        }
        guard flag else { break }
    }
    
    return input
}

public func selectionSorted(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    var input = input
    
    for index in input.indices.dropLast() {
        for _index in input.indices.dropFirst(index + 1) where input[_index] < input[index] {
            input.swapAt(index, _index)
        }
    }

    return input
}

public func insertionSorted(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    var input = input


    return input
}

public func quickSorted(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    var input = input

    func __partition(start: Int, end: Int) -> Int {
        
        var (start, end, pivot) = (start, end, input[start])
        
        while start < end {
            while start < end, input[end] >= pivot { end -= 1 }
            input[start]  = input[end]
            while start < end, input[start] <= pivot { start += 1 }
            input[end]  = input[start]
        }
        input[start] = pivot
        return start
    }
    
    func __quickSort(start: Int, end: Int) {
        guard start < end else { return }
        let p = __partition(start: start, end: end)
        __quickSort(start: start, end: p - 1)
        __quickSort(start: p + 1, end: end)
    }
    
    __quickSort(start: input.startIndex, end: input.endIndex - 1)
    
    return input
}

func heapSorted(_ input: [Int]) -> [Int] {
    
    guard input.count > 1 else {
        return input
    }
    
    var input = input
    
    func __heapify(index: Int, count: Int) {
        
        let left = index * 2 + 1
        let right = index * 2 + 2
        var _index = index
        
        if left < count, input[left] > input[_index] {
            _index = left
        }
        
        if right < count, input[right] > input[_index] {
            _index = right
        }
        
        if index != _index {
            input.swapAt(index, _index)
            __heapify(index: _index, count: count)
        }
    }
    
    func __build() {
        for index in stride(from: (input.count - 1) / 2 - 1, through: 0, by: -1) {
            __heapify(index: index, count: input.count)
        }
    }
    
    __build()
    
    var index = input.endIndex - 1
    
    repeat {
        input.swapAt(input.startIndex, index)
        __heapify(index: 0, count: index)
        index -= 1
    } while (index > 0)
    
    return input
}

