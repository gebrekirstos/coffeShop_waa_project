package edu.mum.coffee.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping(value="/products")
	public String getAllProducts(Model model){
		model.addAttribute("products", productService.getAllProduct());
		return "products";
	}
	//add product
	@GetMapping(value="addProduct")
	public String addProductWebPage(@ModelAttribute("product") Product product){
		return "addProduct";
	}
	@PostMapping(value="products")
	public String saveProduct(@Valid Product product, BindingResult result){
		String view = "redirect:/products";
		if(!result.hasErrors()){
			productService.save(product);
		}else{
			view="addProduct";
		}
		
		return view;
	}
	
	@GetMapping(value="/products/{id}")
	public String getPerson(@PathVariable("id")int id, Model model){
		model.addAttribute("product", productService.getProduct(id));
		return "editProduct";
	}
	
	@PostMapping(value="/products/{id}")
	public String updateProduct(@PathVariable("id")int id, @Valid Product product, BindingResult result){
		String view ="redirect:/products";
		Product prod = productService.getProduct(id);
		prod = product;
		if(!result.hasErrors()){
			productService.save(prod);
		}
		else{
			view="editProduct";
		}
		return view;
	}
	
	@PostMapping(value="/deleteproduct/{id}")
	public String deleteProduct(Product product, @PathVariable("id") int id){
		Product pro = productService.getProduct(id);
		productService.delete(pro);
		return "redirect:/products";
	}
}
