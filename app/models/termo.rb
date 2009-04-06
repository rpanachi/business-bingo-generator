class Termo < ActiveRecord::Base

  validates_uniqueness_of :nome
  validates_presence_of :nome

  def self.random quantidade
    todos = all
    termos = Array.new
    while termos.size < quantidade do
      index = rand todos.size
      termo = todos[index].nome
      termos << termo unless termos.include? termo
    end
    termos
  end

end
