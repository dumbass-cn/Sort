
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
