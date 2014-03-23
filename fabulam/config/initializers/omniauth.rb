OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end

ENV['FACEBOOK_APP_ID'] = "262367007272880";
ENV['FACEBOOK_SECRET'] = "aae282fbbce9679d04b8689339e1fd10";