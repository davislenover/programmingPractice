class Solution:
    def getConcatenation(self, nums: List[int]) -> List[int]:
        ans : List[int] = []
        listLen : int = len(nums)
        for i in range(0,len(nums)*2):
            if (i >= listLen):
                ans.append(nums[i-listLen])
            else:
                ans.append(nums[i])
        return ans

        