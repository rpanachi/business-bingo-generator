class BingoController < ApplicationController

  before_filter :set_termos

  def set_termos
    @termos = Termo.find_all_by_locale(user_locale, :order => :nome)
  end

  def index
    @bingo = Bingo.new :quantidade => 5
  end

  def create
    @bingo = Bingo.new
    @bingo.quantidade = params[:bingo][:quantidade]
    @bingo.locale = user_locale

    if (!@bingo.valid?) 
      render :action => "index"
    else
      @cards = @bingo.criar_cartelas 
    end
  end

end
