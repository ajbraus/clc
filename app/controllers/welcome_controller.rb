class WelcomeController < ApplicationController
  def index
  	@email_subscription = EmailSubscription.new
  	@subscription_counter = EmailSubscription.all.count
  	
  	@chart = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({:defaultSeriesType=>"pie"}) #, :margin=> [50, 200, 60, 170]} )
      series = {
               :type=> 'pie',
               :name=> 'Personal Price Index',
               :data=> [
                  ['Apparel',   15.0],
                  ['Groceries',       26.8],
                  ['Technology',     8.2],
                  ['Medical',     8.2],
                  ['Education',     8.2],
                  ['Personal Care',     8.2],
                  ['Recreation',     8.2],
                  ['Housing',     8.2],
                  ['Transportation',     6.2]
                  # {
                  #    :name=> 'Restaurants',    
                  #    :y=> 12.8,
                  #    :sliced=> true,
                  #    :selected=> true
                  # }
               ]
      }
      f.series(series)
      #f.options[:title][:text] = "Your Personal Price Index"
      #f.legend(:layout=> 'vertical',:style=> {:left=> 'auto', :bottom=> 'auto',:right=> '50px',:top=> '100px'}) 
      f.plot_options(:pie=>{
        :allowPointSelect=>true, 
        :cursor=>"pointer", 
        :dataLabels=>{
          :enabled=>true,
          :color=>"black",
          :style=>{
            :font=>"13px Trebuchet MS, Verdana, sans-serif"
          }
        }
      })
		end


  end
end
