class AddLocaleTermos < ActiveRecord::Migration

  def self.up
    add_column :termos, :locale, :string
    Termo.all.each do |t|
      t.locale = "pt"
      t.save
    end
  end

  def self.down
    remove_column :termos, :locale
  end

end
