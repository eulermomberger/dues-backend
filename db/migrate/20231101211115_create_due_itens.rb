class CreateDueItens < ActiveRecord::Migration[7.0]
  def change
    create_table :due_itens, id: :integer do |t|
      t.integer :item, null: false
      t.string :nfe_chave, null: false, limit: 44
      t.string :nfe_numero, null: false, limit: 9
      t.string :nfe_serie, null: false, limit: 3
      t.integer :nfe_item, null: false
      t.longtext :descricao_complementar, null: false
      t.string :ncm, null: false, limit: 8
      t.decimal :vmle_moeda, precision: 17, scale: 2
      t.decimal :vmcv_moeda, precision: 17, scale: 2
      t.decimal :peso_liquido, precision: 17, scale: 2
      t.string :enquadramento1, limit: 5
      t.string :enquadramento2, limit: 5
      t.string :enquadramento3, limit: 5
      t.string :enquadramento4, limit: 5

      t.references :due, foreign_key: true, type: :int

      t.timestamps
    end
  end
end
