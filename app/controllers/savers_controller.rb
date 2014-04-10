class SaversController < ApplicationController

	def main
	end

	def new
		@cc = ["Always", "Usually", "Sometimes", "Never", "No credit cards"]
		@ready = ["Right now", "Next three months", "Next six months", "Not looking yet"]
		@email = params[:email]
	end

	def create
		saver = Saver.create(saver_params)
		redirect_to "/saveradvantage/result/#{saver.id}"
	end

	def result
		#fix this to match the actual user
		@saver = Saver.find_by_id(params[:id])
		min = (@saver.income/12)*0.1
		percent_down =@saver.downpayment.to_f/@saver.mortgage.to_f
		
		@decline_reasons = []
			if @saver.retirement < min
				@decline_reasons << "You need to save at least 10% of your gross income for retirement"
			end
			if @saver.savings < min
				@decline_reasons << "You need to save at least 10% of your gross income in non-retirement assets"
			end
			if @saver.cc != "Always"
				@decline_reasons << "You need to pay off your credit card balances in full every month"
			end
			if percent_down < 0.2
				@decline_reasons << "You need to save at least 20% for downpayment"
			end
			if @saver.mortgage < 625500
				@decline_reasons << "We are sorry. Saver Advantage currently only originates  mortgages over $625,500."
			end
			if Servicearea.find_by_zip(@saver.zip) == nil
				@decline_reasons << "We are sorry.  Saver Advantage currently does not serve your location.  Please let us know if we can contact you when we expand to your area."
			end
	
	end

	def index
		@savers = Saver.all
	end

	private

	def saver_params
		params.permit(:income, :cc, :retirement, :savings, :mortgage, :downpayment, :ready, :zip, :email)
	end
end
