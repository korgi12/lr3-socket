<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Угадай число: старт</title>
</head>
<body>
<h1>Лабораторная работа №3: Игра «Компьютер угадывает число»</h1>
<p>Введите диапазон, в котором вы загадаете число. Компьютер попытается его угадать.</p>

<form method="post" action="game">
    <input type="hidden" name="action" value="start">

    <label for="min">Минимум:</label>
    <input id="min" name="min" type="number" required>
    <br><br>

    <label for="max">Максимум:</label>
    <input id="max" name="max" type="number" required>
    <br><br>

    <button type="submit">Начать игру</button>
</form>
</body>
</html>
