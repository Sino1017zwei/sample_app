class TodolistsController < ApplicationController
  def new
    #Viewへ渡すためのインスタンス変数に空のモデルオブジェクト
    @list=List.new
  end

  def create
    #1.データを新規作成するためのインスタンス作成
    list=List.new(list_params)
    #2.データをデータベースに登録するためのsaveメソッド実行
    list.save
    #3.完了したらトップ画面にリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists=List.all
  end

  def show
    @list=List.find(params[:id])#params[:id]=/todolists/:idの:idの部分を指している

  end

  private #アクション以外はprivate以下に記述を行う
  #ストロングパラメータ
  def list_params#モデル名_params
    params.require(:list).permit(:title,:body)
  end
end
