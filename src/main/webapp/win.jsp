<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Победа компьютера</title>
</head>
<body>
<h1>🎉 Ура! Я угадал ваше число!</h1>
<p>Спасибо за игру. Хотите сыграть ещё раз?</p>

<form method="post" action="game">
    <input type="hidden" name="action" value="restart">
    <button type="submit">Сыграть снова</button>
</form>
</body>
</html>
