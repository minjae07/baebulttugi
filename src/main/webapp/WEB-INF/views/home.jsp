<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>배불뚝이</title>
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
<div class="container-fluid" "background-color:#2196F3;color:#fff;height:220px;">
  <h1>Scrollspy & Affix Example</h1>
  <h3>아이를 품고 있는 산모에게 필요한 제품과 정보를 제공하는 쇼핑몰 겸 커뮤니티 사이트</h3>
  <p>그동안 온라인 상에는 아기와 출산한 산모들에게 도움되는 사이트가 주로 존재했습니다.</p>
  <p> 미래를 꿈꾸며 아이를 품고 있는 산모들을 위해, 사랑하는 아내를 생각하는 아빠들을 위해 이 사이트를 개발하고자 합니다</p>
</div>
<br> 

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
        <p class="lead mb-0" ><p>여성들의 임신, 출산, 육아는 매우 중요한 삶의 단계입니다. 하지만 이러한 과정은 불안하고 힘든 경험일 수도 있습니다. 이러한 상황에서, 많은 산모들이 불안, 걱정, 혼란 등을 느낄 수 있습니다. 따라서, 저희는 산모들이 좀 더 쉽고 편리하게 정보와 상호작용을 할 수 있는 플랫폼을 만들고자 하였습니다.</p>
<p>저희가 진행한 시장조사에서, 많은 임신, 출산, 육아에 관련된 정보가 널리 퍼져있기는 하지만, 이러한 정보가 종종 불완전하거나 모호하게 전달되는 경우가 많았습니다. 또한, 현실적인 조언과 경험을 공유하는 지역 사회의 역할이 크게 축소되면서, 산모들은 정보와 지원을 얻기 위해서는 대개 인터넷을 통해 검색하거나, 친구나 가족에게 물어보는 식으로 자신들만의 방법으로 해결하고자 했습니다.</p>
<p>이에 따라, 저희는 산모들이 쉽고 편리하게 필요한 정보를 찾을 수 있는 플랫폼을 만들고자 하였습니다. 이를 위해, 임신, 출산, 육아에 관한 다양한 정보를 수집하여 제공하고, 전문가들의 조언과 경험을 나눌 수 있는 커뮤니티 기능을 제공하려고 합니다. 또한, 산모들이 필요한 상품들을 쉽게 구매할 수 있는 쇼핑몰 기능도 함께 제공합니다.</p>
<p>이러한 플랫폼을 통해, 산모들은 불안하고 힘든 경험을 공유하고, 서로 지원하며, 필요한 정보와 상품을 쉽게 얻을 수 있을 것으로 기대합니다. 이를 통해, 산모들의 건강과 행복한 육아 생활을 돕고자 하는 저희의 목표를 달성할 수 있을 것입니다.</p>
      </div>
      <div id="section2"> 
      <br><br><br><br><br><br>
        <h1>업데이트 정보</h1>
        
               <p class="lead mb-0" >220720 ver1. mainPage UI 구성(이지후)</p>
               <p class="lead mb-0" >220815 ver2. 쇼핑몰 업데이트</p>
      </div>        
      <div id="section3">
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
       	<p>test</p>
      </div>
    </div>
  </div>
</div>
</body>
</html>
