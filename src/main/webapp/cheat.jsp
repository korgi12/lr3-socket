<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Обнаружено жульничество</title>
</head>
<body>
<h1>😢 Обнаружено несоответствие ответов</h1>
<p>Ваши ответы противоречат друг другу. Похоже, кто-то жульничает.</p>
<p>Давайте начнём заново и сыграем честно!</p>

<form method="post" action="game">
    <input type="hidden" name="action" value="restart">
    <button type="submit">Начать заново</button>
</form>
</body>
</html>
