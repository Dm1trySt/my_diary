puts "Привет, я твой дневник. Скажи мне, что у тебя на уме и в душе?"
puts "Я сохраняю все, что ты напишешь до строчки \"end\" в файл"
puts

# Определим папку, в которой лежит эта программа ""
# С помощью служебного объекта Ruby  __FILE__
current_path = File.dirname(__FILE__)

# Ввод пользователя
line = nil
# Текущая запись польщователя
all_lines = []

while line != "end" do
  line = STDIN.gets.encode("UTF-8").chomp
  all_lines << line
end

# .now - Текущее время
time = Time.now

# .strftime - запись в строку
# Запись даты
file_name = time.strftime("%Y-%m-%d")#2019-12-29

# Запись времени
time_string = time.strftime("%H:%M")#13:36

separator = "---------------------------------------------"

# Проверяет существует ли файл и если нет, создает его
file = File.new(current_path + "/" + file_name + ".txt", "a:UTF-8")

# .print - записывает срочку в файл
file.print("\n"+ time_string +"\n")

# .pop - удаляет последнтй элемент (в данном массиве это end)
all_lines.pop

# Запись в файл
for element in all_lines do
  # .puts - запись в файл строки и по окончанию строки добавляет \n
  file.puts(element)
end

file.puts(separator)

# Закрытие файла
file.close

puts "Ваша запись сохранена в файл #{file_name}.txt"