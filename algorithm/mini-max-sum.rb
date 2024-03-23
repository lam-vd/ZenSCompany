# Mini-Max Sum

# Given five positive integers, find the minimum and maximum values that can be calculated by summing
# exactly four of the five integers. Then print the respective minimum and maximum values as a single line
# of two space-separated long integers.
# For example arr = [1, 3, 5, 7, 9], . Our minimum sum is 1 + 3 + 5 + 7 = 16 and our maximum sum is 3 + 5 + 7 + 9 = 24

# We would print
# 16 24
NUMBER_FIRE = 5

def input_array
    puts "Vui lòng nhập vào năm số nguyên dương, cách nhau bởi dấu cách:"
    
    input = gets.chomp.split
    integers = input.first(NUMBER_FIRE).map(&:to_i)

    # Lọc ra các số nguyên dương và loại bỏ các số âm
    positive_integers = integers.select { |num| num > 0 }
    if positive_integers.length == NUMBER_FIRE
        return positive_integers
    else
        puts "Bạn cần nhập đúng năm số nguyên dương. Hãy thử lại."
        return input_array
    end
end

def mini_max_sum(arr)
    # Tính tổng tất cả các phần tử
    total_sum = arr.sum

    # Tìm giá trị nhỏ nhất và giá trị lớn nhất
    min_value = arr.min
    max_value = arr.max
    
    # Tính tổng nhỏ nhất và tổng lớn nhất
    min_sum = total_sum - max_value
    max_sum = total_sum - min_value

    return min_sum, max_sum
end

arr = input_array

min_sum, max_sum = mini_max_sum(arr)
puts "#{min_sum} #{max_sum}"
puts "------------------------------------------"
def calculate_sums(numbers)
    # Chuyển đổi dãy số thành mảng các chuỗi
    numbers_array = numbers.map(&:to_s)

    sums = []

    numbers.each_with_index do |num, index|
        # Tính tổng của các số trong dãy trừ đi số hiện tại
        sum = numbers.sum - num
        sums << sum
    end

    return sums
end

result = calculate_sums(arr)

# In ra kết quả
result.each_with_index do |sum, index|
    puts "If we sum everything except #{arr.map(&:to_s)[index]}, our sum is: #{sum}"
end
