<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>ninja gold game</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <div class="d-flex m-1">
            <h3 class="mt-4 mb-1 pr-2">Your Gold:</h3>
            <h3 class="mt-3 mb-3 p-2"><c:out value="${gold}"/></h3>
            <form method="post" action="/gold/reset">
            	<input class="m-3 mt-4 btn btn-light" type="submit" value="Reset"/>
            </form>
        </div>
    	<div class="card-deck text-center mb-4">
            <div class="card p-1">
                <h4 class="card-title">Farm</h4>
                <p class="card-text">(earns 10-20 gold)</p>
                <form action="" method="post">
                    <input type="hidden" name="process" value="farm">
                    <input class="btn btn-light" type="submit" name="" value="Find Gold!">
                </form>
            </div>
            <div class="card p-1">
                <h4 class="card-title">Cave</h4>
                <p class="card-text">(earns 5-10 gold)</p>
                <form action="" method="post">
                    <input type="hidden" name="process" value="cave">
                    <input class="btn btn-light" type="submit" name="" value="Find Gold!">
                </form>
            </div>
            <div class="card p-1">
                <h4 class="card-title">House</h4>
                <p class="card-text">(earns 2-5 gold)</p>
                <form action="" method="post">
                	<input type="hidden" name="process" value="house">
                    <input class="btn btn-light" type="submit" name="" value="Find Gold!">
                </form>
            </div>
            <div class="card p-1">
                <h4 class="card-title">Casino!</h4>
                <p class="card-text">(earns/takes 0-50 gold)</p>
                <form action="" method="post">
                	<input type="hidden" name="process" value="casino">
                    <input class="btn btn-light" type="submit" name="" value="Find Gold!"></a>
                </form>
            </div>
            <div class="card p-1">
                <h4 class="card-title">Spa</h4>
                <p class="card-text">(takes 5-20 gold)</p>
                <form action="" method="post">
                	<input type="hidden" name="process" value="spa">
                    <input class="btn btn-light" type="submit" name="" value="Find Gold!"></a>
                </form>
            </div>
        </div>
        <div>
            <div class="">
                <label for="">Activities:</label>
                <div class="container-fluid border" style="height:250px;overflow:auto">
                   <c:forEach var="activite" items="${activities}" varStatus="item">
      
                    	<div style="color:<c:out value="${colors[item.index]}"/>"> <c:out value="${activite}" /></div>
                   </c:forEach>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
