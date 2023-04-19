class NonRepeatingController < ApplicationController
    def find
        string = params[:string]
        non_repeating = find_non_repeating(string)
        render json: {non_repeating: non_repeating}
    end

    private

    def find_non_repeating(string)
        counts = Hash.new(0)
        string.each_char { |char| counts[char] += 1 }
        string.each_char.find{ |char| counts[char] == 1 }
    end
end
