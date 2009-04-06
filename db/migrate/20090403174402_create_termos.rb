class CreateTermos < ActiveRecord::Migration
  def self.up
    create_table :termos do |t|
      t.string :nome
      t.timestamps
    end

    @business_words = ['Sinergia','Mentalidade','Agregar','Mercado','E-mail','Follow up','Clientes','Benefício','Parceiros','Estratégia','Sistema','Rendimento','Pró-ativo','Business','Custos','Otimização','Foco','Efetivamente','A nível de','Recursos','Resultados','Paradigma','Projeto','Implementação','Integrar']
    @business_words.each do |word|
      termo = Termo.new :nome => word
      termo.save
    end
  end

  def self.down
    drop_table :termos
  end
end
