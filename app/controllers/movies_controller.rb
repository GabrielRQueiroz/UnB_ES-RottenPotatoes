class MoviesController < ApplicationController
  def index
    # ordered
    @movies = Movie.order('title ASC').all
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  rescue ActiveRecord::RecordNotFound
    flash[:warning] = 'Movie not found.'
    redirect_to movies_path
  end

  def find_by_title
    title = params[:title]
    @movies = Movie.find(title)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create!(permitted_params)

    flash[:notice] = "#{@movie.title} was created successfully."

    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update!(permitted_params)

    flash[:notice] = "#{@movie.title} was updated successfully."

    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find params[:id]
    @movie.destroy

    flash[:notice] = "Movie '#{@movie.title}' deleted."

    redirect_to movies_path
  end

  def search_tmdb
    flash[:warning] = "'#{params[:search_terms]}' was not found in TMDb"
    redirect_to movies_path
  end

  private

  def permitted_params
    params.require(:movie).permit(:title, :rating, :release_date, :description)
  end
end
