<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:if test="${empty sessionScope.sessionStaff}">
            <c:redirect url="/" />
        </c:if>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script type="text/javascript" src="./scripts/jquery-3.7.1.min.js"></script>
            <script type="text/javascript" src="./scripts/fadetransition.js"></script>
            <link rel="stylesheet" href="./css/loader.css">
            <link rel="stylesheet" href="./css/user_window.css">
            <title>SmartQueue</title>
            
        </head>
        <body>
<style>
    body {
    font-family: 'Poppins', sans-serif;
    background-color: #F6F4EB;
    color: #333;
    margin: 0;
    padding: 0;
  }
  
  header {
    background-color: #00509d;
    color: #fff;
    padding: 20px;
    text-align: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  }
  
  header h1 {
    margin: 0;
    font-size: 2.5rem;
    letter-spacing: 1px;
  }
  
  .datetime {
    font-size: 1.2rem;
    margin-top: 15px;
  }
  
  main {
    display: flex;
    justify-content: space-around;
    padding: 30px;
   
  }
  .counters {
    display: flex;
  
  }
  .counter {
    padding: 20px;
    width: 250px;
    height: 92%;
    text-align: center;
    background-color: #1e91d0;
  }
  
  .counter h2 {
    background-color: #00509d;
    color: #fff;
    padding: 15px;
    margin: 0;
    margin-top: 10px;
    border-radius: 15px 15px 0 0;
    font-size: 1.5rem;
    text-transform: uppercase;
    box-shadow: inset 0 -4px 10px rgba(0, 0, 0, 0.1);
  }
  
  .queue-numbers {
    font-size: 1.8rem;
    margin-top: 50px;
    color: #444;
    font-weight: bold;
  }
  
  .queue-numbers p {
    margin: 20px 0;
    padding: 10px;
    background-color: #f5f5f5;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
  }
  
  .advertisement {
    width: 70%;
    text-align: center;
    background: transparent;
    padding: 20px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    /* transition: transform 0.3s ease-in-out; */
  }
  
  /* .advertisement:hover {
    transform: translateY(-10px);
  } */
  
  .datetime {
    background-color: #1e91d0;
    color: #fff;
    padding: 10px;
    border-radius: 10px;
    font-size: 1.5rem;
    text-transform: uppercase;
    box-shadow: inset 0 -4px 10px rgba(0, 0, 0, 0.1);
  }
  
  video {
    width: 100%;
    height: 86%;
    align-items: center;
    justify-content: center;
    display: flex;
    border: 5px solid #333;
    border-radius: 10px;
    margin-top: 2px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  }
  
  footer {
    text-align: center;
    padding: 15px;
    background-color: #333;
    color: #fff;
    margin-top: 38px;
    box-shadow: 0 -4px 8px rgba(0, 0, 0, 0.2);
   
  }
  
  footer p {
    margin: 0;
    font-size: 1rem;
  }
  @media (max-width: 768px) {
            header h1 {
                font-size: 2rem;
            }

            .datetime {
                font-size: 1rem;
            }

            .counter {
                width: 100%; 
                margin: 10px 0; 
            }

            .advertisement {
                width: 90%;
            }

            .queue-numbers {
                font-size: 1.5rem; 
            }
        }

        @media (max-width: 480px) {
            header h1 {
                font-size: 1.5rem;
            }

            .datetime {
                font-size: 0.9rem;
            }

            .queue-numbers {
                font-size: 1.2rem; 
            }
        }
            </style>
                  <main>
                    <div class="counters">
                      <div class="counter" id="counter1">
                        <h2>Counter 1</h2>
                        <div class="queue-numbers" id="queue1"></div>
                      </div>
                      <div class="counter" id="counter2">
                        <h2>Counter 2</h2>
                        <div class="queue-numbers" id="queue2"></div>
                      </div>
                      <div class="counter" id="counter3">
                        <h2>Counter 3</h2>
                        <div class="queue-numbers" id="queue3"></div>
                      </div>
                    </div>
                
                    <div class="advertisement">
                      <video id="adVideo" controls autoplay loop>
                        <source src="video-ad.mp4" type="video/mp4">
                      </video>
                      <div class="datetime">
                      <span id="date"></span> | <span id="time"></span>
                    </div>
                    </div>
                  </main>
                
                  <footer>
                    <b><p>&copy; 2024 Cebu Eastern College. All Rights Reserved.</p></b>
                  </footer>
                
                  <script>
                 
                let startQueue = 1;
                
                function updateQueue(counterId, queueId) {
                  let queueDiv = document.getElementById(queueId);
                  queueDiv.innerHTML = '';  
                
                  for (let i = 0; i < 5; i++) {
                    let number = startQueue + i;
                    let p = document.createElement('p');
                    p.textContent = `#${number}`;
                    queueDiv.appendChild(p);
                  }
                  startQueue += 5;  
                }
                
                setInterval(() => {
                  updateQueue('counter1', 'queue1');
                  updateQueue('counter2', 'queue2');
                  updateQueue('counter3', 'queue3');
                }, 10000);
                
                function updateTime() {
                  const now = new Date();
                  document.getElementById('date').textContent = now.toLocaleDateString();
                  document.getElementById('time').textContent = now.toLocaleTimeString();
                }
                setInterval(updateTime, 1000);
                
                updateQueue('counter1', 'queue1');
                updateQueue('counter2', 'queue2');
                updateQueue('counter3', 'queue3');
                updateTime();
                
                  </script>

            <div class="load-wrapper">
                <div class="main-loader">
                    <div class="box-loader">
                    </div>
                </div>
            </div>
        </body>

        </html>