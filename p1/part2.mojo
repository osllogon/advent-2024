# standrad libraries
from collections import List

fn main():
    """
    This function is the main function to excute p1 part 1.
    """

    # try catch block  
    try:
        var lists: Tuple[List[Int], List[Int]] = extract_lists("input.txt")
        var similarity: Int = calculate_similarity(lists[0], lists[1])
        print(similarity)
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


fn calculate_similarity(first_list: List[Int], second_list: List[Int]) -> Int:

    # compute similarity
    var similarity: Int = 0
    for i in range(len(first_list)):
        similarity += first_list[i] * second_list.count(first_list[i])

    return similarity