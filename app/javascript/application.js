// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"
import "@popperjs/core"
import "../stylesheets/application.scss"

// This line is optional and ensures that Bootstrap's JS works correctly with Rails UJS
import { Tooltip, Popover } from "bootstrap"
document.addEventListener("turbolinks:load", () => {
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new Tooltip(tooltipTriggerEl)
  })
})
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
// $(document).ready(function() {
//   var employeesPerPage = 10;
//   var employees = $('.employees-table');
//   var totalEmployees = employees.length;
//   var totalPages = Math.ceil(totalEmployees / employeesPerPage);

//   function showPage(page) {
//     employees.hide();
//     employees.slice((page - 1) * employeesPerPage, page * employeesPerPage).show();
//     updatePaginationControls(page);
//   }

//   function updatePaginationControls(currentPage) {
//     var paginationControls = $('#pagination-controls');
//     paginationControls.empty();

//     for (var i = 1; i <= totalPages; i++) {
//       var pageLink = $('<a href="#">' + i + '</a>');
//       if (i === currentPage) {
//         pageLink.addClass('active');
//       }
//       pageLink.on('click', function(event) {
//         event.preventDefault();
//         showPage(parseInt($(this).text()));
//       });
//       paginationControls.append(pageLink);
//     }
//   }

//   showPage(1);
// });
$(document).on('turbolinks:load', function() {
  // Function to show and hide the popup
  function togglePopup() {
    $(".content").toggle();
  }

  // Event handler for opening the edit popup
  $(document).on('click', '.edit-popup', function(event) {
    event.preventDefault();
    var url = $(this).data('url');
    $.ajax({
      url: url,
      success: function(response) {
        $('#popup-content').html(response);
        togglePopup();
      }
    });
  });

  // Event handler for closing the popup
  $(document).on('click', '.close-btn', function() {
    togglePopup();
  });
});
