class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead

  def current_user
  	@current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

	helper_method :current_user

	def state_array
	  %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
	end
	
	helper_method :state_array

	def declarations_hash
		@declarations = {
		"judgment" => "a. Are there any outstanding judgments against you?",
		"bankruptcy" => "b. Have you been declared bancrupt within the past 7 years?", 
		"foreclosure" => "c. Have you had property foreclosed upon or given title or deed in lieu thereof in the last 7 years?",
		"lawsuit" => "d. Are you a party to a lawsuit?",
		"obligation" => "e.  Have you directly or indirectly been obligated on any loan which resulted in foreclosure, transfer of title in lieu of foreclosure, or judgment?",
		"delinquency" => "f.  Are you presently delinquent or in default on any Federal debt or any other loan, mortgage, financial obligation, bond or loan guarantee?",
		"alimony" => "g.  Are you obligated to pay alimony, child support, or separate maintenance?",
		"downpayment_borrowed" => "h.  Is any part of the downpayment borrowed?",
		"endorsement" => "i.  Are you a co-maker or endorser on a loan?",
		"citizen" => "j.  Are you a U.S. citizen?",
		"resident" => "k.  Are you a permanent resident alien?",
		"residency" => "l.  Do you intend to occupy the property as your primary residence?",
		}
	end

	helper_method :declarations_hash

	def accounts_hash
		@accounts = {
		"Bank (checking, savings, CDs)" => "Calculate your monthly income and spending, and confirm that you are making payments on loans and credit cards, if you have any, yourself",
		"Credit cards" => "Calculate your monthly spending and confirm that you are paying off your balances in full every month",
		"Loans (car, student, mortgage)" => "Calculate your monthly payments as well as give you credit for any principal that you pay down",
		"Investment" => "Calculate your monthly income, excluding capital gains",
		"All accounts" => "Calculate how much you save every month and prepare a comprehensive statement of your assets and liabilities"
		}
	end

	helper_method :accounts_hash

	def authorize
		redirect_to '/' unless current_user
	end

	def authorize_admin
		redirect_to '/' and flash[:info] = "Admin access only" unless current_user && current_user.admin == true
	end

	helper_method :authorize_admin

end
