class EvaluationsController < ApplicationController
  before_action :is_logged_in?

  def index
    @patient = Patient.find(params[:format])
    @evaluations = @patient.evaluations
    @data = Evaluation.graph_data(@evaluations)
    @options = Evaluation.graph_options
  end

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

  def calculate
    evaluation = Evaluation.find(params[:evaluation][:id])
    patient = evaluation.patient
    eval_params = params[:evaluation].select { |k,v| k != "id" }
    score = patient.calculate!(eval_params)
    evaluation.update(score: score)
    redirect_to evaluation_path(evaluation.id)
  end

  def show
    @evaluation = Evaluation.find(params[:id])
  end

end
