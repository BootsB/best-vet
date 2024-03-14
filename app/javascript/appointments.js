// JavaScript code to handle accept action
$('.accept-appointment').on('click', function(e) {
  e.preventDefault();
  var appointmentId = $(this).data('appointment-id');
  $.ajax({
    url: '/appointments/' + appointmentId + '/accept',
    method: 'PUT',
    success: function(response) {
      $('#messages-container').html('<div class="alert alert-success" role="alert">' + response.message + '</div>'); // Display success message
      // You can update the UI here if needed
    },
    error: function(xhr) {
      $('#messages-container').html('<div class="alert alert-danger" role="alert">' + xhr.responseJSON.error + '</div>'); // Display error message
    }
  });
});

// JavaScript code to handle reject action
$('.reject-appointment').on('click', function(e) {
  e.preventDefault();
  var appointmentId = $(this).data('appointment-id');
  $.ajax({
    url: '/appointments/' + appointmentId + '/reject',
    method: 'PUT',
    success: function(response) {
      $('#messages-container').html('<div class="alert alert-success" role="alert">' + response.message + '</div>'); // Display success message
      // You can update the UI here if needed
    },
    error: function(xhr) {
      $('#messages-container').html('<div class="alert alert-danger" role="alert">' + xhr.responseJSON.error + '</div>'); // Display error message
    }
  });
});
