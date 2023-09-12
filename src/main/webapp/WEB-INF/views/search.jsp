<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

/* CSS 부분 */
#recentSearchValues {
  display: flex;
  flex-wrap: wrap; /* Allow items to wrap to a new line when there's not enough space */
  gap: 5px; /* Add some gap between each search item */
  align-items: center;
  padding: 5px;
  margin-bottom: 10px;
}

#recentSearchValues div {
  display: flex;
  align-items: center;
  background-color: #f0f0f0;
  padding: 5px 15px;
  border-radius: 20px;
}

#recentSearchValues span {
 font-size: 13px;
  margin-right: 5px;
}

.delete-search-value {

  border: none;
  cursor: pointer;
  font-size:10px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
  color: gray;
}

/* 마우스 호버 시 스타일 변경 */
.delete-search-value:hover {
	color: darkorange;
}

#deleteAllValues{
	cursor: pointer;
}


</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  const modalSearch = document.getElementById("modalSearch");
	  const searchInput = document.getElementById("search");
	  const searchBtn = document.getElementById("searchBtn");
	  const recentSearchValues = document.getElementById("recentSearchValues");
	  const deleteBtn = document.getElementById("deleteAllValues");
	  
	  // 모달 열릴 때, 검색어를 입력하는 input에 포커스
	  modalSearch.addEventListener("shown.bs.offcanvas", function() {
	    searchInput.focus();
	  });

	  //저장된게 있을 때만 최근검색어 보여주기
	  function toggleRecentSearchVisibility() {
		    const searchHistory = getSearchHistory();
		    const searchHeader = document.getElementById("searchHeader");
		    if (searchHistory.length > 0) {
		    	searchHeader.style.display = "block"; 

		    } else {
		    	searchHeader.style.display = "none"; 
		    }
		  }
	 
	  
	  // 로컬 스토리지에서 저장된 검색어 배열을 가져오는 함수
	  function getSearchHistory() {
	    const searchHistoryJSON = localStorage.getItem("searchHistory");
	    //console.log(searchHistoryJSON);
	    return searchHistoryJSON ? JSON.parse(searchHistoryJSON) : [];
	  }

	  
	  
	  
	  // 로컬 스토리지에 검색어 배열을 저장하는 함수
	  function saveSearchHistory(searchHistory) {
	    localStorage.setItem("searchHistory", JSON.stringify(searchHistory));
	  }
	  
	  
	  // 검색어를 화면에 출력하는 함수
	  function renderSearchHistory(searchHistory) {
	    recentSearchValues.innerHTML = ""; // 기존 검색어를 모두 삭제
	    for (const searchItem of searchHistory) {
	      const span = document.createElement("span");
	      span.textContent = searchItem;
	      
	      const deleteButton = document.createElement("button");
	      deleteButton.textContent = "X";
	      deleteButton.className = "delete-search-value";
	      deleteButton.addEventListener("click", function() {
	        deleteSearchItem(searchItem);
	      });

	      // 검색어와 삭제 버튼을 함께 추가
	      const searchItemDiv = document.createElement("div");
	      searchItemDiv.appendChild(span);
	      searchItemDiv.appendChild(deleteButton);

	      recentSearchValues.appendChild(searchItemDiv);
	      
	      const searchHeader = document.getElementById("searchHeader");
	      searchHeader.style.display = "block"; 
	     
	    }
	  }
	  
	  // 검색어를 로컬 스토리지에서 삭제하는 함수
	  function deleteSearchItem(searchItem) {
	    const searchHistory = getSearchHistory();
	    const updatedSearchHistory = searchHistory.filter((item) => item !== searchItem);
	    const searchHeader = document.getElementById("searchHeader");
	    saveSearchHistory(updatedSearchHistory);
	    renderSearchHistory(updatedSearchHistory);
	    
	    
	    if (updatedSearchHistory.length === 0) {
	        searchHeader.style.display = "none";
	        }
	 
	  }
	  
	  


	  // 검색어를 입력하는 input 요소에 Enter 키가 눌렸을 때의 이벤트를 처리
	  searchInput.addEventListener("keyup", function(event) {
	    if (event.keyCode === 13) {
	      const searchValue = searchInput.value.trim(); // 입력된 검색어 양 옆의 공백 제거
	      
	      if (searchValue) {
	        // 로컬 스토리지에서 검색어 배열 가져오기
	        const searchHistory = getSearchHistory();
			// 만약에 searchValue가 searchHistory 안에 없다면!!! 검색어 배열에 새로운 검색어 추가
	          if (!searchHistory.includes(searchValue)) {
	        	  // 검색어 배열의 맨 앞에 새로운 검색어 추가
	              searchHistory.unshift(searchValue);
	              searchInput.value ="";
	              // 로컬 스토리지에 검색어 배열 저장
	              saveSearchHistory(searchHistory);
	              renderSearchHistory(searchHistory);
         		}
			
	      }
	    }
	  });

	  // "searchBtn"이라는 버튼이 클릭되었을 때의 이벤트를 처리
	  searchBtn.addEventListener("click", function(event) {
	    // 폼의 기본 동작인 submit을 방지하기 위해 preventDefault()를 호출
	    event.preventDefault();
	    const searchValue = searchInput.value.trim(); // 입력된 검색어 양 옆의 공백 제거
	    if (searchValue) {
	      // 로컬 스토리지에서 검색어 배열 가져오기
	      const searchHistory = getSearchHistory();

	      if (!searchHistory.includes(searchValue)) {
	     	  // 검색어 배열의 맨 앞에 새로운 검색어 추가
              searchHistory.unshift(searchValue);
              searchInput.value ="";
  			  saveSearchHistory(searchHistory);
  			  renderSearchHistory(searchHistory);
  			 }
	    }
	  });
	  
	  
	  deleteBtn.addEventListener("click", function(event) {
		  // 로컬 스토리지 저장 내역 전체 삭제
	    const searchHeader = document.getElementById("searchHeader");
	    	searchHeader.style.display = "none";
		  localStorage.removeItem("searchHistory");
		  renderSearchHistory([]);
		  
		
		});

	  
	  const initialSearchHistory = getSearchHistory();
	  renderSearchHistory(initialSearchHistory);
	  toggleRecentSearchVisibility();
	});

  


	
	
</script>
<!-- Search -->
<div class="offcanvas offcanvas-end" id="modalSearch" tabindex="-1"
	role="dialog" aria-hidden="true">

	<!-- Close -->
	<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
		aria-label="Close">
		<i class="fe fe-x" aria-hidden="true"></i>
	</button>
	<!-- Body: Form -->
	<div class="offcanvas-body mt-5">
		<form>
			<div class="input-group input-group-merge">
				<input id="search" class="form-control" type="search" placeholder="검색어를 입력해주세요">
				<div class="input-group-append">
					<button id ="searchBtn" class="btn btn-outline-border" type="submit">
						<i class="fe fe-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

	<!-- Body: Results (add `.d-none` to disable it) -->
	<div class="offcanvas-body border-top fs-sm">

		<!-- Heading -->
		<div id="searchHeader" style="display : none; ">
			<span style="color:gray">최근검색어</span>
			<span id="deleteAllValues" style="color:blue; font-size: 12px; font-weight: 200; float: right;">전체삭제</span>
		</div>
		
		
		<div id="recentSearchValues">
		<!-- 최근 검색어 나열... -->
		</div>
		
		

		<p>인기검색어</p>
		<p>1 기부</p>
		<p>2 봉사</p>
		<p>3 증명서</p>

	</div>
</div>
