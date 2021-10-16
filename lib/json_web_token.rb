class JsonWebToken
  class << self
    def encode(payload, exp = nil)
      payload[:exp] = (exp.presence || CoursesSystemConfig::SESSION_EXPIRED_HOURS).to_i.hours.from_now.to_i
      JWT.encode(payload, Rails.application.credentials[:secret_key_base], 'HS256')
    end

    def decode(token)
      JWT.decode(token, Rails.application.credentials[:secret_key_base])[0]&.with_indifferent_access
    rescue StandardError
      nil
    end
  end
end
