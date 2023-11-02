class DuesController < ApplicationController
  before_action :set_due, only: [:update, :show]
  def index
    @dues = Due.all

    render :json => { success: true, dues: @dues }
  end

  def create
    ActiveRecord::Base.transaction do
      @due = Due.create!(due_params)

      render :json => { success: true }
    end
  rescue ActiveRecord::RecordInvalid => invalid
    render :json => { success: false, errors: invalid.record.errors }
  rescue => error
    logger.fatal "#{error.message}, #{error.backtrace.first}"
    render :json => {
      success: false,
      errors: 'Ops, algo estranho ocorreu! Tente novamente mais tarde'
    }
  end

  def show
    render :json => { success: true, due: @due.show }
  end

  def update
    ActiveRecord::Base.transaction do
      @due.update!(due_params)

      render :json => { success: true }
    end
  rescue ActiveRecord::RecordInvalid => invalid
    render :json => { success: false, errors: invalid.record.errors }
  rescue => error
    logger.fatal "#{error.message}, #{error.backtrace.first}"
    render :json => {
      success: false,
      errors: 'Ops, algo estranho ocorreu! Tente novamente mais tarde'
    }
  end

  private

    def due_params
      if params[:id].present?
        return params.permit(:informacoes_complementares)
      end

      if params[:due_itens].present?
        params[:due_itens_attributes] = params[:due_itens]
      end

      params.permit(
        :declarante_cpf_cnpj,
        :declarante_razao_social,
        :identificacao,
        :numero,
        :moeda,
        :incoterm,
        :informacoes_complementares,
        due_itens_attributes: [
          :id,
          :item,
          :nfe_chave,
          :nfe_numero,
          :nfe_serie,
          :nfe_item,
          :descricao_complementar,
          :ncm,
          :vmle_moeda,
          :vmle,
          :vmcv_moeda,
          :vmcv,
          :peso_liquido,
          :enquadramento1,
          :enquadramento2,
          :enquadramento3,
          :enquadramento4
        ]
      )
    end

    def set_due
      @due = Due.find_by_id(params[:id])

      if @due.nil?
        render :json => {
          success: false,
          errors: 'Ops, DU-E não encontrada!'
        }
      end
    end
end
