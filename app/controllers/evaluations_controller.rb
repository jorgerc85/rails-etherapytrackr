class EvaluationsController < ApplicationController

  def new
    @patients = Patient.all
    @tests = Test.all
  end

  def create
    patient = Patient.find(params[:evaluation][:patient])
    test = Test.find(params[:evaluation][:test])
    evaluation = patient.evaluations.create(test: test, score: 0)
    render action: "calculator", locals: { test: test, eval_id: evaluation.id }
  end


  end

end
