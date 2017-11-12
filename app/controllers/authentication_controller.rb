class AuthenticationController < ApplicationController

  def authenticate_user
    # Author.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe')
    # user = Author.find_by(email: params[:email])
    user = Author.find_by(email: params[:email]).try(:authenticate, params[:password])
    if user && user.authenticate(params[:password])
    # if user && user.authenticate(params[:password])
      render json: payload(user)
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end

  private

  def payload(user)
    return nil unless user and user.id
    {
      auth_token: JsonWebToken.encode({user_id: user.id}),
      user: {id: user.id, email: user.email}
    }
  end
end
