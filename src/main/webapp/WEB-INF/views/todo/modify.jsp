<%--
  Created by IntelliJ IDEA.
  User: imchaewon
  Date: 2023/01/06
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=divice-width, initial-scale=1">

    <!--  Bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <title>Hello, World</title>
</head>
<body>
<div class="container-fluid">
    <div class="row"> <!-- Header -->
        <div class="col">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Pricing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled">Disabled</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="row content">
            <div class="col">
                <div class="card">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body">
                        <form>
                        <div class="input-group mb-3">
                            <span class="input-group-text">TNO</span>
                            <input type="text" name="tno" class="form-control" value="<c:out value="${dto.tno}"></c:out>" readonly/>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">Title</span>
                            <input type="text" name="title" class="form-control" value="<c:out value="${dto.title}"></c:out>"/>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">DueDate</span>
                            <input type="date" name="dueDate" class="form-control" value="<c:out value="${dto.dueDate}"></c:out>"/>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text">Writer</span>
                            <input type="text" name="writer" class="form-control" value="<c:out value="${dto.writer}"></c:out>"/>
                        </div>
                        <div class="form-check">
                            <label for="finished" class="form-check-label">Finished &nbsp</label>
                            <input type="checkbox" class="form-check-input" name="finished" id="finished" ${dto.finished ? "checked" : ""}>
                        </div>

                        <div class="my-4">
                            <div class="float-end">
                                <button type="button" class="btn btn-danger">Remove</button>
                                <button type="button" class="btn btn-primary">Modify</button>
                                <button type="button" class="btn btn-secondary">List</button>
                            </div>
                        </div>
                    </form>

                        <script>
                            const formObj = document.querySelector("form");

                            document.querySelector("button.btn.btn-danger").addEventListener("click", (e) => {

                                e.preventDefault();
                                e.stopPropagation();

                                formObj.action = "/todo/remove?${pageRequestDTO.link}";
                                formObj.method = "post";

                                formObj.submit();
                            },false);

                            document.querySelector("button.btn.btn-primary").addEventListener("click", (e) => {

                                e.preventDefault();
                                e.stopPropagation();

                                formObj.action = "/todo/modify";
                                formObj.method = "post";

                                formObj.submit();
                            },false);

                            document.querySelector("button.btn.btn-secondary").addEventListener("click", (e) => {
                                self.location = "/todo/list?${pageRequestDTO.link}";
                            },false);
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row content"> <!-- Content -->
        <h1>Content</h1>
    </div>
    <div class="row footer"> <!-- Footer -->
        <div class="row fixed-bottom">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>


