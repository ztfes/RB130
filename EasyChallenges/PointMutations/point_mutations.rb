# PROBLEM

  # (hamming distance)
    # Number of point mutations
      # nucleotides at same index in two DNA strands do not match

  # (rules)
    # only compare up to the length of the shortest strand, ignore remaining nucleotides in longer strand
    # 

class DNA
  attr_reader :strand
  def initialize(strand)
    @strand = strand
  end

  def shorter_strand(other_strand)
    if strand.length > other_strand.length
      other_strand.chars
    else
      strand.chars
    end
  end

  def hamming_distance(other_strand)
    distance = 0

    shorter_strand(other_strand).each_with_index do |_, index|
      strand[index] != other_strand[index] ? distance += 1 : ''
    end

    distance
  end
end

#p DNA.new('GGACTGA').hamming_distance('GGACTGA')
#p DNA.new('ACT').hamming_distance('GGA')