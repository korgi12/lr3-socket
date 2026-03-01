<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp" %>
<%
    Integer guess = (Integer) session.getAttribute("guess");
    Integer low = (Integer) session.getAttribute("low");
    Integer high = (Integer) session.getAttribute("high");
    Integer attempts = (Integer) session.getAttribute("attempts");

    if (guess == null || low == null || high == null || attempts == null) {
        throw new ServletException("Игра не инициализирована. Сначала задайте диапазон.");
    }
%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Угадай число: игра</title>
</head>
<body>
<h1>Попытка №<%= attempts %></h1>
<p>Мой вариант: <strong><%= guess %></strong></p>
<p>Текущий диапазон поиска: [<%= low %>; <%= high %>]</p>

<form method="post" action="game" style="display:inline-block; margin-right: 10px;">
    <input type="hidden" name="action" value="feedback">
    <input type="hidden" name="result" value="smaller">
    <button type="submit">Меньше</button>
</form>

<form method="post" action="game" style="display:inline-block; margin-right: 10px;">
    <input type="hidden" name="action" value="feedback">
    <input type="hidden" name="result" value="larger">
    <button type="submit">Больше</button>
</form>

<form method="post" action="game" style="display:inline-block;">
    <input type="hidden" name="action" value="feedback">
    <input type="hidden" name="result" value="equal">
    <button type="submit">Угадал!</button>
</form>
</body>
</html>
