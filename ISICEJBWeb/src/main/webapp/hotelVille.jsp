<%@page import="entities.Ville"%>
<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style type="text/css">
@media ( min-width : 991.98px) {
	main {
		padding-left: 240px;
	}
}

body {
    background-image: url("images/inter.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    opacity: 0.9; /* Adjust the opacity value (0.0 to 1.0) for overall transparency */
    background-color: rgba(255, 255, 255, 0.5);
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	padding: 58px 0 0; /* Height of navbar */
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 5%), 0 2px 10px 0 rgb(0 0 0/ 5%);
	width: 300px;
	z-index: 600;
}

@media ( max-width : 991.98px) {
	.sidebar {
		width: 100%;
	}
}

.sidebar .active {
	border-radius: 5px;
	box-shadow: 0 2px 5px 0 rgb(0 0 0/ 16%), 0 2px 10px 0 rgb(0 0 0/ 12%);
}

.sidebar-sticky {
	position: relative;
	top: 0;
	height: calc(100vh - 48px);
	padding-top: 0.5rem;
	overflow-x: hidden;
	overflow-y: auto;
	/* Scrollable contents if viewport is shorter than content. */
}
</style>
<script type="text/javascript">
	function validateForm() {
		var ville = document.getElementsByName("ville")[0].value;

		if (ville.trim() === '') {
			alert("Selectionner une ville d'abbord.");
			return false;
		}
		return true;
	}
</script>
</script>

</head>
<body>
	<nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse"
		style="background-color: #fbfbfb">
		<div class="position-sticky">
			<div class="list-group list-group-flush mx-3 mt-4">
				<a href="HotelController"
					class="list-group-item list-group-item-action py-2 ripple"
					aria-current="true"> <i
					class="fas fa-tachometer-alt fa-fw me-3"></i><span>Gestion
						Hotels</span>
				</a> <a href="VilleController"
					class="list-group-item list-group-item-action py-2 ripple"> <i
					class="fas fa-chart-area fa-fw me-3"></i><span>Gestion
						Villes</span>
				</a> <a href="HotelVilleController"
					class="list-group-item list-group-item-action py-2 ripple active"><i
					class="fas fa-lock fa-fw me-3"></i><span>Liste des Hotels
						par ville</span></a>
			</div>
		</div>
	</nav>

	<main style="margin-top: 58px;">
		<div class="container border mt-4 py-4">
			<form action="HotelVilleController" class="mb-4"
				onsubmit="return validateForm()" method="post">
				<div class="row">
					<div class="col">
						<select class="form-select" aria-label="Default select example"
							name="ville">
							<option selected value="">S�lectionner une ville</option>

							<c:forEach items="${villes}" var="v">
								<option value="${v.id}">${v.nom}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col">
						<input type="submit" class="btn btn-primary" value="Chercher" />
					</div>
				</div>
			</form>

			<h1 class="text-center mb-3 text-white">Liste des Hotels par ville</h1>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Nom</th>
						<th scope="col">Adresse</th>
						<th scope="col">T�lephone</th>
						<th scope="col">Ville</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${hotels}" var="v">
						<tr>
							<th scope="row">${v.id}</th>
							<td>${v.nom}</td>
							<td>${v.adresse}</td>
							<td>${v.telephone}</td>
							<td>${v.ville.nom}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>