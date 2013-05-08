class UsersController < ActionController::Base
  def new
    @cpi_user = User.find_by_email("cpi@user.com")
    @user = User.new()
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
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cpi_user }
    end    
  end

  def create
    @user = User.new(params[:user])
 
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "Thanks! We'll send you more information" }
        format.json { render json: root_path, status: :created, location: @user }
      else
        format.html { redirect_to root_path, alert: 'Invalid Email' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end 
  end

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end     
  end
end


