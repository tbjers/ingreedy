require 'numbers_in_words'

module Ingreedy

  class Rationalizer

    def self.rationalize(options)
      new(options).rationalize
    end

    def initialize(options)
      @integer  = options.fetch(:integer, nil)
      @float    = options.fetch(:float, nil)
      @fraction = options.fetch(:fraction, nil)
      @word     = options.fetch(:word, nil)
    end

    def rationalize
      if @word
        result = rationalize_word
      elsif @fraction
        result = @fraction.to_r
        if @integer
          result += @integer.to_i
        end
      elsif @integer
        result = @integer.to_r
      elsif @float
        result = @float.to_r
      end

      result
    end

    private

    def rationalize_word
      NumbersInWords::ToNumber.new(
        @word, NumbersInWords.language
      ).in_numbers.to_r
    end

  end

end
