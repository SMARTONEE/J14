require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
# puts page.class


firsts = page.css("a[class='cmc-table__column-name--symbol cmc-link']")



def get_symbols
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
firsts = page.css("a[class='cmc-table__column-name--symbol cmc-link']")
# <a href="/currencies/cosmos/" title="Cosmos" class="cmc-table__column-name--symbol cmc-link">ATOM</a>
# <a href="/currencies/bitcoin/" title="Bitcoin" class="cmc-table__column-name--symbol cmc-link">BTC</a>

#Récolte des premiers token
all_symbols_arr = []
firsts.each do |symbol|
    all_symbols = symbol.text
    all_symbols_arr = all_symbols_arr.push(all_symbols)
end

#Récolte des seconds token (from 21 to end)
crypto_20_to_max = page.css("a[class='cmc-link']")[54..233]#uniquement les liens de crypto

crypto_20_to_max.each do |symbol|
    all_symbols = symbol.text
    all_symbols_arr = all_symbols_arr.push(all_symbols)
end
return all_symbols_arr
end

# <td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"><div class="sc-131di3y-0 cLgOOr"><a href="/currencies/bitcoin/markets/" class="cmc-link"><span>$20,652.70</span></a></div></td>
# <tr class="cmc-table-row" style="display:table-row"><td class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__rank"><div class="">1</div></td><td class="cmc-table__cell cmc-table__cell--sticky cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__name"><div class="sc-1ibw5f9-0 bpOMHJ cmc-table__column-name cmc-table__column-name--narrow-layout"><img src="https://s2.coinmarketcap.com/static/img/coins/32x32/1.png" alt="Bitcoin" width="16" height="16" class="cmc-static-icon cmc-static-icon-1"><a href="/currencies/bitcoin/" title="Bitcoin" class="cmc-table__column-name--symbol cmc-link">BTC</a><a href="/currencies/bitcoin/" title="Bitcoin" class="cmc-table__column-name--name cmc-link">Bitcoin</a></div></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"><div class="">BTC</div></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__market-cap"><p color="text" style="white-space:nowrap" font-size="1" class="sc-1eb5slv-0 hykWbK"><span class="sc-1ow4cwt-0 iosgXe">$394.33B</span><span data-nosnippet="true" class="sc-1ow4cwt-1 ieFnWP">$394,333,428,275</span></p></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"><div class="sc-131di3y-0 cLgOOr"><a href="/currencies/bitcoin/markets/" class="cmc-link"><span>$20,652.70</span></a></div></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__circulating-supply"><div class="">19 093 556<!-- --> BTC</div></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__volume-24-h"><a href="/currencies/bitcoin/markets/" class="cmc-link">$29 316 120 922</a></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__percent-change-1-h"><div class="cmc--change-positive">1,96<!-- -->%</div></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__percent-change-24-h"><div class="cmc--change-positive">4,63<!-- -->%</div></td><td class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__percent-change-7-d"><div class="cmc--change-negative">-1,29<!-- -->%</div></td><td class="cmc-table__cell cmc-table__cell--right"><div class="sc-165m3uu-0 ksOxXd"><div class="sc-1i7rbm6-0 fJUCZm cmc-popover"><div class="cmc-popover__trigger"><svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" height="16px" width="16px" viewBox="0 0 24 24" class="sc-16r8icm-0 coGWQa"><path d="M12 14C13.1046 14 14 13.1046 14 12C14 10.8954 13.1046 10 12 10C10.8954 10 10 10.8954 10 12C10 13.1046 10.8954 14 12 14Z"></path><path d="M5 14C6.10457 14 7 13.1046 7 12C7 10.8954 6.10457 10 5 10C3.89543 10 3 10.8954 3 12C3 13.1046 3.89543 14 5 14Z"></path><path d="M19 14C20.1046 14 21 13.1046 21 12C21 10.8954 20.1046 10 19 10C17.8954 10 17 10.8954 17 12C17 13.1046 17.8954 14 19 14Z"></path></svg></div></div></div></td></tr>





def get_prices
    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
firsts_prices = page.css("div[class='sc-131di3y-0 cLgOOr']")

all_prices_arr = []
firsts_prices.each do |prices|
    all_prices = prices.text
    all_prices_arr = all_prices_arr.push(all_prices)
end
return all_prices_arr 
end


# def combine_colomn
    a = get_symbols
    b = get_prices

    result = Hash.new

    result["names"] = a
    result["prices"] = b
    puts result

