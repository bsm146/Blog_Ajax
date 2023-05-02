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

<button class="color" value="red">red</button>
<button class="color" value="yellow">yellow</button>
<button class="color" value="green">green</button>
<button id="reset" value="reset">reset</button>
<br>
<div id="addColor"></div>

<input name="id" id="id">
<input name="password" id="password">
<button id="join">가입</button>

<script>

    $('.color').on('click', function () {

        $.ajax({

            url: '/color',
            type: 'POST',
            data: {
                'color': $(this).val()
            },

            success: function (result) {

                console.log('성공')
                console.log('돌아온 색깔 : ' + result);

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

    $('#reset').click(function () {

        $('#addColor').text('');
        console.log('리셋');
        console.log('');
    })

    // 가입
    $('#join').on('click', function () {

        let id = $('#id').val();
        let password = $('#password').val();

        $.ajax({

            url: '/join',
            type: 'post',
            data: {
                id: id,
                password: password
            },
            success: function (data) {
                console.log(data[0].id);
                console.log(data[0].password);
            }
        })
    })

</script>


</body>
</html>