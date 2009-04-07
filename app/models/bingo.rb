class Bingo < ActiveRecord::Base

  tableless :columns => [
    [:quantidade, :integer]
  ]

  validates_numericality_of :quantidade, :greater_than => 0, :less_than_or_equal_to => 20

=begin #for reference only
  validate :must_validate
  def must_validate
    errors.add_to_base("Quantidade invalida") if quantidade <= 0
  end
=end

  NUMBER_WORDS = 25
  WORDS_LENGTH = 5

  def before_initialize
    self.quantidade = 1
  end

  def gera_cartoes
    raise "Quantidade de cartelas deve ser maior que zero e menor ou igual 20" unless valid?
    logger.info "Quantidade de cartelas para gerar: " + quantidade.to_s
    cards = Array.new
    quantidade.times do |t|
      cards << generate_card 
    end
    cards
  end

   def generate_card
     random_words = Termo.random NUMBER_WORDS
     card = Array.new
     WORDS_LENGTH.times do |line_index|
       words = Array.new 
       WORDS_LENGTH.times do |i|
         words << random_words.pop
       end 
       card[line_index] = words
     end
     card
   end

end
