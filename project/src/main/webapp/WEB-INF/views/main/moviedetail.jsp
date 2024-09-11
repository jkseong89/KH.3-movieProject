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

    <div id="contents_new23">
        <form id="movieForm" method="POST" action="/updateMovieInfo">
	    	<div id="contents" class="contents_movie_detail">
	    		<div class="poster_info">
	    			<img alt="영화상세" src="${movie.mo_image }">
	    		</div>
	    		<div class="detail_top_wrap new22">
	    			<div class="tit_info">
	    				<strong id="movieTitle">${movie.mo_title }</strong>
	    			</div>
	    			<ul class="mov_info1">
	    				<li><span id="releaseDate"><fmt:formatDate value="${movie.mo_date }" pattern="yyyy-MM-dd"/></span> <!-- 개봉일 --></li>
	    				<li><span id="duration">${movie.mo_time }</span> "분" <!-- 상영시간 --></li>
	    				<li><span id="ageRating">${movie.mo_age }</span> "세" <!-- 시청 가능 연령 --></li>
	    			</ul>
	    			<div class="txtarea_box movdetailtxt" id="movieDescription">
	    				<div class="txtarea">
	    					<span>${movie.mo_content }
	    					</span>
	    				</div>
	    			</div>
	  				<div style="text-align: right;">
	    				<a href="#" class="button">예매하기</a>
	    			</div>
	    		</div>
	    	</div>	
	  		<div class="tab_con">
	  			<div class="innerfull gray">
	  				<div class="inner980">
	  					<div class="movi_tab_info1">
	  						<h4 class="tit_info_type1">영화정보</h4>
	  						<ul class="detail_info2">
                                <li><em>장르</em><span id="genre">액션</span></li>
                                <li><em>감독</em><span id="director">감독이름</span></li>
                                <li><em>출연</em><span id="actors">배우이름</span></li>
	  						</ul>
	  						<!-- 영화정보 관리자 로그인 시에만 보이는 수정 버튼 -->
	  						 <div style="text-align: right;">
	       							<button id="editInfoBtn" class="button">정보 수정</button>
	       							<button type="submit" id="saveInfoBtn" class="button" style="display:none;">저장하기</button>
	    						<c:if test="${isAdmin}">
	    						</c:if>
	    					</div>
	  					</div>
	  				</div>
	  			</div>
	  		</div>
  		</form>
   </div>
   
    <!-- JavaScript 코드 -->
    <script>
    $(document).ready(function() {
        const fieldsToEdit = ['movieTitle', 'releaseDate', 'duration', 'ageRating', 'movieDescription', 'genre', 'director', 'actors'];

        // 수정 버튼 클릭 시
        $('#editBtn, #editInfoBtn').on('click', function() {
            fieldsToEdit.forEach(function(id) {
                const $element = $('#' + id);
                const currentValue = $element.text();

                if (id === 'movieDescription') {
                    $element.html(`<textarea name="${id}" rows="5">${currentValue}</textarea>`);
                } else {
                    $element.html(`<input type="text" name="${id}" value="${currentValue}" />`);
                }
            });

            $('#editBtn, #editInfoBtn').hide();
            $('#saveBtn, #saveInfoBtn').show();
        });

        // 폼 서브밋 처리
        $('#movieForm').on('submit', function(event) {
            event.preventDefault(); // 폼 제출 방지

            const formData = $(this).serialize(); // 폼 데이터 직렬화

            // Ajax 요청을 통해 서버로 전송
            $.ajax({
                type: 'POST',
                url: '/updateMovieInfo',
                data: formData,
                success: function(response) {
                    fieldsToEdit.forEach(function(id) {
                        const $element = $('#' + id);
                        const newValue = $(`[name="${id}"]`).val();
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
        });
    });
    </script>
</body>
</html>