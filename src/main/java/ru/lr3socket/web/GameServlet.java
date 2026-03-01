package ru.lr3socket.web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/game")
public class GameServlet extends HttpServlet {

    private static final String ATTR_LOW = "low";
    private static final String ATTR_HIGH = "high";
    private static final String ATTR_GUESS = "guess";
    private static final String ATTR_ATTEMPTS = "attempts";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("start".equals(action)) {
            startGame(req, resp);
            return;
        }

        if ("feedback".equals(action)) {
            processFeedback(req, resp);
            return;
        }

        if ("restart".equals(action)) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        throw new ServletException("Неизвестное действие: " + action);
    }

    private void startGame(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int min;
        int max;
        try {
            min = Integer.parseInt(req.getParameter("min"));
            max = Integer.parseInt(req.getParameter("max"));
        } catch (NumberFormatException ex) {
            throw new ServletException("Границы диапазона должны быть целыми числами.", ex);
        }

        if (min >= max) {
            throw new ServletException("Минимум должен быть строго меньше максимума.");
        }

        HttpSession session = req.getSession(true);
        session.setAttribute(ATTR_LOW, min);
        session.setAttribute(ATTR_HIGH, max);
        session.setAttribute(ATTR_ATTEMPTS, 1);
        session.setAttribute(ATTR_GUESS, midpoint(min, max));

        resp.sendRedirect(req.getContextPath() + "/game.jsp");
    }

    private void processFeedback(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session = req.getSession(false);
        if (session == null) {
            throw new ServletException("Игровая сессия не найдена. Начните игру заново.");
        }

        Integer low = (Integer) session.getAttribute(ATTR_LOW);
        Integer high = (Integer) session.getAttribute(ATTR_HIGH);
        Integer guess = (Integer) session.getAttribute(ATTR_GUESS);
        Integer attempts = (Integer) session.getAttribute(ATTR_ATTEMPTS);

        if (low == null || high == null || guess == null || attempts == null) {
            throw new ServletException("Повреждено состояние игры. Начните игру заново.");
        }

        String result = req.getParameter("result");
        switch (result) {
            case "smaller":
                high = guess - 1;
                break;
            case "larger":
                low = guess + 1;
                break;
            case "equal":
                resp.sendRedirect(req.getContextPath() + "/win.jsp");
                return;
            default:
                throw new ServletException("Некорректный ответ пользователя: " + result);
        }

        if (low > high) {
            resp.sendRedirect(req.getContextPath() + "/cheat.jsp");
            return;
        }

        attempts++;
        int newGuess = midpoint(low, high);

        session.setAttribute(ATTR_LOW, low);
        session.setAttribute(ATTR_HIGH, high);
        session.setAttribute(ATTR_ATTEMPTS, attempts);
        session.setAttribute(ATTR_GUESS, newGuess);

        resp.sendRedirect(req.getContextPath() + "/game.jsp");
    }

    private int midpoint(int low, int high) {
        return low + (high - low) / 2;
    }
}
