<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fontawesome.com/license/free">
    <script type="text/javascript" src="../scripts/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../scripts/fadetransition.js"></script>
    <link rel="stylesheet" href="../css/loader.css">
    <link rel="stylesheet" href="../css/payments.css">
    <title>Payment</title>
</head>

<body>
   
    <div class="container">
        <div class="header">
            <div class="head">
                <a href="userinquiry.jsp"><svg xmlns="http://www.w3.org/2000/svg" class="back-arrow" width=30 height=30
                        viewBox="0 0 448 512">
                        <path
                            d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z" />
                    </svg></a>
                <h1 class="title">Payment</h1>
            </div>
        </div>
        <div class="main">
            <div class="view-general">
                <div class="form">
                    <div class="fillupform">
                        <label for="studentIdNo">Student ID No.</label>
                        <input type="text" class="student-id" id="student-id">
                        <label for="studentName">Student Name</label>
                        <input type="text" class="student-name" id="student-name" disabled>
                        <label for="yearLevel">Cash On Hand</label>
                        <input type="text" class="cash-on-hand" id="cash-on-hand">
                        <label for="purpose">Amount To Pay</label>
                        <input type="text" class="amount-to-pay" id="amount-to-pay">
                    </div>
                    <input type="button" name="printbutton" id="printbutton" class="printbutton" value="Print">
                </div>
            </div>
        </div>
    </div>
    <div class="load-wrapper">
        <div class="main-loader">
            <div class="box-loader">
            </div>
        </div>
    </div>
</body>

</html>