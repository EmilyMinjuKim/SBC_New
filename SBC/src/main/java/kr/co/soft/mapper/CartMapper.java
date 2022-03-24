package kr.co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import kr.co.soft.bean.CartBean;
import kr.co.soft.bean.CartListBean;

public interface CartMapper {
	
	//같은 제품 있는지 확인
	@Select("select count(*) from cart "
			+ "where member_id = #{member_id} and product_id = #{product_id}")
	int checkCart(CartBean cartBean);
	
	//상품 수량 업데이트 
	@Update("update cart set quantity = (quantity + #{quantity}) "
			+ "where member_id = #{member_id} and product_id = #{product_id}")
	void updateCart(CartBean cartBean);
	
	//상품 수량 업데이트 장바구니에서 
	@Update("update cart set quantity = #{quantity} "
			+ "where member_id = #{member_id} and product_id = #{product_id}")
	void changeCnt(CartBean cartBean);

	//카트 추가
	@Insert("insert into cart(member_id, product_id, quantity, cart_date) "
			+ "values(#{member_id}, #{product_id}, #{quantity}, sysdate)")
	void addCart(CartBean cartBean);
	
	//카트에 담긴 상품 수량 총 갯수 
	@Select("select sum(quantity) from cart where member_id = #{member_id}")
	Integer countCart(String member_id);
	
	//카트 목록
	@Select("select c.product_id, product_name, product_option, price, quantity, (price*quantity) as total "
			+ "from cart c "
			+ "join product p "
			+ "on c.product_id = p.product_id "
			+ "where member_id = #{member_id} "
			+ "group by c.product_id, product_name, product_option, price, quantity")
	List<CartListBean> cartList(String member_id);
	
	//카드 전체 삭제
	@Delete("delete from cart where member_id = #{member_id}")
	void deleteCartAll(String member_id);
	
	//체크박스로 선택한 상품 삭제
	@Delete("delete from cart where member_id = #{member_id} and product_id = #{product_id}")
	void deleteCartSelected(CartBean cartBean);
	
}
