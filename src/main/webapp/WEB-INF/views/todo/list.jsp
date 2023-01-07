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
                    <div class="card-body">
                        <h5 class="card-title">Search</h5>
                        <form action="/todo/list" method="get">
                            <input type="hidden" name="size" value="${pageRequestDTO.size}">
                            <div class="mb-3">
                                <input type="checkbox" name="finished" ${pageRequestDTO.finished ? "checked" : ""}>완료여부
                            </div>
                            <div class="mb-3">
                                <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType('t') ? "checked" : ""}>제목
                                <input type="checkbox" name="types" value="w" ${pageRequestDTO.checkType('w') ? "checked" : ""}>작성자
                                <input type="text" name="keyword" class="form-control" value="${pageRequestDTO.keyword}">
                            </div>
                            <div class="input-group mb-3 dueDateDiv">
                                <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                                <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                            </div>
                            <div class="input-group mb-3">
                                <div class="float-end">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                    <button type="reset" class="btn btn-info clearBtn">Clear</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        Featured
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Special title treatment</h5>
                        <table class="table">
                            <thead>
                            <tr>
                                <th class="col">Tno</th>
                                <th class="col">Title</th>
                                <th class="col">Writer</th>
                                <th class="col">DueDate</th>
                                <th class="col">Finished</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${responseDTO.getDtoList()}" var="dto">
                                <tr>
                                    <th scope="row"><c:out value="${dto.tno}"/> </th>
                                    <td>
                                        <a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="link-dark" data-tno="${dto.tno}">
                                            <c:out value="${dto.title}"/>
                                        </a>
                                    </td>
                                    <td><c:out value="${dto.writer}"/></td>
                                    <td><c:out value="${dto.dueDate}"/></td>
                                    <td><c:out value="${dto.finished ? 'Done' : 'Not Yet'}"/></td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <div class="">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${responseDTO.prev}">
                                        <li class="page-item"><a class="page-link" data-num="${responseDTO.page - 1}">Previous</a></li>
                                    </c:if>

                                    <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                                        <li class="page-item"><a class="page-link ${responseDTO.page == num ? 'active' : ''}" data-num="${num}">${num}</a></li>
                                    </c:forEach>

                                    <c:if test="${responseDTO.next}">
                                        <li class="page-item"><a class="page-link" data-num="${responseDTO.page + 1}">Next</a></li>
                                    </c:if>
                                </ul>
                                <script>
                                    document.querySelector(".pagination").addEventListener("click", e => {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        const target = e.target;

                                        if(target.tagName !== 'A') {

                                            return;
                                        }
                                        const num = target.getAttribute("data-num");

                                        const formObj = document.querySelector("form");

                                        formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'/>`;

                                        formObj.submit();

                                    }, false);

                                    document.querySelector(".btn.btn-info.clearBtn").addEventListener("click", e => {
                                        e.preventDefault();
                                        e.stopPropagation();
                                        self.location = "/todo/list";
                                    }, false);
                                </script>
                            </nav>
                        </div>
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


