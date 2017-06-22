package edu.mum.coffee.rws;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.repository.ProductRepository;

@RestController
public class RestProductController {
	@Autowired
	private ProductRepository productService;
	
	@GetMapping(value="restproducts")
	public List<Product> getAllProducts(){
		return productService.findAll();
	}

}
