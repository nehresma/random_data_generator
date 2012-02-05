class RandomData
  def initialize(file)
    read file
    @size = @data.size
  end

  def random
    @data[rand(@size)]
  end

  private
  def read(file)
    @data = File.open(file, 'r').read.split(/\n/)
  end
end
