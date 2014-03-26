class DatasetsController < ApplicationController

  def index
    @datasets = Dataset.all
    @dataset = Dataset.new
  end

  def create
    if params.has_key?(:dataset) && Dataset.upload(current_user, params[:dataset][:file])
      redirect_to datasets_path, notice: 'Dataset was successfully created.'
    else
      redirect_to datasets_path, alert: 'Unable to upload Dataset.'
    end
  end

  def destroy
    Dataset.find(params[:id]).destroy

    redirect_to datasets_path
  end
end
