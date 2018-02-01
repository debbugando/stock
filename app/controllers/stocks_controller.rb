class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "Campo de Busca Vazio. Insira um valor"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Insira um Valor Válido." unless @stock
    end
    render partial: 'users/result'
  end
end
