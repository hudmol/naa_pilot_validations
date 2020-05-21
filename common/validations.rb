module JSONModel
  module Validations
    def self.check_naa_item(hash)
      errors = []

      # Unique Digital Objects
      do_uris =  hash['instances']
                   .select{|instance| instance['instance_type'] == "digital_object" }
                   .map{|instance| instance['digital_object']['ref']}

      if do_uris.length != do_uris.uniq.length
        errors << ['instances', 'Cannot have multiple instances of the same digital object']
      end

      errors
    end

    if JSONModel(:archival_object)
      JSONModel(:archival_object).add_validation("check_naa_item") do |hash|
        check_naa_item(hash)
      end
    end
  end
end
