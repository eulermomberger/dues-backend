class DueItem < ApplicationRecord
  self.table_name = 'due_itens'

  belongs_to(:due, class_name: 'Due', foreign_key: 'due_id', optional: true)

  validates(:item, numericality: true)
  validates(:nfe_chave, presence: true)
  validates(:nfe_item, numericality: true)
  validates(:descricao_complementar, presence: true)
  validates(:ncm, presence: true)

  attr_accessor(:vmle, :vmcv)

  before_save do
    if self.vmle_moeda.blank? && self.vmle.present?
      self.vmle_moeda = self.vmle
    end
    if self.vmcv_moeda.blank? && self.vmcv.present?
      self.vmcv_moeda = self.vmcv
    end
    self.nfe_serie = self.nfe_chave[22, 3]
    self.nfe_numero = self.nfe_chave[25, 9]
  end

  after_save do
    self.due.update({
      total_vmle_moeda: self.due.due_itens.sum(:vmle_moeda),
      total_vmcv_moeda: self.due.due_itens.sum(:vmcv_moeda),
      total_peso_liquido: self.due.due_itens.sum(:peso_liquido)
    })
  end
end
