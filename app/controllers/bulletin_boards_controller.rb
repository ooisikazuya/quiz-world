class BulletinBoardsController < ApplicationController
  before_action :set_user, only: [:index, :new, :search]

  def index
    @bulletin_boards = BulletinBoard.search(params[:search]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @bulletin_board = BulletinBoard.new
  end

  def create
    @bulletin_board = BulletinBoard.new(bulletin_board_params)
    @bulletin_board.user_id = current_user.id
    @bulletin_board.save!
    flash[:notice] = "掲示板に載せました！"
    redirect_to bulletin_boards_path
  rescue
    render :new
  end

  def search
    @bulletin_boards = BulletinBoard.search(params[:search]).order(created_at: :desc).page(params[:page]).per(10)
  end

  private

  def bulletin_board_params
    params.require(:bulletin_board).permit(:message)
  end

  def set_user
    @user = current_user
  end
end
