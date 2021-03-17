import UIKit

// subscripts are shortcuts for accessing separate methods
/*subscript(index: Int) ->Int{
    get{
        //return an appropriate subscript value
    }
    set(newValue){
        //perform an action
    }
}
*/

struct timesTable{
    let multiplier: Int
    subscript(index: Int) -> Int{
        return multiplier * index
    }
}

let threetimesTable = timesTable(multiplier: 3)

print("six times 3 is \(threetimesTable[6])")


struct Matrix{
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int){
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows*columns)
    }
    
    func indexIsValid(row: Int, column:Int)->Bool{
        return row>=0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column:Int) -> Double{
        get{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row*columns)+column]
        }
        set{
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row*columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)


enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet{
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)

