# frozen_string_literal: true

module WebToken
  def self.expiry
    3.weeks.from_now.to_i
  end
  class << self
    def decode(token)
      JWT.decode(token, Rails.application.secret_key_base, true, { algorithm: 'HS256' }).first
    rescue JWT::ExpiredSignature
      :expired
    end

    def encode(user)
      JWT.encode(token_params(user), Rails.application.secret_key_base, 'HS256')
    end

    private

    def token_params(user)
      {
        user_id: user.id,
        exp: WebToken.expiry
      }
    end
  end
end
