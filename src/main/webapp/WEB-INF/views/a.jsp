<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>a</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>

<style>

    .a {
        margin-bottom: 20px;
    }

    .b {
        font-size: 14px;
    }

    .diva {
        padding: 20px;
        margin: 10px;
        background-color: rgb(244, 248, 239);
        height: 110px;
    }

    .da {
        width: 740px;
    }

    .db {
        width: 300px;
    }

    .dpn {
        display: none;
    }

    .flex {
        display: flex;
        flex-wrap: wrap;
    }

</style>

<body>

<div class="container">
    <br><br><br>
    <div>
        <p>pageNum : ${page.pageNum}</p>
        <p>pageSize : ${page.pageSize}</p>
        <p>size : ${page.size}</p>
        <p>pages : ${page.pages}</p>
        <p>prePage : ${page.prePage}</p>
        <p>nextPage : ${page.nextPage}</p>
        <p>isFirstPage : ${page.isFirstPage}</p>
        <p>hasPreviousPage : ${page.hasPreviousPage}</p>
        <p>navigatePages : ${page.navigatePages}</p>


        <div style="text-align: center">
            <%--            <button ${pageNum < 11 ? "disabled='disabled'" : ""} onclick="location.href='/ant?pageNum=1'" class="btn btn-secondary">◀◀</button>--%>
            <%--    <button ${pageNum < 11 ? "disabled='disabled'" : ""} onclick="location.href='/ant?pageNum=${endNum - 19}'" class="btn btn-secondary" style="margin-right: 20px">◀</button>--%>

            <button ${page.pages < 11 ? "disabled='disabled'" : ""} onclick="location.href='/ant?pageNum=${endNum - 19}'" class="btn btn-secondary" style="margin-right: 20px">◀</button>
            <button ${page.pages < 11 ? "disabled='disabled'" : ""} onclick="location.href='/ant?pageNum=1'" class="btn btn-secondary">◀◀</button>


            <c:forEach var="boardList" begin="${startNum}" end="${endNum}">
                <c:if test="${boardList <= buttonCount}">
                    <button ${boardList != pageNum ? "style='background: #d2d2d2; border: none'" : ""} onclick="location.href='/ant?pageNum=${boardList}'" class="btn btn-secondary">${boardList}</button>
                </c:if>
            </c:forEach>

            <%--            <button ${endNum > buttonCount ? "disabled='disabled'" : ""} onclick="location.href='/ant?pageNum=${endNum + 1}'" class="btn btn-secondary" style="margin-left: 20px">▶</button>--%>
<%--            <button ${endNum > buttonCount ? "disabled='disabled'" : ""} onclick="location.href='/ant?pageNum=${pageNumEnd - (pageNumEnd - 1) % 10}'" class="btn btn-secondary">▶▶</button>--%>

            <button ${endNum > buttonCount ? "disabled='disabled'" : ""} onclick="location.href='/a?pageNum=${page.nextPage}'" class="btn btn-secondary" style="margin-left: 20px">▶</button>

            <c:if test="${status == '기업'}">
                <button style="float: right" onclick="location.href='/boardWritePage'" class="btn btn-secondary darkGreen">글쓰기</button>
            </c:if>
        </div>


        <c:forEach var="boardList" items="${board}">
            <div class="flex">
                <div class="diva db">
                    <h5>${boardList.id}</h5>
                    <h5>${boardList.companyName}</h5>
                </div>
                <div class="diva da boardDetailPage">
                    <h5 class="a">${boardList.title}</h5>
                    <p class="b">${boardList.workArea} | ${boardList.career} | 학력 | 근무형태</p>
                    <p class="dpn" id="boardListId">${boardList.id}</p>
                </div>
            </div>
        </c:forEach>
    </div>
    <br>

</div>


<script>

</script>


</body>
</html>