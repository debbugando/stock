class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        #render json: @stock
        #render 'users/my_portfolio'
        #RAILS 4
        render partial: 'users/result'
        #RAILS 5
        #respond_to do |format|
          #format.js { render partial: 'users/result'}
        #end
      else
        flash.now[:danger] = "Insira um Valor Válido."
        #redirect_to my_portfolio_path
        render partial: 'users/result'
      end
    else
      flash.now[:danger] = "Campo de Busca Vazio. Insira um valor"
      #redirect_to my_portfolio_path
      render partial: 'users/result'
    end
  end
end
