<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false"%>
<html>
<head>
    <title>FAQ 게시판</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="resources/style.css">

</head>
<body>
    <div class="limiter">
    <div class="container-table100">
    <div class="wrap-table100">
    	<form id="searchForm" method="get" action="./search">
        <div class="search-area">
            <div class="wrap-select">
                <label class="select" for="slct">
                    <select id="slct" name="type">
                    <option value="" disabled="disabled" selected="selected">분류</option>
					<c:forEach var="type" items="${listType}">
        				<option value="${type.id}" ${type.id == typeId ? 'selected="selected"' : ''}>${type.name}</option>
    				</c:forEach>
                    </select>
                    <svg>
                    <use xlink:href="#select-arrow-down"></use>
                    </svg>
                </label>
                <!-- SVG Sprites-->
                <svg class="sprites">
                    <symbol id="select-arrow-down" viewbox="0 0 10 6">
                        <polyline points="1 1 5 5 9 1"></polyline>
                    </symbol>
                </svg>
            </div>
            <div class="wrap-search">
                <div class="search">
                   <input type="text" class="searchTerm" name="searchStr" value="${searchString}" placeholder="검색어를 입력하세요. (제목, 작성자에서 검색됩니다.)">
                   <button type="submit" class="searchButton">
                     <span>검색</span>
                  </button>
                </div>
            </div>
        </div>
        </form>
    <div class="table100">
    <table id="questionTable">
    <thead>
    <tr class="table100-head">
    <th class="column1">No.</th>
    <th class="column2">분류</th>
    <th class="column3">제목</th>
    <th class="column4">작성자</th>
    <th class="column5">작성일</th>
    <th class="column6">조회수</th>
    </tr>
    </thead>
    <tbody>
    	<c:forEach var="question" items="${listQuestion}" varStatus="status">
			<tr>
				<td>${question.id}</td>
				<td>${question.type.name}</td>
				<td><a href="./read?id=${question.id}">${question.title}</a></td>
				<td>${question.author}</td>
				<td><fmt:formatDate pattern = "yyyy.MM.dd" value = "${question.date}" /></td>
				<td class="count">${question.count}</td>
			</tr>
		</c:forEach>
    </tbody>
    </table>
    <div class="wrap-table100">
    	<div class="search-area">
    		<div class="page-numbers">
    			<c:forEach var="page" items="${listPages}" varStatus="status">
    				<c:if test="${status.index == 1 && pageNumber > 5}">
    						<span>...</span>
    				</c:if>
    				<c:if test="${status.index == 9 && page > (pageNumber + 5)}">
    						<span>...</span>
    				</c:if>
    				<c:choose>
					   <c:when test="${pageNumber == page}">
					   		<span>${page}</span>
					   </c:when> 
					   <c:otherwise>
					   		<a href="./?page=${page}">${page}</a>
					   </c:otherwise>   
					</c:choose>
    			</c:forEach>
    		</div>
             <button type="button" class="writeButton" id="writeButton">
                 <span>글쓰기</span>
             </button>
     	</div>
     </div>
    </div>
    </div>
	<div id="write_question" class="modal">
		<div class="modal_content">
			<button type="button" class="xButton" id="write_question_close_button">&#x2715;</button>
			<form:form method="POST" action="./saveQuestion" modelAttribute="question">
			<div class="search-area">
				<div class="wrap-select">
	                <label class="select" for="write_slct">
	                    <form:select required="required" id="write_slct" path="type.id">
	                    	<option value="" disabled="disabled" selected="selected">분류</option>
							<c:forEach var="type" items="${listType}">
	        					<option value="${type.id}">${type.name}</option>
	    					</c:forEach>
	                    </form:select>
	                    <svg>
	                    <use xlink:href="#select-arrow-down"></use>
	                    </svg>
	                </label>
	                <!-- SVG Sprites-->
	                <svg class="sprites">
	                    <symbol id="select-arrow-down" viewbox="0 0 10 6">
	                        <polyline points="1 1 5 5 9 1"></polyline>
	                    </symbol>
	                </svg>
	            </div>
				<form:input class="title" required="required" path="title" placeholder="제목"/>
			</div>
				<form:textarea class="content" required="required" path="content" placeholder="내용" />
				<form:input class="author" required="required" path="author" placeholder="작성자"/>
				<button type="submit" class="writeButton">등록</button>
			</form:form>
	    </div>
	    <div class="modal_layer"></div>
	</div>
	<div id="view_question" class="modal">
		<div class="modal_content">
			<button type="button" class="xButton" id="view_question_close_button">&#x2715;</button>
			<div class="search-area">
				<p class="view_type">${viewQuestion.type.name}</p>
	            <p class="title">${viewQuestion.title}</p>
			</div>
			<p class="content">${viewQuestion.content}</p>
			<div class="view-details">
				<p>${viewQuestion.author} &nbsp;&nbsp;|&nbsp;&nbsp;</p>
	            <p>${viewQuestion.date} &nbsp;&nbsp;|&nbsp;&nbsp;</p>
	            <p>${viewQuestion.count}</p>
			</div>
			<button type="button" class="writeButton" id="edit_question_button">수정</button>
	    </div>
	    <div class="modal_layer"></div>
	</div>
	<div id="edit_question" class="modal">
		<div class="modal_content">
			<button type="button" class="xButton" id="edit_question_close_button">&#x2715;</button>
			<form:form method="POST" action="./editQuestion" modelAttribute="question">
			<div class="search-area">
				<div class="wrap-select">
	                <label class="select" for="write_slct">
	                    <form:select required="required" id="write_slct" path="type.id">
	                    	<option value="" disabled="disabled" selected="selected">분류</option>
							<c:forEach var="type" items="${listType}">
	        					<option value="${type.id}" ${type.id == viewQuestion.type.id ? 'selected="selected"' : ''}>${type.name}</option>
	    					</c:forEach>
	                    </form:select>
	                    <svg>
	                    <use xlink:href="#select-arrow-down"></use>
	                    </svg>
	                </label>
	                <!-- SVG Sprites-->
	                <svg class="sprites">
	                    <symbol id="select-arrow-down" viewbox="0 0 10 6">
	                        <polyline points="1 1 5 5 9 1"></polyline>
	                    </symbol>
	                </svg>
	            </div>
				<form:input class="title" required="required" path="title" placeholder="제목" value="${viewQuestion.title}"/>
			</div>
				<form:textarea class="content" required="required" path="content" placeholder="내용" value="${viewQuestion.content}"/>
				<form:input class="author" required="required" path="author" placeholder="작성자" value="${viewQuestion.author}"/>
				<button type="submit" class="writeButton">등록</button>
			</form:form>
	    </div>
	    <div class="modal_layer"></div>
	</div>
	<div id="edit_question2" class="modal">
		<div class="modal_content">
			<form:form method="POST" action="./editQuestion" modelAttribute="question">
				<div class="wrap-select">
	                <label class="select" for="slct">
	                    <form:select id="slct" path="type.id">
	                    	<option value="" disabled="disabled" selected="selected">분류</option>
							<c:forEach var="type" items="${listType}">
	        					<option value="${type.id}" ${type.id == viewQuestion.type.id ? 'selected="selected"' : ''}>${type.name}</option>
	    					</c:forEach>
	                    </form:select>
	                    <svg>
	                    <use xlink:href="#select-arrow-down"></use>
	                    </svg>
	                </label>
	                <!-- SVG Sprites-->
	                <svg class="sprites">
	                    <symbol id="select-arrow-down" viewbox="0 0 10 6">
	                        <polyline points="1 1 5 5 9 1"></polyline>
	                    </symbol>
	                </svg>
	            </div>
				<table>
					<tr>
						<td><form:label path="title">제목</form:label></td>
						<td><form:input path="title" value="${viewQuestion.title}"/></td>
					</tr>
					<tr>
						<td><form:label path="content">내용</form:label></td>
						<td><form:input path="content" value="${viewQuestion.content}" /></td>
					</tr>
					<tr>
						<td><form:label path="author">작성자</form:label></td>
						<td><form:input path="author" value="${viewQuestion.author}" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Submit" /></td>
					</tr>
				</table>
			</form:form>
	       
	        <button type="button" class="writeButton" id="edit_question_close_button2">Cancel</button>
	       
	    </div>
	   
	    <div class="modal_layer"></div>
	</div>
    </div>
    </div>
    <script>
    if (window.location.href.indexOf("read") != -1) {
    	document.getElementById("view_question").style.display = "block";
    }
    document.getElementById("writeButton").onclick = function() {
    	document.getElementById("write_question").style.display = "block";
    }

    document.getElementById("write_question_close_button").onclick = function() {
    	document.getElementById("write_question").style.display = "none";
    }
    
    document.getElementById("view_question_close_button").onclick = function() {
    	document.getElementById("view_question").style.display = "none";
    }
    document.getElementById("edit_question_button").onclick = function() {
    	document.getElementById("view_question").style.display = "none";
    	document.getElementById("edit_question").style.display = "block";
    }
    document.getElementById("edit_question_close_button").onclick = function() {
    	document.getElementById("edit_question").style.display = "none";
    }

    </script>
    </body>
</html>