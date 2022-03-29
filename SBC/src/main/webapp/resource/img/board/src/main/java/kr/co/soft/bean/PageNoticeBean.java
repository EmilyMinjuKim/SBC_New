package kr.co.soft.bean;

public class PageNoticeBean {

	// 최소 페이지 번호
	private int min;

	// 최대 페이지 번호
	private int max;

	// 이전 버튼의 페이지 번호
	private int prevPage;

	// 다음 버튼이 페이지 번호
	private int nextPage;

	// 전체 페이지 갯수
	private int pageCnt;

	// 현재 페이지 번호
	private int currentPage;

	public PageNoticeBean(int contentCnt, int currentPage, int contentPageCnt, int paginationcnt) {
		// int contentCnt : 전체 글 갯수(table), int currentPage : 현재 페이지 번호(param)
		// int contentPageCnt : 페이지당 글 번호(property), int paginationcnt : 페이지 버튼
		// 개수(property)

		this.currentPage = currentPage;

		// 전체 페이지 갯수
		pageCnt = contentCnt / contentPageCnt;

		// 533/10=53페이지 & 3개이므로 1page가 더 필요함
		if (contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
//		1. 1 ~ 10 : 1(최소), 10(최대)
//		   11 ~ 20 : 11(최소), 20(최대)
//		   21 ~ 30 : 21(최소), 30(최대)

//		2. 최대번호는 최소에 9를 더하므로 -1을 계산해줌
//		   0 ~ 9 :

//		3. 페이지당글의 갯수로 나눔

//		4. 페이지당 글의 갯수로 다시 곱함

//		5. 첫번째 페이지 오류로 +1을 해줌

		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationcnt - 1;

		// 10개의 버튼을 다 표시할 필요가 없을 때
		// 63개의 글은 6페이지 버튼에 1추가되므로 나머지 8 ~ 10은 불필요
		if (max > pageCnt) {
			max = pageCnt;
		}

		prevPage = min - 1; // 0이 나오면 비활용
		nextPage = max + 1;

		// 마지막페이지를 넘어가지 않도록
		if (nextPage > pageCnt) {
			nextPage = pageCnt;
		}

	}

	public int getMin() {
		return min;
	}

	public int getMax() {
		return max;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getCurrentPage() {
		return currentPage;
	}

}
