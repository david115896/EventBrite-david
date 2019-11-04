class BeforenowValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)
		if value < Time.now
			record.errors.add(attribute, 'ne peut pas etre une date passee')
		end
	
	end
end