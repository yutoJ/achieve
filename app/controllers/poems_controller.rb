class PoemsController < ApplicationController

  def index
    @poems = Poem.all(format: 'json')
  end

  def show
    #@poem = params
    @poem = Poem.find(params[:id], format: 'json')
  end
end
