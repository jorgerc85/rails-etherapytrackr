class EvaluationsController < ApplicationController

  def new
    @patients = Patient.all
    @tests = Test.all
  end

  def create
    patient = Patient.find(params[:evaluation][:patient])
    test = Test.find_by_name(params[:evaluation][:test])
    patient.evaluations.create(test: test)
  end

  def show

  end

end
