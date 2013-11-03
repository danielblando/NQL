var input = ace.edit("input");
input.setTheme("ace/theme/tomorrow");
input.getSession().setMode("ace/mode/text");
input.setFontSize(16);
input.setHighlightActiveLine(false);
input.getSession().setTabSize(4);
input.getSession().setUseSoftTabs(false);

var output = ace.edit("output");
output.setTheme("ace/theme/tomorrow");
output.getSession().setMode("ace/mode/sql");
output.setFontSize(16);
output.setReadOnly(true);
output.setHighlightActiveLine(false);
output.getSession().setTabSize(4);
output.getSession().setUseSoftTabs(false);

$(function() {
var submit_form = function(e) {
  var vInput = input.session.getValue();
  if(vInput != '')
  {
    $.getJSON($SCRIPT_ROOT + '/_add_numbers', {
      query: input.session.getValue()
      //b: $('input[name="b"]').val(),
    }, function(data) {
      console.log(data.result);
      output.session.setValue(String(data.result));
      //$('#result').text(data.result);
      //$('input[name=a]').focus().select();
    });
  }
  else
  {
    output.session.setValue('');
  }
  return false;
};

$('a#calculate').bind('click', submit_form);

$('input[type=text]').bind('keydown', function(e) {
  if (e.keyCode == 13) {
    submit_form(e);
  }
});

$('input[name=a]').focus();
});

