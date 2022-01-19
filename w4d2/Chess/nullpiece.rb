require "singleton"
require_relative "piece"

class NullPiece < Piece

    include Singleton

    def initialize
        @symbol = " "
    end

    def moves
        []
    end

    def symbol
        @symbol
    end
end