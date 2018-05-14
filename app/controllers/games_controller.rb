require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = []
    letters = ("a".."z").to_a
    10.times do
      @letters << letters.sample
    end
  end

  def score
    @attempt = params[:answer]
    @letters = params[:letters]
    # if @letters.include?(params[:answer])
    # def doesitinclude(grid, attempt)
    #   attempt.downcase.chars.all? { |letter| attempt.count(letter) <= grid.join.downcase.count(letter) }
    # end
    if (include?(@letters, @attempt) == true)
      result = JSON.parse(open("https://wagon-dictionary.herokuapp.com/#{@attempt}").read)
      if(result["found"] == true)
        @answer = "A word and in the grid"
        @score = ((@attempt.length)*3)
      else
        @answer = "Not a word but in the grid"
      end
    else
      @answer = "Not in the grid and Not a word"
    end
  end





    def include?(letters, attempt)
      attempt.downcase.chars.all?{|letter| attempt.count(letter) <= letters.downcase.count(letter)}
    end
  end

