<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 등록</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* 기존 페이지의 스타일을 여기에 추가 */
html, body {
    height: 100%;
    margin: 0;
}
.main-content {
    flex: 1;
	}
body {
    font-family: 'Noto Sans', Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #ffffff;
    color: #333333;
    padding-top: 80px;
}

/* 네비게이션 바 */
.navbar {
    background-color: #ffffff;
    border-bottom: 1px solid #e0e0e0;
    position: fixed;
    width: 100%;
    top: 0;
    left: 0;
    z-index: 1000;
    display: flex;
    justify-content: space-between; /* 로고와 메뉴를 양쪽 끝에 배치 */
    align-items : center;
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
    gap: 20px; /* 메뉴 아이템 사이의 간격 */
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
/* 반응형 디자인 */
@media (max-width: 768px) {
    .navbar {
        flex-direction: column;
        align-items: flex-start;
    }

    .movie-grid {
        grid-template-columns: 1fr;
    }
}
.footer {
    background-color: #333333;
    color: #ffffff;
    text-align: center;
    padding: 20px 0;
    /* position: fixed; */ /* 고정 위치 속성 삭제 */
    bottom: 0; /* 고정 위치 관련 속성 삭제 */
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
.form-group textarea {
    width: 100%; /* 너비를 부모 요소에 맞게 */
    padding: 10px; /* 여백을 추가해서 가독성을 높임 */
    border-radius: 5px; /* 모서리 둥글게 */
    border: 1px solid #ccc; /* 기본 테두리 */
    font-size: 16px; /* 폰트 크기 설정 */
    resize: none; /* 사용자가 크기 조정 불가 */
}

.form-group label {
    font-weight: bold;
    font-size: 18px;
    margin-bottom: 10px;
    display: block;
}
    </style>
</head>
<body>
  <!-- 네비게이션 바 -->
    <nav class="navbar">
        <div class="logo">
            <a href="<c:url value='/khcinema/'/>">KH CINEMA</a>
        </div>
		<div class="menu">
    		<!-- 비로그인 상태에서 회원가입과 로그인 버튼 표시 -->
    			<c:if test="${!isLoggedIn}">
        			<a href="#">회원가입</a>
        			<a href="#">로그인</a>
    			</c:if>    
   		 	<!-- 로그인 상태에서 로그아웃 버튼 표시 -->
    			<c:if test="${isLoggedIn}">
        			<a href="#">로그아웃</a>
    			</c:if>    
    		<!-- 관리자 로그인 시 영화 등록 버튼 표시 -->
    			<c:if test="${isAdmin}">
        			<a href="#">영화 등록</a>
    			</c:if>
		</div>
    </nav>
    <div class="container mt-4">
        <h1>영화 등록</h1>
        <form action="/movie/register" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">영화 제목:</label>
                <input type="text" class="form-control" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="releaseDate">개봉일:</label>
                <input type="date" class="form-control" id="releaseDate" name="releaseDate" required>
            </div>
            <div class="form-group">
                <label for="duration">상영시간 (분):</label>
                <input type="number" class="form-control" id="duration" name="duration" required>
            </div>
            <div class="form-group">
                <label for="viewableage">시청가능 연령:</label>
                <input type="number" class="form-control" id="viewableage" name="viewableage" required>
            </div>
			<div class="form-group">
			    <label for="story">줄거리:</label>
			    <textarea class="form-control" id="story" name="story" rows="5" required></textarea>
			</div>
            <div class="form-group">
                <label for="genre">장르:</label>
                <input type="text" class="form-control" id="genre" name="genre" required>
            </div>
            <div class="form-group">
                <label for="director">감독:</label>
                <input type="text" class="form-control" id="director" name="director" required>
            </div>
            <div class="form-group">
                <label for="cast">출연:</label>
                <input type="text" class="form-control" id="cast" name="cast" required>
            </div>
            
            <div class="form-group">
                <label for="poster">포스터 이미지:</label>
                <input type="file" onchange="readURL(this);" class="form-control-file" id="poster" name="poster" required>
            </div>
            <div class="form-group">
  			<img id="posterPreview" src="" alt="포스터 미리보기" style="width: 200px; height: auto;" />
			</div>
            <div class="form-group d-flex justify-content-end">
    			<button type="submit" class="btn btn-primary">저장</button>
			</div>
        </form>
    </div>
    <footer class="footer">
    <div class="footer-content">
        <p>Team Members:</p>
        <ul class="team-list">
            <li>성재경</li>
            <li>이현호</li>
            <li>장경민</li>
            <li>박광균</li>
        </ul>
    </div>
</footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    function readURL(input) {
    	  if (input.files && input.files[0]) {
    	    var file = input.files[0];
    	    if (file.type.match('image.*')) {
    	      var reader = new FileReader();
    	      reader.onload = function(e) {
    	        document.getElementById('posterPreview').src = e.target.result;
    	      };
    	      reader.readAsDataURL(file);
    	    } else {
    	      alert("이미지 파일을 선택해주세요.");
    	      document.getElementById('posterPreview').src = "";  // 이미지 초기화
    	    }
    	  } else {
    	    document.getElementById('posterPreview').src = "";
    	  }
    	}
    </script>
</body>
</html>