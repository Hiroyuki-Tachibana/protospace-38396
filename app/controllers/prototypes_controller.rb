class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  #  authenticate_user!↑メソッドにより、ユーザーがログインしていなければ、ログイン画面に遷移することになる。
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.includes(:user) # Nプラス１問題が発生するためにallは使わずにincludesを用いて一度のアクセスで全部持ってくる。
  end

  def new
    @prototype = Prototype.new #newアクションで生成したインスタンス変数なので、リクエストはcreateアクションに送信されるよ〜。
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new #reateアクションに、データが保存されなかったときは新規投稿ページへ戻る(renderを用いているので画像以外の入力項目は消えない)
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def edit

  end

  def update

    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype)
    else
      render :edit
    end
  end

  def destroy

    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  private
  
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
  
  def set_prototype
    @prototype = Prototype.find(params[:id])
  #  ファインドで特定のidのレコード(params[:id])を受け取った？
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end
  #  「カレントユーザー」イコール「ログインしているユーザー」ではない（unless）とき、リダイレクトする。


  
end