require 'byebug'
# Rules:
  # have all its words present in the Annkissam Dictionary.
  # have a verb.
  # have a noun or have at least two articles.

class SentenceComposer
  GRAMMER = {
    noun: ["abcd", "c", "def", "h", "ij", "cde"],
    verb: ["bc", "fg", "g", "hij", "bcd"],
    article:  ["a", "ac", "e"]
  }

  def initialize(input)
    @input = input
    @result = []
  end

  def call
    collect_statements(@input, head = [], structure = [])
    @result
  end

  
  def collect_statements(input, head, structure)
    if input.empty?
      if structure.include?(:verb) && (structure.include?(:noun) || structure.count(:article) > 1)
        @result << head.join(' ')
      end
    else
      GRAMMER.each do |type, words|
        words.each do |word|
          if input.start_with?(word)
            collect_statements(input.slice(word.size..-1), head + [word], structure + [type])
          end
        end
      end
      @result
    end
  end
end