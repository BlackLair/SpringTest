<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myGame item wiki</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap" class="bg-dark">
		<header class="d-flex align-items-center justify-content-around">
			<div class="logo">
				<a href="/myGameWiki/home" class="h1 text-danger">myGameWiki</a>
			</div>
			<div>
				<form method="get" action="#">
					<div class="input-group">
					<input type="text" class="form-control" id="input-search">
					<div class="input-group-append">
						<button class="btn btn-outline-none" type="submit">검색</button>
					</div>
				</div>
				</form>
				
			</div>
		</header>
		<nav class="bg-warning">
			<div>
				<ul class="nav nav-fill">
					<li class="nav-item"><a href="#" class="nav-link">전체보기</a></li>
					<li class="nav-item"><a href="#" class="nav-link">무기</a></li>
					<li class="nav-item"><a href="#" class="nav-link">방어구</a></li>
					<li class="nav-item"><a href="#" class="nav-link">소모품</a></li>
					<li class="nav-item"><a href="#" class="nav-link">귀중품</a></li>
					<li class="nav-item"><a href="#" class="nav-link">기타</a></li>
				</ul>
			</div>
		</nav>
		<section>
		</section>
		<footer></footer>
	</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>