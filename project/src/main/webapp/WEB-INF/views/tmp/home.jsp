<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style type="text/css">
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

/* 영화 카드 레이아웃 */
.movie-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    padding: 10px;
}

.movie-card {
    background-color: #ffffff;
    border: 1px solid #e0e0e0;
    border-radius: 5px;
    overflow: hidden;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s, box-shadow 0.2s;
    position: relative; /* 부모 요소를 relative로 설정 */
    display: flex;
    flex-direction: column; /* 세로 정렬 */
}

.movie-card img {
    width: 100%;
    height: auto;
}

.movie-card .content {
    padding: 15px;
    position: absolute; /* 하단 고정을 위해 absolute 사용 */
    bottom: 0; /* 부모 요소의 하단에 고정 */
    width: 100%; /* 전체 너비 사용 */
    background: rgba(255, 255, 255, 0.9); /* 배경색을 약간 투명하게 설정 */
    box-sizing: border-box; /* 패딩을 포함한 크기 조정 */
}

.movie-card h3 {
    margin: 0;
    font-size: 1.2em;
    color: #333333;
}

.movie-card p {
    margin: 5px 0;
    font-size: 0.9em;
    color: #777777;
}

.movie-card:hover {
    transform: translateY(3px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);

}

/* 버튼 스타일 */
.button {
    display: inline-block;
    padding: 10px 20px;
    background-color: #e71a0f;
    color: #ffffff;
    text-align: center;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
    transition: background-color 0.2s;
}

.button:hover {
    background-color: #d0170c;
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
.movie-carousel {
   position: relative;
    width: 100%;
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    overflow: hidden;
    margin-bottom: 50px; /* 푸터와의 공간을 위한 하단 여백 */
}

.carousel-wrapper {
    overflow: hidden;
    width: 70%; /* 캐러셀이 화면의 70% 너비를 차지하도록 설정 */
}

.carousel {
      display: flex;
    transition: transform 0.5s ease-in-out;
}

.movie-card {
    flex: 0 0 33.3333%; /* 3개씩 표시하기 위해 각 카드의 너비를 33.3333%로 설정 */
    box-sizing: border-box;
    margin: 0 10px; /* 카드 간의 간격을 위해 좌우 마진 추가 */
}

/* 캐러셀 컨트롤 버튼 */
.carousel-control {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: #ffffff;
    border: none;
    padding: 10px;
    cursor: pointer;
    z-index: 10;
}

.carousel-control.prev {
    left: 10px;
}

.carousel-control.next {
    right: 10px;
}

.carousel-control:hover {
    background-color: rgba(0, 0, 0, 0.8);
}
.BOXOFFICE {
	text-align: center; /* 텍스트 중앙 정렬 */
    font-size: 3em; /* 텍스트 크기 크게 */
    font-weight: bold; /* 텍스트 굵게 */
    margin: 20px 0px; /* 위아래로 공간 확보 */
    color: #000000; /* 텍스트 색상 (필요에 따라 변경 가능) */
}
</style>
</head>
<body>
    <!-- 메인 콘텐츠 -->
    <div class="main-content">
        <div class="BOXOFFICE">
            <p>BOX OFFICE</p>
        </div>
    <!-- 영화 목록 -->
    <section class="movie-carousel">
    <div class="carousel-wrapper">
        <div class="carousel">
            <c:forEach var="movie" items="${list}">
		    <div class="movie-card">
		        <!-- 영화 상세 페이지 링크에 mo_num 삽입 -->
		        <a href="<c:url value='/main/moviedetail?mo_num=${movie.mo_num}'/>">
		            <!-- 포스터 이미지 삽입 -->
		            <img src="${movie.mo_image }" alt="영화 포스터 ${movie.mo_num}">
		        </a>
		        <div class="content">
		            <!-- 영화 제목 삽입 -->
		            <h3>${movie.mo_title}</h3>
		            <!-- 영화 장르와 개봉일 삽입 -->
		            <p>${movie.mo_genre} | <fmt:formatDate value="${movie.mo_date }" pattern="yyyy-MM-dd"/></p>
		            <!-- 예매하기 링크에 mo_num 삽입 -->
		            <a href="#" class="button">예매하기</a>
		        </div>
		    </div>
</c:forEach>
        </div>     
    </div>
    <button class="carousel-control prev">‹</button>
    <button class="carousel-control next">›</button>
</section>
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
<script>
const carousel = document.querySelector('.carousel');
const prevButton = document.querySelector('.carousel-control.prev');
const nextButton = document.querySelector('.carousel-control.next');
const cardWidth = document.querySelector('.movie-card').offsetWidth + 20; // 카드 너비 + 간격
const visibleCards = 3; // 화면에 보이는 카드 개수
let currentIndex = 0;

function updateCarousel() {
    const translateXValue = -currentIndex * cardWidth; // 카드 너비에 맞게 슬라이드
    carousel.style.transform = `translateX(\${translateXValue}px)`;
}

prevButton.addEventListener('click', () => {
    if (currentIndex > 0) {
        currentIndex--;
        updateCarousel();
    }
});

nextButton.addEventListener('click', () => {
    if (currentIndex < carousel.children.length - visibleCards) { // 카드가 3개씩 보일 때
        currentIndex++;
        updateCarousel();
    }
});

// 초기화 시 캐러셀 위치 설정
updateCarousel();
</script>
</body>
</html>
