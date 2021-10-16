class JsonWebToken
  class << self
    def encode(payload, exp = nil)
      payload[:exp] = (exp.presence || ENV['SESSION_EXPIRED_HOURS']).to_i.hours.from_now.to_i
      JWT.encode(payload, Rails.application.credentials[:secret_key_base], 'HS256')
    end
  end
end
