package kr.co.soft.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.soft.bean.ProductBean;

public interface ProductMapper {
	
	@Select("select product_id, product_name, price from product "
			+ "where product_id in (select min(product_id) from product group by product_name)")
	List<ProductBean> getProductList();
	
	@Select("select product_id, product_name, price, product_option "
			+ "from product where product_name = #{product_name} "
			+ "order by product_id")
	List<ProductBean> getSelectedProducts(String product_name);
	
	@Select("select product_id, product_name, price from product "
			+ "where product_name = #{product_name} "
			+ "and product_id=(select min(product_id) from product where product_name = #{product_name})")
	ProductBean getRepProduct(String product_name);

}
