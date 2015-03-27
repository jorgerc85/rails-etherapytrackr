class Evaluation < ActiveRecord::Base
  validates :score, presence: true
  validates :test_id, presence: true
  validates :patient_id, presence: true

  belongs_to :patient
  belongs_to :test

  def self.graph_data(evaluations)
    data = {
        labels: evaluations.map { |e| e.date },
        datasets: [
            {
                label: "Progress chart",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: evaluations.map { |e| e.score }
            },
            {
                label: "Top limit",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: evaluations.map { |e| e.test.top_limit }
            },
            {
                label: "Bottom limit",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: evaluations.map { |e| e.test.bottom_limit }
            }
        ]
    }
  end

  def self.graph_options
    options = {
      width: 600,
      bezierCurve: false
    }
  end

  def date
    self.created_at.to_date
  end

end
