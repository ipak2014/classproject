class ApplicantController < ApplicationController

def newapplication
		@status = ["Married", "Single", "Divorced", "Widowed", "Separated"]
		@degree = ["High School", "College", "Master", "Doctorate"]
		applicant = User.find_by_id(current_user.id)
		if params[:ssn] == nil || params[:dob] == nil || params[:phone] == nil || params[:street] == nil || params[:state] == nil || params[:city] == nil || params[:zipcode] == nil
			flash[:info] = "Please enter your information"
		else
		applicant.ssn = params[:ssn]
		applicant.dob = params[:dob]
		applicant.phone = params[:phone]
		applicant.marital_status = params[:marital_status]
		applicant.degree = params[:degree]
		applicant.street = params[:street]
		applicant.city = params[:city]
		applicant.state = params[:state]
		applicant.zipcode = params[:zipcode]
		applicant.res_years = params[:res_years]
		applicant.ownrent = params[:ownrent]
		applicant.save
		if applicant.save
			flash[:info] = "Basic information saved"
			redirect_to '/newapplication/declarations'
		else
			flash[:info] = "Failed"
		end
	end
	end

	def documents

	end

	def declarations
		applicant = User.find_by_id(current_user.id)
		applicant.update(declarations_params)
		@declarations = { }
		@declarations["judgment"] = "a. Are there any outstanding judgments against you?"
		@declarations["bankruptcy"] = "b. Have you been declared bancrupt within the past 7 years?"
		@declarations["foreclosure"] = "c. Have you had property foreclosed upon or given title or deed in lieu thereof in the last 7 years?"
		@declarations["lawsuit"] = "d. Are you a party to a lawsuit?"
		@declarations["obligation"] = "e.  Have you directly or indirectly been obligated on any loan which resulted in foreclosure, transfer of title in lieu of foreclosure, or judgment?"
		@declarations["delinquency"] = "f.  Are you presently delinquent or in default on any Federal debt or any other loan, mortgage, financial obligation, bond or loan guarantee?"
		@declarations["alimony"] = "g.  Are you obligated to pay alimony, child support, or separate maintenance?"
		@declarations["downpayment_borrowed"] = "h.  Is any part of the downpayment borrowed?"
		@declarations["endorsement"] = "i.  Are you a co-maker or endorser on a loan?"
		@declarations["citizen"] = "j.  Are you a U.S. citizen?"
		@declarations["resident"] = "k.  Are you a permanent resident alien?"
		@declarations["residence"] = "l.  Do you intend to occupy the property as your primary residence?"
		applicant.save
		#redirect_to '/newapplication/documents'
	end

	def linkedin
	end

private

	def applicant_params
		params.permit(:ssn, :dob, :phone, :marital_status, :degree, :street, :city, :state, :zipcode, :res_years, :ownrent, :w2, :current1040, :prior1040)
	end

	def declarations_params
		params.permit(:judgment, :bankruptcy, :foreclosure, :lawsuit, :obligation, :delinquency, :alimony, :downpayment_borrowed, :endorsement, :citizen, :resident, :residency)
	end
end