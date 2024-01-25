
require 'jwt'
module JsonWebToken
	extend ActiveSupport::Concern

	SECRET_KEY = Rails.application.secret_key_base


	BLACKLISTED_TOKENS = []

  def blacklist_token(token)
	BLACKLISTED_TOKENS << token
  end

  def token_blacklisted?(token)
    BLACKLISTED_TOKENS.include?(token)
  end

	def jwt_encode(payload, exp = 7.days.from_now)
		payload[:exp] = exp.to_i
		JWT.encode(payload, SECRET_KEY)
	end

	def jwt_decode(token)
		decoded = JWT.decode(token, SECRET_KEY)[0]
		HashWithIndifferentAccess.new decoded
	end

end