require File.join(File.dirname(__FILE__), 'random_data.rb')

class RandomUSSurname < RandomData
  private
  def read(file)
    @data = File.open(file, 'r').read.split(/\n/).map {|d| d.split(/,/).first}
  end
end
