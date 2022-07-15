require_relative '../lib/dark_trader'

describe "the dark_trader method" do
  it "should return an array" do
    expect(get_symbols.class).to eq(Array)
  end

  it "should return an array of hashes" do
    expect(get_hash_crypto[0].class).to eq(Hash)
    expect(get_hash_crypto[2].class).to eq(Hash)
    expect(get_hash_crypto[10].class).to eq(Hash)
  end

  it "should have many cryptos" do
    expect(get_hash_crypto.length).to be >= 20
  end

  it "should return correct values" do
    expect(get_hash_crypto).to include("BTC"=>20512.52)
    expect(get_hash_crypto).to include("LTC"=>50.99)
    expect(get_hash_crypto).to include("TRX"=>0.06683)
  end

end