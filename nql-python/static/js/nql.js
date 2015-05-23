var input = ace.edit("input");
input.setTheme("ace/theme/tomorrow");
input.getSession().setMode("ace/mode/text");
input.setFontSize(16);
input.setHighlightActiveLine(false);
input.getSession().setTabSize(4);
input.getSession().setUseSoftTabs(false);
input.getSession().setUseWrapMode(true);

var output = ace.edit("output");
output.setTheme("ace/theme/tomorrow");
output.getSession().setMode("ace/mode/sql");
output.setFontSize(16);
output.setReadOnly(true);
output.setHighlightActiveLine(false);
output.getSession().setTabSize(4);
output.getSession().setUseSoftTabs(false);
output.getSession().setUseWrapMode(true);

$(function() {
var submit_form = function(e) {
  var vInput = input.session.getValue();
  if(vInput != '')
  {
    $.getJSON($SCRIPT_ROOT + '/execute_query', {
      query: input.session.getValue()
      //b: $('input[name="b"]').val(),
    }, function(data) {
      console.log(data);
      console.log(data.result);
      var sentence = [];
      if (data.result == 'error') {
        for (var i = 0; i < data.corrections.length; i++) {
          var right = data.corrections[i].right;
          var wrong = data.corrections[i].wrong;

          if (right != wrong && confirm('Deseja corrigir "' + wrong + '" para "' + right + '"?')) {
            wrong = right;
          }
          sentence.push(wrong);
          input.session.setValue(sentence.join(' '));
        };
      } else {
        output.session.setValue(String(data.result));
      }
    });
  }
  else
  {
    output.session.setValue('Favor inserir entrada.');
  }
  return false;
};

function showMenu(e) {
     /*  check whether the event is a right click 
       *  because different browser (ahem IE) assign different numbers to the keys to
       *  your mouse buttons and different values to the event, you'll have to do some evaluation
       */
        var menu = document.getElementById('menu');
        menu.style.display = "block"; //show menu

        var x = e.clientX; //get X and Y coordinance for menu position
        var y = e.clientY;

        //This section is necessary if you click on the far right edge or bottom
        //The 200 is arbitrary, choose whatever number you want based on how large your menu is
        if(window.innerWidth) {
             windowWidth = window.innerWidth;
             windowHeight = window.innerHeight;
        } else if(document.documentElement.clientWidth) {
             windowWidth = document.documentElement.clientWidth;
             windowHeight = document.documentElement.clientHeight;
        } else {
             windowWidth = document.getElementsByTagName('body')[0].clientWidth;
             windowHeight = document.getElementsByTagName('body')[0].clientHeight;
        }
        if(windowWidth < (x + 200)) {
             x = x - 200;
        }
        if(windowHeight < (y + 200)) {
             y -= 200;
        }

        //position the menu
        menu.style.position = "fixed"; // use fixed or it will not work when the window is scrolled
        menu.style.top = y+"px";
        menu.style.left= x+"px";
}
 
function clearMenu() { //used to make the menu disappear
     //this function should be used at the beginning of any function that is called from the menu
     var menu = document.getElementById('menu');
     menu.style.display = "none"; //don't show menu
}

$('a#calculate').bind('click', submit_form);

$('pre#input').bind('contextmenu', function(e) {
    showMenu(e);
    return false;
  });

$('pre#input').ready(function() {

    $('#menu').click(function() {
        $('#menu').hide();
    });
    $(document).click(function() {
        $('#menu').hide();
    });

});

$('#menu').bind("contextmenu", function(e) {
return false;
});

$('pre#input').bind('keydown', function(e) {
  if (e.keyCode == 13) {
    submit_form(e);
  }
});

$('input[name=a]').focus();
});

