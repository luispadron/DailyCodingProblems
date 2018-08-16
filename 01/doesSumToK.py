# Problem:
# Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
#
# For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
#
# Bonus: Can you do this in one pass?

import collections

def can_two_sum(arr, k):
    nums = collections.defaultdict(int)

    for (i, num) in enumerate(arr):
        compliment = k - num
        if nums.get(compliment) is not None and nums.get(compliment) != i:
            return True
        else:
            nums[num] = i

    return False

print(can_two_sum([10, 15, 3, 7], 17)) # true
print(can_two_sum([0], 0)) # false
print(can_two_sum([], 1)) # false
print(can_two_sum([-1, -2], -3)) # true

