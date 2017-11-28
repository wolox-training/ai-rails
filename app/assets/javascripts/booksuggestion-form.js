function addRow() {
  var newTitle = $('#bs-form input[name=title]').val();
  var newAuthor = $('#bs-form input[name=author]').val();
  var newEditorial = $('#bs-form input[name=editorial]').val();
  var newPublisher = $('#bs-form input[name=publisher]').val();
  var newPrice = $('#bs-form input[name=price]').val();
  var newLink = $('#bs-form input[name=link]').val();
  var newYear = $('#bs-form input[name=year]').val();

  $('#bs-table tr:last').after(
    '<tr>\
    <td>' + newTitle + '</td> \
    <td> ' + newAuthor + ' </td> \
    <td> ' + newEditorial + ' </td> \
    <td> ' + newPublisher + ' </td> \
    <td> ' + newPrice + ' </td> \
    <td> ' + newLink + ' </td> \
    <td> ' + newYear + ' </td> \
    </tr>')

  // Clear
  $('#bs-form').find("input[type=text], textarea").val("");
}

$(document).ready(function() {
  $('#bs-form').submit( function(e) {
    e.preventDefault();

    var valuesToSubmit = $(this).serialize();
    $.ajax({
        type: "POST",
        url: $(this).attr('action'), //sumbits it to the given url of the form
        data: valuesToSubmit,
        dataType: "JSON" 
    }).success(function(json){
        addRow();
    });
    return false;
  })
})
