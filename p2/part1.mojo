# standrad libraries
from collections import List

fn main():
    """
    This function is the main function to excute p1 part 1.
    """

    # try catch block  
    try:
        var lists: List[List[Int]] = extract_report("input.txt")
        var count: Int = count_safe(lists)
        print(count)
    except e:
        print(e)

fn extract_report(path: String) raises -> List[List[Int]]:
    """
    This function reads a file and returns the two lists that it founds.
    It is expected that the file contains two .

    Returns:
        First list of integers.
        Second list of integers.
    """

    # read file
    var f: FileHandle = open(path, "r")
    var lines: List[String] = f.read().splitlines()
    f.close()

    # define first and second lines
    var numeric_lines: List[List[Int]] = List[List[Int]]()

    # convert lines
    for i in range(len(lines)):
        # separate values in line
        var elements: List[String] = lines[i].split(" ")

        # append new list
        numeric_lines.append(List[Int]())

        # append elements
        for element in elements:
            numeric_lines[i].append(int(element[].strip()))

    return numeric_lines


def is_safe(list: List[Int]) -> Bool:
    var safe: Bool = True
    var ascending: Bool = True

    for i in range(1, len(list)):
        var change: Int = list[i] - list[i - 1]
        var abs_change: Int = abs(change)

        if i == 1:
            if change > 0:
                ascending = True
            else:
                ascending = False
        
        if (ascending and (change < 0)) or (not ascending and (change > 0)):
            safe = False
            break

        if (abs_change < 1) | (abs_change > 3):
            safe = False
            break

    return safe

def count_safe(lists: List[List[Int]]) -> Int:
    var count: Int = 0

    for list in lists:
        var safe: Bool = is_safe(list[])

        if safe:
            count += 1

    return count
