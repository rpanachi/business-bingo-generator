class BingoController < ApplicationController

  layout "default"
  
  def title
    "Business Bingo Generator"
  end

  def index
    @bingo = Bingo.new :linhas => 3, :colunas => 3, :quantidade => 1
  end

  def create
  
    @bingo = Bingo.new params[:bingo]
  
    if (!@bingo.valid?) 
       #flash[:errors] = ["Informe os dados corretos!"]
       render :action => "index"
    else
       @cards = @bingo.gera_cartoes
    end
  end

end
