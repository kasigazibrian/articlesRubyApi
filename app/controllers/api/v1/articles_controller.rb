# frozen_string_literal: true

module Api
  module V1
    # class controller for articles
    class ArticlesController < ApplicationController
      include AuthenticationConcern
      before_action :authorize_request, except: %i[index show]
      alias_method :current_user, :authorize_request
      load_and_authorize_resource
      def index
        articles = Article.order('created_at DESC')
        render json: { status: 'SUCCESS', message: 'Loaded articles',
                       data: articles }, status: :ok
      end

      def show
        article = Article.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded articles',
                       data: article }, status: :ok
      end

      def create
        article = Article.new(article_params)
        article.user = current_user
        if article.save
          render json: { status: 'SUCCESS', message: 'Saved article',
                         data: article }, status: :ok
        else
          render json: { status: 'Failure', message: 'Unprocessable Entry',
                         data: article.errors.full_messages.first },
                 status: :unprocessable_entity
        end
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: { status: 'SUCCESS', message: 'Deleted article',
                       data: article }, status: :ok
      end

      def update
        article = Article.find(params[:id])
        if article.update_attributes(article_params)
          render json: { status: 'SUCCESS', message: 'Updated article',
                         data: article }, status: :ok
        else
          render json: { status: 'Failure', message: 'Unprocessable Entry',
                         data: article.errors.full_messages.first },
                 status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :body)
      end
    end
  end
end
