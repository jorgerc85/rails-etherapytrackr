$(document).ready(function() {
  pacientEvalCreate();
  graphDisplay();
  calculate();
});

var pacientEvalCreate = function() {
  $('.evalPatientBoxSubmit').click(function(event) {
    event.preventDefault();
    $(event).parent().serialize();
    $.ajax({
      type: "POST",
      url: "/evaluation",
      data: $(this).parent().serialize(),
      dataType: "JSON"
    }).done(function(response) {
      var reply = response;
      $('.nameSpan').html("" + reply.patient.first_name + " " + reply.patient.last_name + "")
      $('.testSpan').html("" + reply.test.name + "")
      $('.dateSpan').html("" + reply.evaluation.created_at + "")
      reply.components.forEach(function(component) {
        $('.currentEvalBoxSubmit').before(
          "<input type='text' name='components[" + component.name + "]' placeholder='" + component.name + "' required>"
          );
        $('.currentEvalBox').css('display', 'inline-block')
        $('.evalBoxRightVerticalSub').css('display', 'inline-block')
      });
    });
  });
};

var graphDisplay = function() {
  $('.viewHistoryBtn').click(function(event) {
    event.preventDefault();
    $.ajax({
        url: '/evaluation',
        type: 'GET',
        dataType:'JSON'
    }).done(function(response) {
      var data = response
      // Get context with jQuery - using jQuery's .get() method.
      var ctx = $("#myChart").get(0).getContext("2d");
      // This will get the first returned node in the jQuery collection.
      $('.graphTitle').html(data.datasets[0].label);
      var myNewChart = new Chart(ctx).Line(data);
    });
  });
};

var calculate = function() {
  $('.currentEvalBoxSubmit').click(function(event) {
    event.preventDefault();
    $.ajax({
        url: '/evaluation',
        type: 'GET',
        data: $(this).parent().serialize(),
        dataType:'JSON'
    }).done(function(response) {
      var data = response
      // Get context with jQuery - using jQuery's .get() method.
      var ctx = $("#myChart").get(0).getContext("2d");
      // This will get the first returned node in the jQuery collection.
      $('.graphTitle').html(data.datasets[0].label);
      var myNewChart = new Chart(ctx).Line(data);
    });
  });
};
