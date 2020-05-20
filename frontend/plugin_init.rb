Rails.application.config.after_initialize do
  require_relative '../common/validations'
end
