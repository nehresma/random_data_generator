require 'digest/sha1'

class RandomSha1Hash
  def random
    Digest::SHA1.hexdigest "#{Time.now.to_f}#{rand}"
  end
end
