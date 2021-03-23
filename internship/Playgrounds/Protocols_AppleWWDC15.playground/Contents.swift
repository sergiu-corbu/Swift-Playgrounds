import Foundation
// don't start with the class, start with the protocol

protocol Ordered {
    func precedes(other: Self) -> Bool
}
// - when you see Self (self requirement) inside a protocol, it's a placeholder for the type that will conform to that protocol


func binarySearch<T: Ordered>(sortedKeys: [T], forkey k: T) -> Int {
    var lo = 0
    var hi = sortedKeys.count
    while hi > lo {
        let mid = lo + (hi - lo) / 2
        if sortedKeys[mid].precedes(other: k) { lo = mid + 1 }
        else { hi = mid }
    }
    return lo
}

extension Ordered where Self: Comparable {
    func preceeds(other: Self) -> Bool { return self < other }
}

extension Int: Ordered {}
extension String: Ordered {}
extension Double: Ordered {}

let position = binarySearch(sortedKeys: ["2","3","4","5","6"], forkey: "5")
