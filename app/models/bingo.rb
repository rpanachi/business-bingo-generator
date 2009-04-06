class Bingo < ActiveRecord::Base

  tableless :columns => [
    [:linhas, :integer],
    [:colunas, :integer],
    [:quantidade, :integer]
  ]

  validates_numericality_of :quantidade, :greater_than => 0, :less_than_or_equal_to => 20
  validates_numericality_of :linhas, :colunas, :equal_to => 5

=begin #for reference only
  validate :must_validate
  def must_validate
    logger.info "Quantidade = " + quantidade.to_s
    errors.add_to_base("Quantidade invalida") if quantidade <= 0
  end
=end

  def before_initialize
    self.linhas = self.colunas = 5
    self.quantidade = 1
  end

  def gera_cartoes
    logger.info "Quantidade = " + quantidade.to_s
    cards = Array.new
    quantidade.times do |t|
      cards << generate_card 
    end
    cards
  end

   def generate_card
   
     number_words = linhas * colunas
     number_columns = colunas
     random_words = Termo.random number_words

     card = Array.new
     linhas.times do |line_index|
       words = Array.new 
       number_columns.times do |i|
         words << random_words.pop
       end 
       card[line_index] = words
     end
     card
   end

end
