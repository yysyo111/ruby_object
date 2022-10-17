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

