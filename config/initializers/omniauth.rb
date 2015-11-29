OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1088963721148908', '687a1f078c7e924a0ab072eaf28c1bb1'
end
