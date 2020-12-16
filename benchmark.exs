import AoC2020.Helper, only: [ read_file_to_list_of_ints: 1,
                               read_file_to_list: 1 ]

#day1_input = read_file_to_list_of_ints("inputs/day1_part1.txt")

day2_input = read_file_to_list("inputs/day2.txt")

Benchee.run(%{
      #      "Day 1 Part 1" => fn -> AoC2020.Day1.part_one(day1_input) end,
      #      "Day 1 Part 2" => fn -> AoC2020.Day1.part_two(day1_input) end
      "Day 2 Part 1" => fn -> AoC2020.Day2.part_one(day2_input) end
            })
