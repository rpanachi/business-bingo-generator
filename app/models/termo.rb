class Termo < ActiveRecord::Base

  validates_uniqueness_of :nome
  validates_presence_of :nome
  validates_length_of :nome, :within => 5..20 

  def self.random quantidade
    todos = all
    termos = Array.new
    while termos.size < quantidade do
      index = rand todos.size
      termo = todos[index]
      termos << termo unless termos.include? termo
    end
    termos
  end

  before_save :prepare

  def prepare
    nome.capitalize!
  end
end
