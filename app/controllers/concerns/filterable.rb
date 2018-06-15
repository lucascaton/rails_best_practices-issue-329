module Filterable
  extend ActiveSupport::Concern

  private

  def set_period
    if @transaction
      @period = @transaction.occur_on.beginning_of_month
    else
      period_year  = params[:year]  || Time.zone.today.year
      period_month = params[:month] || Time.zone.today.month

      @period = Date.parse("#{period_year}/#{period_month}")
    end
  end
end
