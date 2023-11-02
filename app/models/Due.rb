class Due < ApplicationRecord

  has_many(:due_itens, class_name: 'DueItem', foreign_key: 'due_id', dependent: :destroy)

  validates(:declarante_cpf_cnpj, presence: true)
  validates(:declarante_razao_social, presence: true)
  validates(:identificacao, presence: true)
  validates(:numero, presence: true)
  validates(:moeda, numericality: true)
  validates(:incoterm, presence: true)

  accepts_nested_attributes_for(:due_itens, reject_if: :all_blank)

  def show
    due_info = self.attributes.deep_symbolize_keys
    due_info[:due_itens] = self.due_itens
    due_info
  end

end
