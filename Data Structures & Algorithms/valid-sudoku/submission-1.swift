class Solution {
    /* 
        Approach is to use seperate hashmaps for rows, columns and squares
        Iterating through each inner 3x3 grid, inserting/checking each corresponding-
        row/column/grid hashmap for duplicates
        This is O(n^2) time complexity and spatial
    */
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowMaps : [Set<Character>] = Array(repeating:Set<Character>(),count:9);
        var colMaps : [Set<Character>] = Array(repeating:Set<Character>(),count:9);
        var gridMaps : [Set<Character>] = Array(repeating:Set<Character>(),count:9);
        // Iterate through grids (left to right per grid row)
        for rowIdx in 0...9-1 {
            for colIdx in 0...9-1 {
                let curChar : Character = board[rowIdx][colIdx];
                if (curChar == ".") {continue;}
                if (rowMaps[rowIdx].contains(curChar)) {
                    return false;
                }
                rowMaps[rowIdx].insert(curChar);
                if (colMaps[colIdx].contains(curChar)) {
                    return false;
                }
                colMaps[colIdx].insert(curChar);
                // Current grid
                let curGridNum : Int = (rowIdx/3)*3 + colIdx/3;
                if (gridMaps[curGridNum].contains(curChar)) {
                    return false;
                }
                gridMaps[curGridNum].insert(curChar);
            }
        }
        return true;
    }
}
