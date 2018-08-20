//: Playground - noun: a place where people can play

//Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
//
//Each row must contain the digits 1-9 without repetition.
//Each column must contain the digits 1-9 without repetition.
//Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.

import UIKit

class Solution {

    struct Grid: Hashable {
        let row: Int
        let column: Int

        static func ==(lhs: Grid, rhs: Grid) -> Bool {
            return lhs.column == rhs.column && lhs.row == rhs.row
        }
        var hashValue: Int { return row ^ column }
    }

    let sizeOfSudoku = 3

    func isValidSudoku(_ board: [[Character]]) -> Bool {

        var columns: [AnyHashable: Set<Character>] = [:]
        var rows: [AnyHashable: Set<Character>] = [:]
        var grids: [AnyHashable: Set<Character>] = [:]

        for row in 0..<board.count {
            let columnArray = board[row]
            for column in 0..<columnArray.count {
                let value = columnArray[column]
                guard value != "." else {
                    continue
                }

                let columnsCheck = check(map: &columns, key: column, value: value)
                let rowCheck = check(map: &rows, key: row, value: value)
                let grid = Grid(row: row / sizeOfSudoku,
                                column: column / sizeOfSudoku)
                let gridCheck = check(map: &grids, key: grid, value: value)

                if columnsCheck || rowCheck || gridCheck {
                    return false
                }
            }
        }

        return true
    }

    func check(map: inout [AnyHashable: Set<Character>],
               key: AnyHashable, value: Character) -> Bool {
        var set = map[key] ?? Set<Character>()
        let result = set.contains(value)
        set.insert(value)
        map[key] = set
        return result
    }
}

let input1: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]
let input2: [[Character]] = [
    ["8","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]
assert(Solution().isValidSudoku(input1) == true)
assert(Solution().isValidSudoku(input2) == false)
