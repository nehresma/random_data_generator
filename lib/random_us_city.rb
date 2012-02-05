require File.join(File.dirname(__FILE__), 'random_us_geography.rb')

class RandomUSCity < RandomUSGeography
  def initialize(file)
    @field=3
    super(file)
  end
end
