<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${context}/styles/style.css" />
       
        <style>
        	@import url('https://fonts.googleapis.com/css2?family=Montserrat&display=swap');
        	
        	* {
        		margin: 0; padding: 0;
        	}
        	nav {
			    display: flex;
			    height: 10vh; width: 100vw;
			    align-items: center;
			    justify-content: space-evenly;
			}
			nav a {
			    text-decoration: none;
			    color: black;
			    font-size: 23px;
			    transition: .5s ease;
			    border-radius: 10px;
			    padding: 15px;
			}
			nav a:hover {
			    background-color: #f5f5f5;
			}
        	
        	
        	body {
			    overflow-x: hidden;
			    overflow-y: scroll;
			    font-family: Montserrat;
			}
			#corpo {
			    height: 100vh; width: 100vw;
			    background-image: url('./res/onda2.svg');
			    background-size: cover;
			}
			
			.container {
			    display: flex;
			    align-content: center;
			    width: 100vw;
			    height: 60vh;
			    margin-top: 10px;
			}
			
			#div-titulo {
			    width: 100%; height: 120px;
			    display: flex;
			    align-items: center;
			    justify-content: center;
			}
			
			#div-titulo p {
			    font-size: 300%;
			    font-weight: bold;
			}
			
			#wrapper-sobre {
			    width: 100vw; height: auto;
			
			    display: flex;
			    flex-direction: column;
			}
			
			#about-us {
			    text-align: justify;
			    width: 100%;
			
			    margin: 10%;
			    padding: 2%;
			}
			
			#about-us h2 {
			    margin-bottom: 50px;
			    text-align: center;
			}
			
			#content {
			    text-align: justify;
			    font-size: 20px;
			}
			
			#logo-sobre {
			    position: absolute;
			    top: 35%;
			    left: 50%;
			    transform: translate(-50%, -50%);
			    background-color: white;
			
			    height: 150px;
			    width: 150px;
			}
			
			#logo-sobre img {
			    width: 100%;
			}
			
			#vertical-line {
			    border-left: 1.5px solid black;
			    max-height: 500px;
			
			    margin-top: 5%;
			}
			
			.footer {
			    width: 100vw; height: 300px;
			    line-height:24px
			}
			
			.opa {
			    display: inline-block;
			    width: 100%;
			    margin: 2%;
			}
			
			.desc {
			    margin-top: 2%;
			    text-align: justify;
			}
			
			#desc1 {
			    width: 75%;
			}
			
			.itens {
			    display: flex;
			    justify-content: center;
			}
			
			li {
			    list-style: none;
			    margin-top: 5px;
			}
			
			#copyright {
			    display: flex;
			    justify-content: center;
			    margin-top: 0%;
			}
			
			hr {
			    border-top: 1px solid black;
			    opacity: 50%;
			}
        </style>
        <title>Sobre nós</title>
    </head>
    <body>
        <div id="corpo">
            <div id="wrapper-sobre">
                <nav>
                    <a href="/eco_house">home</a>
                    <a id="login" href="login">login</a>
                </nav>
            </div>
            <div id="div-titulo">
                <p>Sobre nós</p>
            </div>
            <div id="logo-sobre">
                <a href="index.jsp"><img src="res/logo_app.png"></a>
            </div>
            <div class="container">
                <div id="about-us">
                    <div id="content">
                        <h2>Eco House</h2>
                        <p>A Eco House é um projeto que tem como objetivo ajudar na reciclagem doméstica através da visualização de ecopontos que serão mostrados ao usuário para que assim ele possa encaminhá-los à melhor localização de descarte.</p>
                    </div>
                </div>
                <div id="vertical-line"></div>
                <div id="about-us">
                    <div id="content">
                        <h2>Null Pointer Exception</h2>
                        <p>Nós somos o NullTeam, desenvolvedores da Eco House. Temos como missão o uso da tecnologia para contribuição em causas contemporâneas. Nossa visão é a de um mundo de software mais integrado ao social. Igualdade, sustentabilidade e criativdade são os nossos valores.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="itens">
                <div class="opa">
                    <h3>Sobre</h3>
                    <p id="desc1" class="desc">A ferramenta EcoHouse foi um projeto planejado no ano de 2022 a fim de trabalhar com a tecnologia e a facilidade a se agregar no cotidiano de cada um. Inclui-se em utilização linguagens de programação como HTML, Java, JSP, JavaScript, SQL.</p>
                </div>

                <div class="opa">
                    <h3>Contato</h3>
                    <p class="desc">Você pode nos contatar usando os nossos seguintes referenciais meios de comunicação:</p> <br />
                    <ul>
                        <li><a>nullptrexceptionteam@gmail.com</a></li>
                    </ul>
                </div>
            </div>
            <hr />
            <div>
                <p id="copyright">NullPointerException Team &copy; 2022.</p>
            </div>
        </div>
    </body>
</html>