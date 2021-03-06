class BingoController < ApplicationController

  before_filter :set_termos

  def set_termos
    @termos = Termo.find(:all, :order => :nome)
  end

  def index
    @bingo = Bingo.new :quantidade => 5
  end

  def create
    @bingo = Bingo.new :quantidade => params[:bingo][:quantidade]
    if (!@bingo.valid?) 
      render :action => "index"
    else
      @cards = @bingo.criar_cartelas
    end
  end

end
