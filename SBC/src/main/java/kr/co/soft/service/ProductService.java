package kr.co.soft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.soft.bean.ProductBean;
import kr.co.soft.mapper.ProductMapper;

@Service
public class ProductService {

	@Autowired
	ProductMapper mapper;

	public List<ProductBean> getProductList(){
		return mapper.getProductList();
	}
	
	public List<ProductBean> getSelectedProducts(String product_name){
		return mapper.getSelectedProducts(product_name);
	}
	
	public ProductBean getRepProduct(String product_name) {
		return mapper.getRepProduct(product_name);
	}
	
}
