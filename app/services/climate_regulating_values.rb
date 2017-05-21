require 'rserve'

class ClimateRegulatingValues
  def self.calculate(data)
    data_hash = JSON.parse(data.to_json)
    binding.pry 
    connection = Rserve::Connection.new
    connection.assign("data", data.to_json)
    response = connection.eval("ghgvcr::calc_ghgv(data)").to_ruby
  end
end
