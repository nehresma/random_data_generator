require File.join(File.dirname(__FILE__), 'random_us_geography.rb')

class RandomUSZip < RandomUSGeography
  def initialize(file)
    @field=1
    super(file)
  end
end
