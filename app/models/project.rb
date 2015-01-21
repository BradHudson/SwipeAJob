class Project
  # attr_accessible :keywords, :location
  def self.search(search)
       #find(:all, :conditions => ['location LIKE ?',search])
    search = Cb.job.search_criteria.location(params[:search]).radius(10).search()

    search.each do |job|
      puts job.title
      puts job.company_name
      puts job.instance_variables
    end

  else
      find(:all)
    end
end