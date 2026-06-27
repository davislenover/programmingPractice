class Solution {
    /* Treat as one contiguous array then perform binary search
    To get row idx, idx / m
    To get column idx, idx % m...where m is number of columns
    Ex, 8 (assuming integers round towards 0) -> row = 8 / 4 = 2
    column = 8 mod 4 = 0
    matrix[2][0]
    Ex, 9 -> row = 9 / 4 = 2
    column = 9 mod 4 = 1 
    */
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        return Self.binarySearch(matrix,target,0,(matrix[0].count*matrix.count)-1,matrix[0].count);
    }
    private static func binarySearch(_ arr2D : [[Int]], _ target : Int, _ start : Int, _ end : Int, _ numCol : Int) -> Bool {
        if (end-start < 0) {return false;}
        let curIndex : Int = (end-start)/2 + start;
        let mtxIdx : (Int,Int) = Self.getMtxIdxs(curIndex,numCol);
        let val = arr2D[mtxIdx.0][mtxIdx.1];
        if (val == target) {return true;}
        if (val < target) {
            return Self.binarySearch(arr2D,target,curIndex+1,end,numCol);
        } else {
            return Self.binarySearch(arr2D,target,start,curIndex-1,numCol);
        }
    }
    private static func getMtxIdxs(_ idx : Int, _ numCol : Int) -> (Int,Int) {
        return (idx/numCol,idx % numCol);
    }
}
