require 'anemone'
require 'nokogiri'
require 'open-uri'
require 'robotex'

#クロールの起点となるURLを指定
urls = [
"https://medley.life/medicine/item/4291010F1090"
]

Anemone.crawl( urls,:depth_limit => 0, :skip_query_strings => true) do |anemone|
anemone.on_every_page do |page|
  doc = Nokogiri::HTML.parse(page.body.toutf8)

    # medicine_name = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[2]/div[2]/a[1]").text
    #
    # adaptation_disesase = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[1]/div[2]/ul/li/a").text
    #
    # usage = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[1]/div[3]/ul/li").text
    #
    # side_effect = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[1]/div[5]").text
    #
    # pharmaceutical_company_name = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[2]/div[2]/a[3]").text
    #
    # accepted_name = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[2]/div[2]/a[2]").text
    #
    # dosage_forms = doc.xpath(
    #   "//*[@id="main"]/div[3]/div/div[2]/div[2]/div[2]").text
    price = doc.xpath(
      '//*[@id="main"]/div[3]/div/div[2]/div[2]/div[1]').text
    # puts medicine_name
    # puts accepted_name
    # puts pharmaceutical_company_name
    puts price
    # puts dosage_forms
    # puts usage
    # puts adaptation_disesase
    # puts side_effect
  end
end
