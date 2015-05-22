function handleEnter(digit , console, history)
{
    if(digit.keyCode == 13 || digit.which == 13)
	{	
		var currentType = console.value;
		currentType = currentType.replace("\n","");
		
		if(currentType == "cls")
		{
			history.innerHTML = "";
		}
		else if(currentType == "")
		{
			
		}
		else
		{
			//chamar controller para descobrir resultado
			$.ajax(
			{
			    // the URL for the request
			    url: "/database/execute",

			    // the data to send (will be converted to a query string)
			    data: {
			        command: currentType
			    },

			    // whether this is a POST or GET request
			    type: "POST",

			    // the type of data we expect back
			    dataType : "text",

			    // code to run if the request succeeds;
			    // the response is passed to the function
			    success: function( json ) {
			        history.innerHTML += ">" + currentType + "\n" + json + "<br>";
					history.scrollTop = history.scrollHeight;
			    },

			    // code to run if the request fails; the raw request and
			    // status codes are passed to the function
			    error: function( xhr, status, error ) {
					var error = xhr.responseText;
					error = error.substr(error.indexOf('<pre>'),(error.indexOf('</pre>')-error.indexOf('<pre>')));
					history.innerHTML += ">" + currentType + error;
					history.scrollTop = history.scrollHeight;
			    },

			    // code to run regardless of success or failure
			    complete: function( xhr, status ) {
			    }
			});
		}

		//history.value += currentType + "\n" + result.done + "\n";
		console.value = null;
	}
}