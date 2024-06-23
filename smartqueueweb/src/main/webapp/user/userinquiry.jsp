<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <style>
        *{
            margin: 0%;
            padding: 0%;
            font-family: arial black;
        }
        .container{
            margin: 0%;
            padding: 0%;
            width: 100vw;
            height: 100vh;
            background-color: #fff;
        }
        .header{
            width: 100%;
            height: 25vh;
            background-color: #00296b;
        }
        .head{
            background-color: #fff;
            width: 100%;
            height: 15vh;
            align-items: center;
            display: flex;
            justify-content: center;
        }
        .logo{
            margin-left: 2%;
            width: 15vw;
            height: 27vh;
            display: flex;
            position: absolute;
            z-index: 1;
            top: -1%;
        }
        .name{
            position: absolute;
            top: 4%;
            z-index: 2;
            color: red;
            letter-spacing: 80px;
            text-align: center;
            font-size: 30px;
        }
        .title{
            text-align: center;
            font-size: 47px;
            top: 10%;
            position: absolute;
        }
        .address{
            margin-left: 20%;
            color: #fff;
            font-family: tahoma;
            top: 21%;
            position: absolute;
        }
        .info{
            margin-left: 50%;
            font-family: tahoma;
            top: 19%;
            position: absolute;
            color: #fff;
        }
        .main {
            width: 100%;
            height: 75vh;
            display: flex;
            justify-content: space-evenly;
            background-color: #77b6ea;
            align-items: center;
            float: left;
        }

        .main .box {
            position: relative;
            width: 25vw;
            height: 50vh;
            background: #f2f2f2;
            overflow: hidden;
            transition: all 0.5s ease-in;
            z-index: 2;
            box-sizing: border-box;
            padding: 30px;
            box-shadow: -10px 25px 50px rgba(0, 0, 0, 0.3);
        }            
        .main .box::before {
            position: absolute;
            left: 5px;
            width: 100%;
            height: 100%;
            font-size: 120px;
            opacity: 0.2;
            background: transparent;
            pointer-events: none;
        }
        .main .box::after {
            position: absolute;
            bottom: -10%;
            right: 5%;
            font-size: 120px;
            opacity: 0.2;
            background: transparent;
            filter: invert(1);
            pointer-events: none;
        }
        .main .box p {
            margin: 0;
            padding: 10px;
            font-size: 1.2rem;
        }
        .main .box h2 {
            position: absolute;
            margin: 0;
            padding: 0;
            bottom: 10%;
            right: 10%;
            font-size: 1.5rem;
        }
        .main .box:hover {
            color: #f2f2f2;
            box-shadow: 20px 50px 100px rgba(0, 0, 0, 0.5);
        }
        .main .bg {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1;
            opacity: 0;
            transition: all 0.5s ease-in;
            pointer-events: none;
            width: 100%;
            height: 200%;
            overflow: hidden;
        }
        .main .box.box1:hover,
        .quotes .box.box1:hover~.bg {
            opacity: 1;
            background: #e2a9e5;
            background: -moz-linear-gradient(-45deg, #1e91d0 15%, #00509d 100%);
            background: -webkit-linear-gradient(-45deg, #1e91d0 15%,#00509d 100%);
            background: linear-gradient(135deg, #1e91d0 15%,#00509d 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#e2a9e5', endColorstr='#2b94e5',GradientType=1 );
        }
        a{
            text-decoration: none;
            color: black;
        }
        .slidetext{
            display: inline-block;
            width: 100%;
            white-space: nowrap;
            animation: slide 20s linear infinite;
            margin: 0 24px;
            position: absolute;
        }
        
        @keyframes slide {
            from {
                transform: translate3d(100%,0,0);
            }
            to{
                transform: translate3d(-100%,0,0);
            }
        }

        
    </style>
    <div class="container">
        <div class="header">
            <p>.</p>
            <img src="/src/main/webapp/images/logo.png" class="logo">
            <div class="head">      
                <h2 class="name">宿务东方学院</h2>
                <h1 class="title">CEBU EASTERN COLLEGE, INC.</h1>
            </div>
            <p class="address">LEON KILAT ST. CEBU CITY</p>
            <p class="info">TEL.NOS. (032) 256-2523  FAX NO. (032) 256-2526 <br> EMAIL: cebueasterncollege1915@yahoo.com</p>
        </div>
        <div class="slidetext">
            <span>ATTENTION! ONCE YOUR NUMBER IS CALLED AND YOU ARE NOT AROUND, YOU NEED TO GET ANOTHER PRIORITY NUMBER. &ensp;</span>
    </div>
        <div class="main">
            <div class="card">
                <a href="general.html">
                    <div class="box box1">
                        <p>-Enrollment <br>-Assesment</p>
                        <h2>General</h2>
                    </div>
                </a>     
                </div>
                <div class="card">
                    <a href="records.html">
                        <div class="box box1">
                            <p>-Certifications <br>-Studyload <br>-TOR</p>
                            <h2>Records</h2>                                
                        </div>
                    </a>
                </div>
                <div class="card">
                    <a href="payments.html">
                        <div class="box box1">
                            <p>-Tuition</h2>
                            <h2>Payments</h2>
                        </div>
                    </a>    
                </div>
        </div>
    
        
    </div>

</body>
</html>