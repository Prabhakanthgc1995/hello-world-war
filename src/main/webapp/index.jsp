<html>
<head>
<title>Hello World!</title>
</head>
<body>
	<h1>Good Night guys</h1>
	<p>
		It is now
		<%= new java.util.Date() %></p>
	<p>
		You are coming from 
		<%= request.getRemoteAddr()  %></p>
</body>
