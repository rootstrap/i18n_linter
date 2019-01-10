class VideosController < ApplicationController
  def update_published_date
    # Testing Strftime rule
    Video.find(video_params[:id]).update(published_date: DateTime.now.strftime('%Y-%m-%d'))
  end

  def video_params
    params.require(:video).permit(:title, :gender)
  end
end
