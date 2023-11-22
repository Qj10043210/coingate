<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Countdown Timer</title>
</head>
<body>
    <div id="timer">30:00</div>

    <script>
        // Get the remaining time from the model
        var remainingTime = ${remainingTime};

        function updateTimer() {
            var minutes = Math.floor(remainingTime / 60000);
            var seconds = ((remainingTime % 60000) / 1000).toFixed(0);

           
            document.getElementById("timer").textContent = (minutes < 10 ? "0" : "") + minutes + ":" + (seconds < 10 ? "0" : "") + seconds;

            
            if (remainingTime > 0) {
                remainingTime -= 1000;
                setTimeout(updateTimer, 1000);
            }
        }

        // Initial call to start the countdown
        updateTimer();
    </script>
</body>
</html>