require 'open-uri'
require 'nokogiri'
require 'robotex'
require 'openssl'

robotex = Robotex.new
p robotex.allowed?("https://medley.life/")

url = 'https://medley.life/medicine/item/4291003F2054'
user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
charset = nil
html = open(url, "User-Agent" => user_agent) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)

puts doc.css('#main > div.container > div > div.col-md-4 > div.side-box > a ').each { |a_tag|
  puts a_tag.text
}
