class AddCurrencyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :currency, :string, :default => "JPY", :null => false
  end
end
