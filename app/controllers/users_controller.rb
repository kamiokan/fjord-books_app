# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
