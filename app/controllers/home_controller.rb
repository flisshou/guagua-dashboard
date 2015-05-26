class HomeController < ApplicationController

  def index
    colors=['#F7464A','#46BFBD','#FDB45C','#FDB42C','#FDB41C','#FDB35C']
    @data=[]
    Activity.data_count2.each_with_index do|d,idx|
      @data<<[d[:name],d[:count]]
    end
  end

end
