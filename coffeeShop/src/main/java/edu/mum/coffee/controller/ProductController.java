package edu.mum.coffee.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.Produces;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.client.RestTemplate;

import edu.mum.coffee.domain.Orderline;
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
	
	/*@Produces("text/*")
	@GetMapping(value="/products")
	public String getAllProducts(Model model){
		RestTemplate restTemp = new RestTemplate();
		List<Product> products = restTemp.getForObject("http://localhost:8080/restproducts/", ArrayList.class);
		model.addAttribute("products", products);
		return "products";
	}*/
	
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
	
	@GetMapping(value="/ordernow111/{id}")
	public String buy(
			@PathVariable("id") int id,
			HttpSession session,
			ModelMap modelMap){
		
		modelMap.put("title", "orderline");
		if(session.getAttribute("orderline")==null){
			List<Orderline> orderlins= new ArrayList<Orderline>();
			orderlins.add(new Orderline(1,productService.getProduct(id)));
			session.setAttribute("orderline", orderlins);
		}else{
			List<Orderline> orderlins=(List<Orderline>) session.getAttribute("orderline");
			orderlins.add(new Orderline(1,productService.getProduct(id)));
			session.setAttribute("orderline", orderlins);
		}
		return "orderNow";
	}
	@GetMapping(value="/ordernow/{id}")
	public String OrderNow(Model model, @PathVariable("id")int id){
		model.addAttribute("product", productService.getProduct(id));
		return "orderNow";
	}
	
	@GetMapping(value="/products/{id}")
	public String getPerson(@PathVariable("id")int id, Model model){
		model.addAttribute("product", productService.getProduct(id));
		return "editProduct";
	}
	
	@GetMapping(value="/confirmOrder")
	public String getOrderConfirm(){
		return "confirmOrder";
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
