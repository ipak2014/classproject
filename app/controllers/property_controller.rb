class PropertyController < ApplicationController

	#before_filter :authorize
	# before_filter :authorize, only: [:create]
	# only applies to what's listed; or before_filter :authorize, except: [:create]
	def new
	end

	def create
		property = Property.new(property_params)
		result = Rubillow::PropertyDetails.deep_search_results({ :address => property_params[:street], :citystatezip => property_params[:cityzip] })
		property.zpid = result.zpid
		property.city = result.address[:city]
		property.state = result.address[:state]
		property.zipcode = result.address[:zipcode]
		property.latitude = result.address[:latitude]
		property.longitude = result.address[:longitude]
		property.zestimate = result.price
		property.valuation_range_high = result.valuation_range[:high]
		property.valuation_range_low = result.valuation_range[:low]
		property.use_code = result.use_code
		property.lot_size_square_feet = result.lot_size_square_feet
		property.finished_square_feet = result.finished_square_feet
		property.bathrooms = result.bathrooms
		property.bedrooms = result.bedrooms
		property.tax_assessment = result.tax_assessment
		property.tax_assessment_year = result.tax_assessment_year
		property.year_built = result.year_built
		property.last_sold_date = result.last_sold_date
		property.last_sold_price = result.last_sold_price
		property.zillow_link = result.links[:homedetails]
		property.zillow_comps = result.links[:comparables]
		property.zillow_mapz = result.links[:mapthishome]
		property.save
		redirect_to "/property/display/#{property.id}"
	end

	def display
		@home = Property.find_by_id(params[:id])
	end

	def payment
		@home = Property.find_by_id(params[:id])
		@price = params[:price].to_f
		@ltv = params[:ltv].to_f/100
		@rate = params[:rate].to_f/100
		@term = params[:term].to_i
		@mortgage = @price*@ltv
		@closing_costs = @price*0.005
		@downpayment = (@price*(1-@ltv)+@closing_costs)
		@m_rate = @rate/12
		@payment = (@m_rate*(1+@m_rate)**@term)/((1+@m_rate)**@term-1)*@mortgage
		@m_property_tax = @price*0.0125/12
		@m_insurance = @price*0.001/12
		@total_payment = @payment + @m_property_tax + @m_insurance
	end

	def calculate
	end

private

	def property_params
		params.permit(:street, :cityzip)
	end

end