class PoemsController < ApplicationController

  def index
    @poems = Poem.all
  end

  def show
    #@poem = params
    @poem = Poem.find(params[:id])
  end
end
