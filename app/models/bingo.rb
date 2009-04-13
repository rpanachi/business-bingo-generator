class Bingo < ActiveRecord::Base

  tableless :columns => [
    [:quantidade, :integer],
    [:locale, :string]
  ]

  validates_numericality_of :quantidade, :greater_than => 0, :less_than_or_equal_to => 20

  NUMBER_WORDS = 25
  WORDS_LENGTH = 5

  def before_initialize
    self.quantidade = 5
  end

  def criar_cartelas
    raise "Quantidade de cartelas deve ser maior que zero e menor ou igual 20" unless valid?
    logger.info "Quantidade de cartelas para gerar: " + quantidade.to_s
    cartelas = Array.new
    quantidade.times do |t|
      cartela = criar_cartela
      cartela.id = t + 1
      cartelas << cartela
    end
    cartelas
  end

  def criar_cartela
    random_words = Termo.random NUMBER_WORDS, locale
    card = Cartela.new
    WORDS_LENGTH.times do |line_index|
      words = Array.new 
      WORDS_LENGTH.times do |i|
        words << random_words.pop
      end 
      card.termos << words
    end
    card
  end

end
