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


</style>

<body>

<button class="push" value="red">red</button>
<button class="push" value="yellow">yellow</button>
<button class="push" value="green">green</button>
<button id="base" value="base">base</button>
<br>
<div id="addColor"></div>


<script>

    $('.push').click(function () {

        // console.log($(this).val());

        $.ajax({

            url: '/ajaxTest',
            type: 'POST',
            // data: {
            //     'name': '홍길동',
            //     'age': 20
            // },
            data: {
                'color': $(this).val()
            },

            success: function (result) {
                console.log('성공')
                console.log(result);

                let color;

                if (result == '빨강') {
                    color = 'red';

                } else if (result == '노랑') {
                    color = 'yellow';

                } else if (result == '초록') {
                    color = 'green';
                }

                $('#addColor')
                    .text(result)
                    .css('background-color', color)
            },

            error: function (error) {
                console.log('실패')
                console.log(error);
            },

            complete: function () {
                console.log('')
            }
        })

    })

    // push 누르면 div 초기화
    $('#base').click(function () {
        $('#addColor').text('');
    })

</script>


</body>
</html>