class CreateDues < ActiveRecord::Migration[7.0]
  def change
    create_table :dues, id: :integer do |t|
      t.string :declarante_cpf_cnpj, null: false, limit: 14
      t.string :declarante_razao_social, null: false, limit: 255
      t.string :identificacao, null: false, limit: 255
      t.string :numero, null: false, limit: 50
      t.integer :moeda, null: false
      t.string :incoterm, null: false, limit: 3
      t.longtext :informacoes_complementares
      t.decimal :total_vmle_moeda, precision: 17, scale: 2
      t.decimal :total_vmcv_moeda, precision: 17, scale: 2
      t.decimal :total_peso_liquido, precision: 17, scale: 2

      t.timestamps
    end
  end
end
