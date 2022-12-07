<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" type="text/css" href="styles/style.css" />
        <link rel="stylesheet" href="./styles/index.css" />
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
        
        <link rel="icon" href="res/logo_app.png">
        
        <style>
        </style>
        <title>EcoHouse</title>
        <style>
        	#side-card {
        		background-color: rgba(255, 255, 255, .9);
        		border-top-color: #75ff75;
        	}
        </style>
    </head>
    <body>
        <div id="wrapper">
            <nav>
                <a href="aboutus">about us</a>
                <a id="login" href="login">login</a>
            </nav>

            <div id="main-section">
                <div id="logo-div">
                    <img id="logo" src="res/logo_app.png" alt="" />
                    <h1></h1>
                </div>
                <div id="side-card">
                    <h3>Sua casa mais <span style="color: #3FC83F">VERDE!<span></h3>
                    <p>EcoHouse: um aplicativo para facilitar de vez o gerenciamento de lixos domiciliares!</p>
                    <a class="btn-dashed" href="signin">COMECE JÁ</a>
                </div>
            </div>
            <div id="info-div">
                <div id="info1" class="info"><span class="igual">=</span>
                    <div>
                        <h3>Reciclagem</h3> <p class="info-text">Gerencie seus lixos domésticos com praticidade!</p>
                    </div>
                </div>
                <div id="info2" class="info"><span class="igual">=</span>
                    <div>
                        <h3>Eco Pontos</h3>
                        <p class="info-text">Procure os ecopontos mais próximos de sua casa!</p>
                    </div>
                </div>       
        </div>

        <script>
            const delay = ms => new Promise(res => setTimeout(res, ms));

            const write = async (text, container) => {
                for (const char of text) {
                    container.innerHTML += char;
                    await delay(100);
                }
            }

            window.onload = async ev => {
                await delay(500);
                write('EcoHouse', document.querySelector('h1'));
            };
        </script>
    </body>
</html>