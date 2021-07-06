class TodolistsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する
    @list = List.new

  end

  # 以下を追加
  def create
    # 1.データを新規登録するためのインスタンス変数
    list = List.new(list_params)
    # ２．データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ３．トップ画面へリダイレクト ←削除して、詳細画面へのリダイレクト
    redirect_to todolist_path(list.id)

  end

  def index
    @lists = List.all

  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end
  def destroy
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end