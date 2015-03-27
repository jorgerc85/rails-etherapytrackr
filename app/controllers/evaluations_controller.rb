class EvaluationsController < ApplicationController
  before_action :is_logged_in?

  def index
    @patient = Patient.find(params[:format])
    @evaluations = @patient.evaluations
    @data = {
        labels: @evaluations.map { |e| e.created_at },
        datasets: [
            {
                label: "Progress chart",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: @evaluations.map { |e| e.score }
            }
        ]
    }
    @options = {
      width: 600,
      bezierCurve: false
    }
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
