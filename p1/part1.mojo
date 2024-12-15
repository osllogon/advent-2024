# standrad libraries
from collections import List

fn main():
    """
    This function is the main function to excute p1 part 1.
    """

    # try catch block  
    try:
        var lists: Tuple[List[Int], List[Int]] = extract_lists("input.txt")
        var distance: Int = calculate_distance(lists[0], lists[1])
        print(distance)
    except e:
        print(e)

fn extract_lists(path: String) raises -> Tuple[List[Int], List[Int]]:
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
    var first_line: List[Int] = List[Int]()
    var second_line: List[Int] = List[Int]()

    # convert lines
    for line in lines:
        # separate values in line
        var str_line: List[String] = line[].split(" ")

        # append elements
        first_line.append(int(str_line[0].strip()))
        second_line.append(int(str_line[-1].strip()))

    return Tuple(first_line, second_line)


fn calculate_distance(first_list: List[Int], second_list: List[Int]) -> Int:

    # sort first list
    var ordered_first_list: List[Int] = first_list
    sort(ordered_first_list)

    # sort second list
    var ordered_second_list: List[Int] = second_list
    sort(ordered_second_list)

    # compute distance
    var distance: Int = 0
    for i in range(len(first_list)):
        distance += abs(ordered_first_list[i] - ordered_second_list[i])

    return distance