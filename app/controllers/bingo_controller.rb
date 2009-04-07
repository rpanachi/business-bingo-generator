class BingoController < ApplicationController

  layout "default"
  
  def index
    @bingo = Bingo.new :linhas => 5, :colunas => 5, :quantidade => 1
    carrega_termos
  end

  def create
  
    @bingo = Bingo.new params[:bingo]
  
    if (!@bingo.valid?) 
       carrega_termos  #ideia melhor?
       render :action => "index"
    else
       @cards = @bingo.gera_cartoes
    end
  end

  private
  
  def carrega_termos
    @termos = Termo.all
  end

end
