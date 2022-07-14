
require 'rubygems'
require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(URI.open("http://en.wikipedia.org/"))   
puts page.class


   
# puts page.css("h1").css("a") # => title
# puts page.css("h1")[0].text   # => My webpage

#voir si ligne 12 ca créée bien une array avec toute les lignes de la class spécifiée, ici mttn h2. Chaque ligne css, une place dans le harray.



# links = page.css("a")
# puts links.length   # => 6
# puts links[0].text   # => Click here
# puts links[0]["href"] # => http://www.google.com

# /html/body/div[3]/div[3]/div[5]/div[1]/div[1]/div/div[1]/h1/span/a
# <a href="/wiki/Wikipedia" title="Wikipedia">Wikipedia</a>



u = page.xpath('//h1/*')
puts u
# # puts page.xpath('//h1')

# puts u.text


n = %w[a b c d]
puts n

puts n.index("c")