def gen_perms_helper(array, current, subsets, index):
    if index >= len(array):
        subsets.append(current)
        return
    gen_perms_helper(array, current.copy(), subsets, index + 1)
    current.append(array[index])
    gen_perms_helper(array, current.copy(), subsets, index + 1)


def gen_perms(array):
    subsets = []
    gen_perms_helper(array, [], subsets, 0)
    return subsets

print(gen_perms([1, 2, 3]))
