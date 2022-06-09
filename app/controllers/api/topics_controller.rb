class Api::TopicsController < ApplicationController


  class Api::TopicsController < ApplicationController
    # model name -> Topic 
    # Who is the parent -> Sub 
    before_action :set_topic, only: [:show, :update, :destroy]
    before_action :set_sub 
  
    def index
      # render json: Topic.all
      render json: @sub.topics
    end
  
    def show
      # @topic = Topic.find(params[:id])
      # @topic = @sub.topics.find(params[:id])
      render json: @topic 
    end
  
    def create
      # @topic = Topic.new(topic_params)
      @topic = @sub.topics.new(topic_params)
      if @topic.save
        render json: @topic
      else
        render json: { errors: @topic.errors }, status: :unprocessable_entity
      end
    end
  
    def update
      # @topic = Topic.find(params[:id])
       # @topic = @sub.topics.find(params[:id])
      if @topic.update(topic_params)
        render json: @topic
      else
        render json: { errors: @topic.errors }, status: :unprocessable_entity
      end
    end
  
    def destroy
      # @topic = Topic.find(params[:id])
       # @topic = @sub.topics.find(params[:id])
      @topic.destroy
      render json: { message: 'Topic deleted'}
    end
  
    private 
      def topic_params 
        params.require(:topic).permit(:title, :desc)
      end
  
      def set_topic
        # @topic = Topic.find(params[:id])
        @topic = @sub.topics.find(params[:id])
      end
  
      def set_sub 
        @sub = Sub.find(params[:sub_id])
      end
  end
end
