class TransactionMailer < ApplicationMailer
  def complete
    @user = params[:user]
    @transaction = params[:transaction]
    @flurbo = params[:flurbo]
    mail(to: 'bank@example.com', subject: 'New Transaction')
  end
end
