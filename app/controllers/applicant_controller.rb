class ApplicantController < ApplicationController

	def newapplication
	end

	def general_info
			@status = ["Married", "Single", "Divorced", "Widowed", "Separated"]
			@degree = ["High School", "College", "Master", "Doctorate"]
			
	end

	def create_general_info
		applicant = User.find_by_id(current_user.id)
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

	def declarations
		
	end

	def create_declarations
		applicant = User.find_by_id(current_user.id)
		#parameters are nil instead of "Yes" because when rails is first loading the page they do not contain anything
		if params[:judgment] == nil && params[:bankruptcy] == nil && params[:foreclosure] == nil && params[:lawsuit] == nil && params[:obligation] == nil && params[:delinquency] == nil && params[:alimony] == nil
			flash[:info] = "Please make your choices"
		else
			applicant.update(declarations_params)
			redirect_to '/newapplication/documents'
		end
	end


	def documents
		if params[:w2] == nil || params[:current1040] == nil || params[:prior1040] == nil
			flash[:info] = "Please upload your documents"
		end
	end

	def create_documents
		applicant = User.find_by_id(current_user.id)
		applicant.w2 = params[:documents][:w2]
		applicant.w2 = params[:documents][:current1040]
		applicant.w2 = params[:documents][:prior1040]
			if applicant.save
			flash[:info] = "Upload successful"
			redirect_to "/newapplication/summary"
			else
			flash[:info] = "Upload failed"
			redirect_to '/'
			end
	end

	def employment_manual
	end

	def create_employment_manual
		applicant = User.find_by_id(current_user.id)
		applicant.update(employment_params)
		redirect_to '/newapplication'
	end

	def employment
		@applicant = User.find_by_id(current_user.id)
		client = LinkedIn::Client.new('77j4sh8x3d7s0g', '8OaudBjwLc8vrpeT')
		if @applicant.linkedin_token == nil || @applicant.linkedin_secret == nil
			request_token = client.request_token({:oauth_callback => "http://#{request.host}:#{request.port}/auth/callback"}, :scope => "r_fullprofile")
			session[:rtoken] = request_token.token
			session[:rsecret] = request_token.secret
			redirect_to client.request_token.authorize_url
		else
			client.authorize_from_access(@applicant.linkedin_token, @applicant.linkedin_secret)
			@profile = client.profile
			user = client.profile(:fields => %w(positions))
			companies = user.positions.all.map{|t| t.company}
			@applicant.company1 = companies[0].name
			@applicant.company2 = companies[1].name
			@applicant.company3 = companies[2].name
			@applicant.save
			#user2 = client.profile(:fields => %w(educations))
			#@education = user2.educations.all.map{|t| t.education}
			#@connections = client.num-connections
		end
	end

	def linkedin
		client = LinkedIn::Client.new('77j4sh8x3d7s0g', '8OaudBjwLc8vrpeT')
	    pin = params[:oauth_verifier]
	    access_keys = []
	    access_keys = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
	    applicant = User.find_by_id(current_user.id)
	    applicant.linkedin_token = access_keys.first
	    applicant.linkedin_secret = access_keys.last
	    applicant.save
	    redirect_to '/newapplication/employment'
	end

	def financials
		@financial_institutions = ["Bank of America", "Capital One 360", "Charles Schwab", "Chase Bank", "Citibank", "Fidelity Investments", "TD Ameritrade", "Wells Fargo"]
	end

	def summary
		@applicant = User.find_by_id(current_user.id)
	end


private

	def applicant_params
		params.require(:ssn, :dob, :phone, :marital_status, :degree, :street, :city, :state, :zipcode, :res_years, :ownrent).permit(:ssn, :dob, :phone, :marital_status, :degree, :street, :city, :state, :zipcode, :res_years, :ownrent)
	end

	def declarations_params
		params.permit(:judgment, :bankruptcy, :foreclosure, :lawsuit, :obligation, :delinquency, :alimony, :downpayment_borrowed, :endorsement, :citizen, :resident, :residency)
	end

	def document_params
		params.permit(:w2, :current1040, :prior1040)
	end

	def employment_params
		params.permit(:company1, :position1, :length1, :company2, :position2, :length2, :company3, :position3, :length3)
	end
end