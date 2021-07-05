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
    # ３．トップ画面へリダイレクト
    redirect_to '/top'
  end
  
  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
  
end
