class MemosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_new_memo, only: [ :create ]
  before_action :set_memo, only: [ :edit, :update, :show, :destroy ]

  def index
    @search = current_user.memos.ransack(params[:q])
    @memos = @search.result.page(params[:page])
  end

  def new
    @memo = Memo.new
  end

  def create
    if @memo.save
        redirect_to memos_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
  end

  def update
    if @memo.update(memo_params)
        redirect_to memos_path
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @memo.destroy
    redirect_to memos_path, status: :see_other
  end

  private

  def memo_params
    params.require(:memo).permit(:title, :body, :content_image)
  end

  def set_new_memo
    @memo = current_user.memos.new(memo_params)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end
