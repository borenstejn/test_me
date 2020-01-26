class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.create(transaction_params)
    @flurbo = Flurbo.where(user: @transaction.user).first ||
      Flurbo.create(user: @transaction.user, balance: Flurbo::DEFAULT_BALANCE)

    new_balance =  @flurbo.balance - @transaction.amount
    if new_balance > 0
      @transaction.update(additional_infos: 'accepted')
      @flurbo.update!(balance: new_balance)
      TransactionMailer.with(transaction: @transaction, flurbo: @flurbo, user: @transaction.user).complete.deliver
      render status: 201, json: @transaction
    else
      @transaction.update(additional_infos: 'refused')
      render status: 403, json: { message: "L'utilisateur n'a pas assez de crédit" }
    end
  end

  def transaction_params
    params.permit(:user_id, :amount)
  end
end
