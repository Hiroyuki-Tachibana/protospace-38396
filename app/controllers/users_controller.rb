class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #  Pathパラメータで送信されるID値で、Userモデルの特定のオブジェクトを取得し、それを@userに代入した。
  end
end
