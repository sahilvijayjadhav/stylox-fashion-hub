<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Success</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap');
        
        :root {
            --primary: #6C63FF;
            --secondary: #4D44DB;
            --accent: #FF6584;
            --light: #F8F9FA;
            --dark: #343A40;
            --success: #28A745;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        body {
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: var(--light);
        }
        
        @keyframes gradient {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
        
        .success-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 600px;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.18);
            animation: fadeIn 0.8s ease-out;
            transform-style: preserve-3d;
        }
        
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: white;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        p {
            font-size: 1.1rem;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .checkmark {
            width: 80px;
            height: 80px;
            margin: 0 auto 25px;
            position: relative;
            animation: checkmarkScale 0.6s ease-in-out both;
        }
        
        .checkmark-circle {
            stroke-dasharray: 166;
            stroke-dashoffset: 166;
            stroke-width: 4;
            stroke-miterlimit: 10;
            stroke: var(--success);
            fill: none;
            animation: stroke 0.6s cubic-bezier(0.65, 0, 0.45, 1) forwards;
        }
        
        .checkmark-check {
            transform-origin: 50% 50%;
            stroke-dasharray: 48;
            stroke-dashoffset: 48;
            stroke-width: 4;
            stroke-miterlimit: 10;
            stroke: var(--success);
            fill: none;
            animation: stroke 0.3s cubic-bezier(0.65, 0, 0.45, 1) 0.6s forwards;
        }
        
        @keyframes stroke {
            100% {
                stroke-dashoffset: 0;
            }
        }
        
        @keyframes checkmarkScale {
            0%, 100% {
                transform: none;
            }
            50% {
                transform: scale3d(1.1, 1.1, 1);
            }
        }
        
        .continue-btn {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 12px 30px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(5px);
            position: relative;
            overflow: hidden;
        }
        
        .continue-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        
        .continue-btn:active {
            transform: translateY(-1px);
        }
        
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background-color: var(--accent);
            opacity: 0;
        }
        
        @media (max-width: 768px) {
            .success-container {
                padding: 30px 20px;
            }
            
            h1 {
                font-size: 2rem;
            }
            
            p {
                font-size: 1rem;
            }
            
            .checkmark {
                width: 60px;
                height: 60px;
            }
        }
    </style>
</head>
<body>
    <!-- Audio element for payment success sound (hidden) -->
    <audio id="paymentSound" preload="auto">
       <source src="./audio/success-1-6297.mp3" type="audio/mpeg">
    </audio>

    <div class="success-container">
        <svg class="checkmark" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52">
            <circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none"/>
            <path class="checkmark-check" fill="none" d="M14.1 27.2l7.1 7.2 16.7-16.8"/>
        </svg>
        <h1>Payment Successful!</h1>
        <p>Thank you for your purchase. Your order has been placed successfully and will be processed shortly.</p>
        <a href="index.jsp" class="continue-btn">Continue Shopping</a>
    </div>

    <script>
        // Play payment success sound when page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Play sound
            const paymentSound = document.getElementById('paymentSound');
            paymentSound.volume = 0.3; // Set volume to 30% to avoid being too loud
            paymentSound.play().catch(e => console.log("Audio play failed:", e));
            
            // Create confetti effect
            const colors = ['#FF6584', '#6C63FF', '#4D44DB', '#23d5ab', '#e73c7e'];
            const container = document.querySelector('.success-container');
            
            for (let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.classList.add('confetti');
                confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.left = Math.random() * 100 + '%';
                confetti.style.top = -10 + 'px';
                confetti.style.transform = 'rotate(' + Math.random() * 360 + 'deg)';
                container.appendChild(confetti);
                
                animateConfetti(confetti);
            }
            
            function animateConfetti(element) {
                const duration = Math.random() * 3 + 2;
                const delay = Math.random() * 2;
                
                element.style.animation = `confettiFall ${duration}s ease-out ${delay}s forwards`;
                
                // Add keyframes dynamically
                const style = document.createElement('style');
                style.innerHTML = `
                    @keyframes confettiFall {
                        0% {
                            opacity: 1;
                            transform: translateY(0) rotate(0deg);
                        }
                        100% {
                            opacity: 0;
                            transform: translateY(100vh) rotate(360deg);
                        }
                    }
                `;
                document.head.appendChild(style);
            }
        });
    </script>
</body>
</html>