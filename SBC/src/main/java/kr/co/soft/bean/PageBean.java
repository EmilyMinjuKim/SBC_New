package kr.co.soft.bean;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
public class PageBean {

	// 최소 페이지 번호
	private int min;

	// 최대 페이지 번호
	private int max;

	// 이전 버튼의 페이지 번호
	private int prevPage;

	// 다음 버튼의 페이지 번호
	private int nextPage;

	// 전체 페이지 갯수
	private int pageCnt;

	// 현재 페이지 번호
	private int currentPage;

	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		// contentCnt : 전체 글갯수(table)
		// currentPage: 현재 페이지 번호(param)
		// contentPageCnt: 페이지당 글번호(property)
		// paginationCnt : 페이지 버튼 갯수(property)

		this.currentPage = currentPage;

		// 전체 페이지 갯수
		// 533/10=53 페이지 & 3개 이므로 1page가 더 필요
		//pageCnt = contentCnt % contentPageCnt > 0 ? (contentCnt / contentPageCnt) + 1 : (contentCnt / contentPageCnt);
		pageCnt = contentCnt / contentPageCnt + (contentCnt % contentPageCnt == 0 ? 0 : 1);
		//pageCnt = (int)Math.ceil(contentCnt / (double)contentPageCnt);


		// 1.
		// 1~10 : 1(최소), 10(최대)
		// 11~20 : 11,20
		// 21~30 : 21,30
		// 최대 번호는 최소에 9를 더하므로 -1을 계산해줌.
		// 0 ~ 9 :

		// 2. 최대 번호는 최소에 9를 더하므로 -1

		// 3. 페이지 당 글의 갯수로 나눔.

		// 4. 페이지 당 글의 갯수로 다시 곱함.

		// 5. 첫번째 페이지 오류로 +1
		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationCnt - 1;

		// 10개의 버튼을 다 표시할 필요가 없을 때

		// 63개의 글은 6페이지 버튼에 1 추가 되므로 나머지 8~10은 불필요
		if (max > pageCnt)
			max = pageCnt;

		prevPage = min - 1; // 0이 나오면 비활성화
		nextPage = max + 1;

		// 마지막 페이지를 넘어가지 않도록
		if (nextPage > pageCnt)
			nextPage = pageCnt;

	}

}
