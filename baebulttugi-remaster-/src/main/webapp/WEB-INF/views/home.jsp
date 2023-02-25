<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    position: relative;
  }
  .affix {
    top: 20px;
    z-index: 9999 !important;
  }
  div.col-sm-9 div {
    height: 250px;
    max-width: 800px;
    min-width: hi
    font-size: 28px;
  }
  
  @media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
      margin-left: 150px;
    }
  }
  </style>

</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="15">
<!-- <div class="container-fluid" "background-color:#2196F3;color:#fff;height:220px;">
  <h1>Scrollspy & Affix Example</h1>
  <h3>아이를 품고 있는 산모에게 필요한 제품과 정보를 제공하는 쇼핑몰 겸 커뮤니티 사이트</h3>
  <p>그동안 온라인 상에는 아기와 출산한 산모들에게 도움되는 사이트가 주로 존재했습니다.</p>
  <p> 미래를 꿈꾸며 아이를 품고 있는 산모들을 위해, 사랑하는 아내를 생각하는 아빠들을 위해 이 사이트를 개발하고자 합니다</p>
</div>
<br> -->

<div class="container">
  <div class="row">
    <nav class="col-sm-3" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top="780">
        <li><a href="#section1">개발 배경</a></li>
        <li><a href="#section2">업데이트 정보</a></li>
        <li><a href="#section3">개발자 정보</a></li>
      </ul>
    </nav>
    <div class="col-sm-9">
      <div id="section1" class="visible-md visible-lg">    
        <h1>개발 배경</h1>
        <p class="lead mb-0" >육아관련 사이트를 만들기 위해 시장 조사를 하던 중, 산모만을 위한 사이트는
                  찾아보기가 어렵다는 것을 느꼈습니다. 따라서 저희는 임신과 관련된 정보가 모아져 있는 사이트를 만들기로 하였습니다.</p>
      </div>
      <div id="section2"> 
        <h1>업데이트 정보</h1>
               <p class="lead mb-0" >220720 ver1. mainPage UI 구성(이지후)</p>
               <p class="lead mb-0" >220815 ver2. 쇼핑몰 업데이트</p>
      </div>        
      <div id="section3">
       	<p>test</p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
