module JSONModel
  module Validations
    def self.check_unique_digital_object_instances(hash)
      errors = []

      do_uris =  hash['instances']
                   .select{|instance| instance['instance_type'] == "digital_object" }
                   .map{|instance| instance['digital_object']['ref']}

      if do_uris.length != do_uris.uniq.length
        errors << ['instances', 'Cannot have multiple instances of the same digital object']
      end

      errors
    end

    if JSONModel(:archival_object)
      JSONModel(:archival_object).add_validation("check_unique_digital_object_instances") do |hash|
        check_unique_digital_object_instances(hash)
      end
    end
  end
end
