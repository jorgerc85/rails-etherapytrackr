class TestsController < ApplicationController

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(tests_params)
    redirect_to root_path
  end

  private

    def tests_params
      params.require(:test).permit(:name, :description)
    end

end
