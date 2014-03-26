class DatasetsController < ApplicationController

  before_action :set_dataset, only: [:destroy]

  def index
    @datasets = Dataset.all
    @dataset = Dataset.new
  end

  def create
    if Dataset.upload(current_user, params[:dataset][:file])
      redirect_to datasets_path, notice: 'Dataset was successfully created.'
    else
      redirect_to datasets_path, alert: 'Unable to upload Dataset.'
    end
  end

  def destroy
    @dataset = Dataset.find(params[:id])
    @dataset.destroy

    redirect_to datasets_path
  end
end
