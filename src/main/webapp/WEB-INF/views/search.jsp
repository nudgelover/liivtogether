<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>

#autocomplete-results {
    padding: 10px 0;
    margin-left: 0.5px;
    top: 100%;
    position: absolute;
    width: calc(100% - 0.5px);
    max-height: 200px;
    overflow-y: auto;
    border-right: 1px solid #ccc;
    border-left: 1px solid #CCC;
    border-bottom: 1px solid #ccc;
    background-color: #fff;
    border-radius: 0 0 15px 15px;
    z-index: 100;
    display: none;
}


#autocomplete-results li {
    cursor: pointer;
    list-style: none;
    padding: 2px 10px;
    color: #424242;
}


#autocomplete-results li:hover {
  background-color: #f1f1f1;
}

#recentSearchValues {
	display: flex;
	flex-wrap: wrap;
	gap: 5px;
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
	cursor: pointer;
}

#recentSearchValues span {
	font-size: 13px;
	margin-right: 5px;
}

.delete-search-value {
	border: none;
	cursor: pointer;
	font-size: 10px;
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

#deleteAllValues {
	cursor: pointer;
}

.category{
	font-weight: bold;
	margin: 5px;
}

#searchResult li{
    list-style: none;
    margin: 3px;
}

#searchResult a{
    color: #424242 !important;
 
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
	      span.addEventListener('click', function() {
	    	    search(searchItem);
    	  });
	      
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
	  
	
	  // 검색어를 입력하는 input 요소에  자동완성기능 추가
	  searchInput.addEventListener("keyup", function(event) {
		  
		const autocompleteResults = document.getElementById('autocomplete-results');

		autocompleteResults.style.display = "block";
		
		const keyword = searchInput.value;
		console.log(keyword+"keyword");
        
		  if (keyword.length >= 2) {
			   $.ajax({
	                url: '/autocomplete', 
	                method: 'GET',
	        	    data: { keyword: keyword },
	                success: function(data) {
	                   	
                	  autocompleteResults.innerHTML = '';

                	  data.forEach(function(result) {
                		    const listItem = document.createElement('li');
                		    listItem.textContent = result.pageName;
                		    
                		    listItem.onclick = function() {
                		        search(result.pageName);
                
	              			      if (result.pageName) {
	              			        // 로컬 스토리지에서 검색어 배열 가져오기
	              			        const searchHistory = getSearchHistory();
	              					// 만약에 searchValue가 searchHistory 안에 없다면!!! 검색어 배열에 새로운 검색어 추가
	              			          if (!searchHistory.includes(result.pageName)) {
	              			        	  // 검색어 배열의 맨 앞에 새로운 검색어 추가
	              			              searchHistory.unshift(result.pageName);
	              			              searchInput.value ="";
	              			              // 로컬 스토리지에 검색어 배열 저장
	              			              saveSearchHistory(searchHistory);
	              			              renderSearchHistory(searchHistory);
	              		         		}
	              					
	              			      }
                		    };

                		    autocompleteResults.appendChild(listItem);
                		});

                   
	                },
	                error: function(error) {
	                    console.error('자동완성 요청 에러:', error);
	                }
	            });
	        } else {
	         	  autocompleteResults.innerHTML = '';
	        } 
		  
 		  
 		// 검색어를 입력하는 input 요소에 Enter 키가 눌렸을 때의 이벤트를 처리
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
	      search(searchValue);

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
	
	  function search(searchValue) {
		  //자동검색단어 클릭해서 여기로 넘어올 시  display none
		  var autocompleteResults = document.getElementById("autocomplete-results");
		  autocompleteResults.style.display = "none";
		  
		  console.log(searchValue + ' 내용검색');
		  var searchResult = document.getElementById("searchResult");
		  var notFound = document.getElementById("notFound");
		  var sListContainer = document.getElementById("sListContainer");
		  var vListContainer = document.getElementById("vListContainer");
		  var dListContainer = document.getElementById("dListContainer");
		  var nullListContainer = document.getElementById("nullListContainer");

		  
		  // div 안의 모든 내용을 지움
		  notFound.innerHTML = "";
		  sListContainer.innerHTML = "";
		  vListContainer.innerHTML = "";
		  dListContainer.innerHTML = "";
		  nullListContainer.innerHTML = "";
		  
		  $.ajax({
		    url: '/search', 
		    method: 'GET', 
		    data: { keyword: searchValue },
		    success: function (response) {
		      console.log('Search results:', response);
		      
		       if(response.length ===0){
		    	var noResultParagraph = document.createElement("p");
		    	    noResultParagraph.textContent = "검색된 내용이 없습니다.";
				    
		    	    notFound.appendChild(noResultParagraph);
		       }
		      // 카테고리 별로 분류할 리스트 생성
		      var sList = [];
		      var vList = [];
		      var dList = [];
		      var nullList = [];

		      // JSON 데이터를 반복하며 카테고리에 따라 리스트에 추가
		      response.forEach(function (item) {
		        if (item.category === 'S') {
		          sList.push(item);
		        } else if (item.category === 'V') {
		          vList.push(item);
		        } else if (item.category === 'D') {
		          dList.push(item);
		        } else {
		          nullList.push(item);
		        }
		      });

		      // 분류된 리스트를 사용하여 원하는 작업 수행
		      console.log('S 리스트:', sList);
		      console.log('V 리스트:', vList);
		      console.log('D 리스트:', dList);
		      console.log('Null 리스트:', nullList);
		      
		      addCategoryToContainer(dList, dListContainer, "기부");
		      addCategoryToContainer(vList, vListContainer, "봉사");
		      addCategoryToContainer(sList, sListContainer, "세미나");
		      addCategoryToContainer(nullList, nullListContainer, "");
		      


		      
		      dList.forEach(function (item) {
		    	    var listItem = document.createElement("li");
		    	    
		    	    // Create an anchor element
		    	    var anchor = document.createElement("a");
		    	    anchor.href = "/donation/detail?id="+item.pageUrl; // Set the href attribute to item.pageUrl
		    	    anchor.textContent = item.pageName;
		    	    
		    	    // Append the anchor element to the list item
		    	    listItem.appendChild(anchor);
		    	    
		    	    // Append the list item to the container
		    	    dListContainer.appendChild(listItem);
		    	});


		      vList.forEach(function (item) {
		    	    var listItem = document.createElement("li");
		    	    
		    	    // Create an anchor element
		    	    var anchor = document.createElement("a");
		    	    anchor.href = "/volunteer/detail?id="+item.pageUrl; // Set the href attribute to item.pageUrl
		    	    anchor.textContent = item.pageName;
		    	    
		    	    // Append the anchor element to the list item
		    	    listItem.appendChild(anchor);
		    	    
		    	    // Append the list item to the container
		    	    vListContainer.appendChild(listItem);
		    	});

		      
		      sList.forEach(function (item) {
		    	    var listItem = document.createElement("li");
		    	    
		    	    // Create an anchor element
		    	    var anchor = document.createElement("a");
		    	    anchor.href = "/seminar/detail?id="+item.pageUrl; // Set the href attribute to item.pageUrl
		    	    anchor.textContent = item.pageName;
		    	    
		    	    // Append the anchor element to the list item
		    	    listItem.appendChild(anchor);
		    	    
		    	    // Append the list item to the container
		    	    sListContainer.appendChild(listItem);
		    	});

		      
		      nullList.forEach(function (item) {
		    	    var listItem = document.createElement("li");
		    	    
		    	    // Create an anchor element
		    	    var anchor = document.createElement("a");
		    	    anchor.href = item.pageUrl; 
		    	    anchor.textContent = item.pageName;
		    	    
		    	    // Append the anchor element to the list item
		    	    listItem.appendChild(anchor);
		    	    
		    	    // Append the list item to the container
		    	    nullListContainer.appendChild(listItem);
		    	});
		      
		      
		    },
		    error: function (xhr, status, error) {
		      console.error('AJAX error:', status, error);
		    }
		  });
		}

	  function addCategoryToContainer(category, container, categoryText) {
		  if (category.length !== 0) {
		    var categoryParagraph = document.createElement("p");
		    categoryParagraph.className = "category";
		    categoryParagraph.textContent = categoryText;
		    
		    container.appendChild(categoryParagraph);
		  }
		}
	  
	  const initialSearchHistory = getSearchHistory();
	  renderSearchHistory(initialSearchHistory);
	  toggleRecentSearchVisibility();

	  
	  
	  //자동완성 키워드 바깥 쪽 클릭 시 자동완성키워드 화면 display none;
	  const autocompleteResults = document.getElementById('autocomplete-results');


	  document.addEventListener('click', function(event) {
	      if (!autocompleteResults.contains(event.target)) {
	          autocompleteResults.style.display = 'none';
	      }
	  });

	  
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
				<input id="search" class="form-control" type="search"
					placeholder="검색어를 입력해주세요">
				<div class="input-group-append">
					<button id="searchBtn" class="btn btn-outline-border" type="submit">
						<i class="fe fe-search"></i>
					</button>
				</div>
				<div id="autocomplete-results"></div>
			</div>
				
		</form>
	</div>

	<!-- Body: Results (add `.d-none` to disable it) -->
	<div class="offcanvas-body border-top fs-sm">

		<!-- Heading -->
		<div id="searchHeader" style="display: none;">
			<span style="color: gray">최근검색어</span> <span id="deleteAllValues"
				style="color: blue; font-size: 12px; font-weight: 200; float: right;">전체삭제</span>
		</div>


	
		<div id="recentSearchValues"></div>
		<div id="searchResult">
			<div id="notFound"></div>
			<div id="nullListContainer"></div>

			<div id="dListContainer"></div>

			<div id="vListContainer"></div>

			<div id="sListContainer"></div>


		</div>



		<div id="popularResult">
			<p>인기검색어</p>
			<p>1 기부</p>
			<p>2 봉사</p>
			<p>3 증명서</p>
		</div>

	</div>
</div>


