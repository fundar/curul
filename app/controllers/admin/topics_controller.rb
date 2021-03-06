class Admin::TopicsController < Admin::BaseController
  load_and_authorize_resource
  def index
    @topics = if params[:q]
      Topic.where("name like ?", "%#{params[:q]}%")
    else
      if params[:search]
        Topic.where("topics.name @@ ?", params[:search][:name]).page(params[:page])
      else
        Topic.page(params[:page])
      end
    end
    respond_to do |format|
      format.html
      format.json { render :json => @topics.map(&:attributes) }
    end
  end
  
  def show
    @topic = Topic.find(params[:id])
  end
  
  def new
    @topic = Topic.new
  end
  
  def create
    @topic = Topic.new(params[:topic])
    if @topic.save
      redirect_to admin_topics_url, :notice => "Tema creado exitosamente"
    else
      render :new
    end
  end
  
  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(params[:topic])
      redirect_to admin_topics_url, :notice => "Tema editado exitosamente"
    else
      render :edit
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to admin_topics_url
  end
end
