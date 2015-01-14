class TestsController < ApplicationController

  def new
    @components = Component.all
  end

  def create
    test = Test.create(params[:test])
    components = params[:components]
    components.each do |comp|
      tests.components << Component.find_or_create_by(name: comp)
    end
  end

  private

  def tests_params
    params.require(:test).permit(:name, :description)
  end

end
