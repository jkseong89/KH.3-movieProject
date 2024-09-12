<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세</title>
<style type="text/css">
/*     .navbar {
    background-color: #ffffff;
    border-bottom: 1px solid #e0e0e0;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px 30px;
    box-sizing: border-box;
    height: 80px;
}
.navbar .logo a {
    font-size: 1.5em;
    font-weight: bold;
    color: #333333;
    text-decoration: none;
}

.navbar .menu {
    display: flex;
    gap: 20px;
}

.navbar .menu a {
    color: #333333;
    text-decoration: none;
    padding: 10px;
    font-weight: bold;
}

.navbar .menu a:hover {
    color: #e71a0f;
}
.navbar a {
    color: #333333;
    text-decoration: none;
    padding: 10px;
    font-weight: bold;
}

.navbar a:hover {
    color: #e71a0f;
}
// 버튼 스타일 
.footer {
    background-color: #333333;
    color: #ffffff;
    text-align: center;
    padding: 20px 0;
    //position: fixed; //고정 위치 속성 삭제 
    position: relative;
    transform: translateY(-100%);
    bottom: 0; //고정 위치 관련 속성 삭제
    width: 100%;
    border-top: 1px solid #e0e0e0;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.footer p {
    margin: 0;
    font-size: 1.2em;
    font-weight: bold;
}

.team-list {
    list-style: none;
    padding: 0;
    margin: 10px 0 0 0;
}

.team-list li {
    display: inline;
    margin: 0 10px;
    font-size: 1em;
    font-weight: normal;
}
 */
/* 기본적인 레이아웃 */
#contents_new23 {
    width: 100%;
    max-width: 1200px;
    margin: 100px auto; /* 네비게이션 바 아래 공간 추가 */
    padding: 20px;
    font-family: Arial, sans-serif;
    color: #333;
    height: 100%;
}

#contents {
    display: flex;
    flex-direction: row;
    background-color: #fff;
    border: 1px solid #ddd;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.poster_info {
    flex: 1;
    margin-right: 20px; /* 이미지와 오른쪽 내용 사이에 공간 추가 */
}

.poster_info img {
    width: 100%;
    max-width: 300px;
    display: block;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.detail_top_wrap {
    flex: 2;
}

.tit_info strong {
    font-size: 24px;
    font-weight: bold;
    color: #000;
    margin-bottom: 10px;
    display: block;
}

.mov_info1 {
    display: flex;
    gap: 10px; /* 항목 사이에 간격 추가 */
    align-items: center;
    font-size: 16px;
    margin-bottom: 20px;
    list-style-type: none; /* 기본 점 제거 */
}
.mov_info1 li span {
    margin-right: 10px; /* 각 span 요소 사이에 간격 추가 */
}
.mov_info1 li:last-child::after {
    content: ''; /* 마지막 항목에는 구분 기호 없앰 */
}
.mov_info1 li {
    display: flex;
    align-items: center;
}
.txtarea_box {
    margin-top: 20px;
}

.txtarea span {
    font-size: 16px;
    line-height: 1.6;
    color: #444;
}

.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #ff5500;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
    margin-top: 20px;
	text-align : right;
}

.button:hover {
    background-color: #ff3300;
}

/* 탭 스타일 */
.tab_con {
    margin-top: 40px;
}

.innerfull.gray {
    background-color: #f9f9f9;
}

.inner980 {
    max-width: 980px;
    margin: 0 auto;
}

.movi_tab_info1 h4 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
}

.detail_info2 {
    list-style: none;
    padding: 0;
    margin: 0;
    background-color: #fff;
    border: 1px solid #ddd; /* 테두리 추가 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
    padding: 20px;
}

.detail_info2 li {
    display: flex;
    justify-content: space-between;
    font-size: 16px;
    padding: 10px 0;
    border-bottom: 1px solid #ddd;
}

.detail_info2 li em {
    font-weight: bold;
    color: #333;
}

.detail_info2 li span {
    color: #666;
}
    /* 수정 버튼과 입력 필드 스타일 */
    .edit-input {
        padding: 10px;
        margin: 10px 0;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* 저장 버튼 스타일 */
    .button {
        display: inline-block;
        padding: 10px 20px;
        background-color: #ff5500;
        color: #fff;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
        margin-top: 20px;
        text-align: right;
        cursor: pointer;
        border: none;
        font-size: 16px;
    }

    .button:hover {
        background-color: #ff3300;
    }

    .button[disabled] {
        background-color: #ddd;
        cursor: not-allowed;
    }

    /* 입력 필드 및 버튼 컨테이너 */
    .form-container {
        margin-top: 20px;
        padding: 20px;
        background-color: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-group input {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
</style>
</head>
<body>
 <body>

    <div id="contents_new23">
     <form id="movieForm" method="POST" action="<c:url value="/main/moviedetail/update"/>">
    	<div id="contents" class="contents_movie_detail">
    		<div class="poster_info">
    			<img alt="영화상세" src="${movie.mo_image }">
    		</div>
    		<div class="detail_top_wrap new22">
    			<div class="tit_info">
    				<h1 id="mo_num" style="display: none">${movie.mo_num }</h1>
    				<strong id="mo_title">${movie.mo_title }</strong>
    			</div>
    			<ul class="mov_info1">
    				<li><span id="mo_date"><fmt:formatDate value="${movie.mo_date }" pattern="yyyy-MM-dd"/></span> <!-- 개봉일 --></li>
    				<li><span id="mo_time">${movie.mo_time }</span> "분" <!-- 상영시간 --></li>
    				<li><span id="mo_age">${movie.mo_age }</span> "세" <!-- 시청 가능 연령 --></li>
    			</ul>
    			<div class="txtarea_box movdetailtxt" id="mo_content">
    				<div class="txtarea">
    					<span>${movie.mo_content }
    					</span>
    				</div>
    			</div>
  				<div style="text-align: right;">
	  					<c:if test="${user != null}">
			          	  	<button type="submit" class="button" >예매하기</button>
   						</c:if>
			           	<input type="hidden" name="mo_num" value="${movie.mo_num}">
   				</div>
    		</div>
    	</div>
  		<div class="tab_con">
  			<div class="innerfull gray">
  				<div class="inner980">
  					<div class="movi_tab_info1">
  						<h4 class="tit_info_type1">영화정보</h4>
  						<ul class="detail_info2">
  							<li><em>장르</em><span id="mo_genre">${movie.mo_genre}</span></li>
  							<li><em>출연</em><span id="ch_name">배우</span></li>
  						</ul>
  						<!-- 영화정보 관리자 로그인 시에만 보이는 수정 버튼 -->
  						 <div style="text-align: right;">
                                    <button id="editInfoBtn" class="button" type="button">정보 수정</button>
                                    <button type="submit" id="saveInfoBtn" class="button saveInfoBtn" style="display:none;">저장하기</button>
    						<c:if test="${user.me_authority == 'ADMIN'}">
    						</c:if>
    					</div>
  					</div>
  				</div>
  			</div>
  		</div>
  	</form>
  </div>
   <!-- <footer class="footer">
        <div class="footer-content">
            <p>Team Members:</p>
            <ul class="team-list">
                <li>성재경</li>
                <li>이현호</li>
                <li>장경민</li>
                <li>박광균</li>
            </ul>
        </div>
    </footer> -->
        <!-- JavaScript 코드 -->
    <script>
    $(document).ready(function() {
        const fieldsToEdit = ['mo_num','mo_title', 'mo_date', 'mo_time', 'mo_age', 'mo_content'];

        // 수정 버튼 클릭 시
        $('#editBtn, #editInfoBtn').on('click', function() {
            fieldsToEdit.forEach(function(id) {
                const $element = $('#' + id);
                const currentValue = $element.text();

                if (id === 'mo_content') {
                    $element.html(`<textarea name="\${id}" rows="5">\${currentValue}</textarea>`);
                } else {
                    $element.html(`<input type="text" name="\${id}" value="\${currentValue}" />`);
                }
            });

            $('#saveBtn, #saveInfoBtn').show();
            $('#editBtn, #editInfoBtn').hide();
        });

        // 폼 서브밋 처리
        $('#movieForm').on('submit', function(event) {
            event.preventDefault(); // 폼 제출 방지
            
            console.log(event.target.classList.contains('saveInfoBtn'));
            
            if(event.target.id == 'saveInfoBtn') {                
                const movie = {}; // movie 객체 정의
                fieldsToEdit.forEach(function(id) {
                    const $element = $(`[name="\${id}"]`);
                    movie[id] = $element.val(); // 각 필드의 값을 JSON 객체에 저장
                });
                
                console.log(movie);
                
                // Ajax 요청을 통해 서버로 전송
                $.ajax({
                    type: 'POST',
                    url: '<c:url value="/main/moviedetail/update"/>',
                    data: JSON.stringify(movie), // JSON 문자열 전송
                    contentType: 'application/json; charset=utf-8', // 요청 헤더 설정
                    success: function(response) {
                        fieldsToEdit.forEach(function(id) {
                            const $element = $('#' + id);
                            const newValue = $(`[name="\${id}"]`).val();
                            $element.text(newValue); // 입력된 값을 텍스트로 변환
                        });

                        $('#editBtn, #editInfoBtn').show();
                        $('#saveBtn, #saveInfoBtn').hide();
                    },
                    error: function(err) {
                        console.error("Error:", err);
                        alert("저장 중 오류가 발생했습니다.");
                    }
                });
            }
        });
    });
    </script> 
</body>
</html>