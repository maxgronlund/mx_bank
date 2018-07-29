class TransactionController < ApplicationController
  def show
     @transaction = Transaction.find_by(uuid: params[:id])
  end
end
