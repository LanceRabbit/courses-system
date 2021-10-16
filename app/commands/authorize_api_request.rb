class AuthorizeApiRequest
  prepend SimpleCommand

  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  def user
    if decoded_auth_token
      User.find_by(id: decoded_auth_token[:user_id])
    else
      errors.add(:token, 'Invalid token') && nil
    end
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      headers['Authorization'].split.last
    else
      errors.add(:token, 'Missing token')
      nil
    end
  end
end
