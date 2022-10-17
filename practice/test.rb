puts "sanの年齢は" + 27.to_s + "です"

# to_i 文字列型→整数型に変換
# to_s 整数型→文字列型に変換

puts 100 + "200".to_i

puts "私の名前はメンター太郎です。年齢は" + 24.to_s + "歳です"

puts "WEBCAMP".length

puts "WEBCAMP".reverse

puts "WEBCAMP".include?("WEB")

puts "webcamp".upcase

puts "WEBCAMP".downcase

webcamp = "プログラミング学習"
puts webcamp

Pi = 3.14
puts Pi

name = "A"
weight = 50

puts "#{name}さんの体重は#{weight}kgです"

names = ["Git", "HTML", "CSS"]
puts names[1]

tall = {"太郎" => 185, "二郎" => 170, "花子" => 150}
puts tall["太郎"]

total = 100
if total < 200
  puts "合計は200未満です"
end

hand = "グー"
if hand == "グー"
  puts "出した手はグーです"
end

if hand != "チョキ"
  puts "出した手はチョキではありません"
end

if(hand == "グー") || (hand == "パー")
  puts "出した手はグーまたはパーです"
end

apple = "Nagano"

if apple == "Aomori"
  puts "このリンゴは青森県産です。"
elsif apple == "Nagano"
  puts "このリンゴは青森県産ではなく、長野県産です。"
else
  puts "このリンゴは青森県産でも長野県産でもありません。"
end

total_price = 150
if total_price > 100
  puts "みかんを購入。所持金に余りあり。"
elsif total_price == 100
  puts "みかんを購入。所持金は0円。"
else
  puts "みかんを購入することができません。"
end

puts "キーボードから何か入力してみましょう"
input_key = gets
puts "入力された内容は#{input_key}"

dice = 0

while dice != 6 do
  dice = rand(1..6)
  puts dice
end

for i in 1..6 do
  puts i
end

amounts = {"りんご" => 2, "イチゴ"=>5, "オレンジ"=>3}
amounts.each do |fruit, amount|
  puts "#{fruit}は#{amount}個です"
end

i = 1
while i <= 10 do
  if i == 5
    puts "処理を終了します"
    break
  end
  puts i
  i += 1
end

puts "計算を始めます"
puts "二つの値を入力してください"
x = gets.to_i
y = gets.to_i

puts "計算結果を出力します"
puts "x*y=#{x*y}"
puts "計算を終了します"

puts "計算を始めます"
puts "何回計算を繰り返しますか？"
counts = gets.to_i
i = 0
while i <= counts do
  puts "#{i}回目の計算"
  puts "２つの値を入力してください"
  
  a = gets.to_i
  b = gets.to_i
  
  puts "a=#{a}"
  puts "b=#{b}"

  puts "計算結果を出力します"
  puts "a+b=#{a + b}"
  puts "a-b=#{a - b}"
  puts "a*b=#{a * b}"
  puts "a/b=#{a / b}"
  
  i += 1
end

