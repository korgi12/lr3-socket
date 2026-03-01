<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Ошибка</title>
</head>
<body>
<h1>⚠️ Произошла ошибка</h1>
<p>
    <strong>Причина:</strong>
    <%= exception != null ? exception.getMessage() : "Неизвестная ошибка" %>
</p>

<button onclick="history.back();">Вернуться на предыдущую страницу</button>
</body>
</html>
