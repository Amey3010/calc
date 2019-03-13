<%
	String fn = "0";
	if(request.getParameter("inpu")!=null)
		fn = request.getParameter("inpu");
%>
<html>
	<head>
		<title>Calculator</title>
		<link rel="stylesheet" href="fonts\font.css">
		<style>
			body{
				margin: 0px;
				background-color: black;
				font-family: Montserrat;
				margin-left: 30%;
				margin-top: 3%;
			}
			.calc{
				display: inline-block;
				display: grid;
				grid-template-columns: auto auto auto auto;
				grid-gap: -2px;
				height: 410px;
				width: 500px;
				font-size: 60px;
			}
			.inp{
				grid-column-start: 1;
				grid-column-end: 5;
				text-align: right;
				background-color: transparent;
				border: 1px solid white;
				font-size: 60px;
				color: white;
				width: 495px;
				border-bottom: none;
			}
			.output{
				grid-column-start: 1;
				grid-column-end: 5;
				text-align: right;
				background-color: transparent;
				border: 1px solid white;
				height: 40px;
				border-top: none;
				font-size: 30px;
				color: white;
				width: 493px;
				margin-bottom: 5px;
				color: lightgrey;
			}
			.inp:active {
				border: 1px solid cyan;
				border-top:
			}
			.no{
				border: none;
				color: white;
				width: 120px;
				height: 60px;
				font-size: 20px;
				outline: none;
				cursor: pointer;
				background-color: rgb(20,21,20);
				margin-bottom: 5px;
			}
			.no:active{
				background-color: cyan;
			}
			.no:hover{
				background-image: linear-gradient(rgba(0,255,255,0.45), rgba(0,255,255,0.45));
			}
			.no:nth-child(19),.no:nth-child(21),.no:nth-child(3),.no:nth-child(4),.no:nth-child(5),.no:nth-child(6),.no:nth-child(10),.no:nth-child(14),.no:nth-child(18),.no:nth-child(22){
				background-color: rgb(51,57,51)
			}	.no:nth-child(19):active,.no:nth-child(21):active,.no:nth-child(3):active,.no:nth-child(4):active,.no:nth-child(5):active,.no:nth-child(6):active,.no:nth-child(10):active,.no:nth-child(14):active,.no:nth-child(18):active,.no:nth-child(22):active{
				background-color: #ffc107
			}	.no:nth-child(19):hover,.no:nth-child(21):hover,.no:nth-child(3):hover,.no:nth-child(4):hover,.no:nth-child(5):hover,.no:nth-child(6):hover,.no:nth-child(10):hover,.no:nth-child(14):hover,.no:nth-child(18):hover,.no:nth-child(22):hover{
				background-image: linear-gradient(rgba(255,193,7,0.45), rgba(255,193,7,0.45));
			}
			
		</style>
	</head>
	<body>
		<%@ page import="javax.script.ScriptEngine, javax.script.ScriptEngineManager ,javax.script.ScriptException"%>
		<%
			class clock{
				String expression;
				public clock(String expression){
					this.expression = expression;
				}
				public Object Calculate(){
		
					ScriptEngine engine = new ScriptEngineManager().getEngineByExtension("js");
		
					try {
						// Evaluate the expression
						Object result = engine.eval(expression);
 
						return (result);
					}
					catch (ScriptException e) {
						// If there is an error
						e.printStackTrace();
						return null;
					}
				}
			}
			%>
		<form method="GET" class="calc">
			<input type="text" name="inpu" class="inp" value="<%out.println(fn);%>"></input>
			<div name="outpu" class="output" >
			<%
				
				clock c = new clock(fn);
				out.println(c.Calculate());
				
			%>
			</div>
			<button class="no" onclick="dela()" type="button">CE</button>
			<button class="no" onclick="dela()" type="button">C</button>
			<button class="no" onclick="delo()" type="button"><</button>
			<button class="no" onclick="put('/')" type="button">/</button>
			<button class="no" onclick="put(7)" type="button">7</button>
			<button class="no" onclick="put(8)" type="button">8</button>
			<button class="no" onclick="put(9)" type="button">9</button>
			<button class="no" onclick="put('*')" type="button">x</button>
			<button class="no" onclick="put(4)" type="button">4</button>
			<button class="no" onclick="put(5)" type="button">5</button>
			<button class="no" onclick="put(6)" type="button">6</button>
			<button class="no" onclick="put('-')" type="button">-</button>
			<button class="no" onclick="put(1)" type="button">1</button>
			<button class="no" onclick="put(2)" type="button">2</button>
			<button class="no" onclick="put(3)" type="button">3</button>
			<button class="no" onclick="put('+')" type="button">+</button>
			<button class="no" onclick="khathar()" type="button">&plusmn;</button>
			<button class="no" onclick="put(0)" type="button">0</button>
			<button class="no" onclick="put('.')" type="button">.</button>
			<button class="no" >=</button>
		</form>
		<font color="white"><p id="deom"></p></font>
		<font color="white"><p><% out.println("Hi my name is Amey Burgul"); %>
		<% 
			out.println("Expression: "+fn);
		%></p></font>
		<script>
			function check(f){
				if(f=='1'||f=='2'||f=='3'||f=='4'||f=='5'||f=='6'||f=='7'||f=='8'||f=='9'||f=='0'||f=='('||f==')')
					return true;
				else
					return false;
			}
			function put(a){
				var f = document.querySelector('.inp').value;
				f = f.charAt(--f.length);
				if(!(check(a))){
					if((a=='-')&&(f==""))
						document.querySelector('.inp').value = a;
					if(check(f))
						document.querySelector('.inp').value += a;
				}
				else
					document.querySelector('.inp').value += a;
			}
			function dela(){
				document.querySelector('.inp').value = "";
			}
			function delo(){
				var a = document.querySelector('.inp').value;
				document.querySelector('.inp').value = a.substring(0,--a.length);
			}
			function khathar(){
				var d = document.querySelector('.inp').value;
				var c = d.length;
				if((d.charAt(0) == '-')){
					if((d.charAt(c-1) == ')')&&(d.charAt(1)=='('))
						document.querySelector('.inp').value = d.substring(2,c-1);
					else
						document.querySelector('.inp').value = d.substring(1,c);
				}
				else
					document.querySelector('.inp').value = "-("+d+")";
			}
			function submit1(fuck){
				document.getElementById("deom").innerHTML = fuck;
			}
		</script>
	</body>
</html>