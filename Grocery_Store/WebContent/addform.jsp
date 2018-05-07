<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Add New Product</h1>
	<form action="addProduct.jsp" method="post">
		<table>
			<tr>
				<td>Product Name</td>
				<td><input type="text" name="pname" /></td>
			</tr>
			<tr>
				<td>Product Type</td>
				<td><input type="text" name="type" /></td>
			</tr>
			<tr>
				<td>Product Size</td>
				<td><input type="text" name="size" /></td>
			</tr>
			
			
			<tr>
				<td colspan="2"><input type="submit" value="Add Product" /></td>
			</tr>
		</table>
	</form>
</body>
</html>