Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"

  resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create 
  end
  resources :users, only: :show

end

# リソーシーズにより、７つのアクションのルーティングを自動生成できる。prototypesコントローラーの[]内のアクションに対するルーティングの設定をしている。resourcesにオプションとしてonlyを加えると、指定したアクションのみのルーティングを自動生成することになる。
# ルーティングをネスト(親子関係)させる理由は、アソシエーション先のレコードのidをparamsに追加してコントローラーに送るため
# ルーティングをネストさせるにはdo〜endで挟む。これで、どの画像に対してのコメントなのかを送ることができる。