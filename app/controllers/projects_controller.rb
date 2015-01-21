require 'cb'
Cb.configure do |config|
  config.dev_key    = 'WDHV2ZS6091Z9BQC0R04'
  config.time_out   = 5
end


class ProjectsController < ApplicationController
  def index
  end

  def search
    criteria = {}
    criteria[:Location] = params[:location]
    criteria[:Keywords] = params[:keywords]
    @job_results = Cb.job.search criteria
#binding.pry #Cannot be the last line of executed code

    #@job_results = search
    #@results = Project.search params[:keywords]
  end
end