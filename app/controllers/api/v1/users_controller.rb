class Api::V1::UsersController < Api::V1::BaseController

  URL = "https://api.weixin.qq.com/sns/jscode2session".freeze

  skip_before_action :verify_authenticity_token, only: [:login, :update]

  def wechat_user
    wechat_params = {
      appId: ENV["WECHAT_APP_ID"],
      secret: ENV["WECHAT_APP_SECRET"],
      js_code: params[:code],
      grant_type: "authorization_code"
    }

    @wechat_response ||= RestClient.get(URL, params: wechat_params)
    @wechat_user ||= JSON.parse(@wechat_response.body)
  end
  def login

    @user = User.find_or_create_by(open_id: wechat_user.fetch("openid"))
    render json: { userId: @user.id }
  end

  def update
    # debugger
    @user = User.find(params[:id])
    p @user
    if @user.update(user_params)
      render json: { status: "User updated" }
    else
      render_error
    end
  end


  private

  def user_params
    params.require(:user).permit(:nickName, :country, :gender, :city, :province, :avatarUrl, :language)
  end

  def render_error
    render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
  end
end
