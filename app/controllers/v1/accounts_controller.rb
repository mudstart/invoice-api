# frozen_string_literal: true

module V1
  # manage the Account model
  class AccountsController < ApplicationController
    def create
      @account = current_user.accounts.build(account_params)

      if @account.save
        render :create, status: created
      else
        head(:unprocessable_entity)
      end
    end

    def update
      @account = curren_user.accounts.friendly.find(params[:id])

      if @account.update(account_params)
        render :update
      else
        head(:unprocessable_entity)
      end
    end

    private

    def account_params
      params.require(:account).permit(:name, :address, :var_rate, :tax_payer_id, :default_currency)
    end
  end
end
