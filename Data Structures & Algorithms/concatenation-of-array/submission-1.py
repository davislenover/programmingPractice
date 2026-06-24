class Solution:
    def getConcatenation(self, nums: List[int]) -> List[int]:
        listLen : int = len(nums)
        ans : List[int] = [None] * (listLen*2)
        for i in range(0,listLen*2):
            if (i >= listLen):
                ans[i] = nums[i-listLen]
            else:
                ans[i] = nums[i]
        return ans

        