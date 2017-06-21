package edu.mum.coffee.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Item;
import edu.mum.coffee.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private ProductService productService;
	@RequestMapping(method=RequestMethod.GET)
	public String index(ModelMap modelMap){
		modelMap.put("title", "cart");
		modelMap.put("action", "cart");
		return "cart.index";
	}
	
	@RequestMapping(value="buy/{id}",method=RequestMethod.GET)
	public String buy(@PathVariable("id") int id,
			HttpSession session,
			ModelMap modelMap){
		modelMap.put("title", "cart");
		if(session.getAttribute("cart")==null){
			List<Item> cart = new ArrayList<Item>();
			cart.add(new Item(productService.getProduct(id),1));
			session.setAttribute("cart", cart);
		}else{
			List<Item> cart = (List<Item>) session.getAttribute("cart");
			cart.add(new Item(productService.getProduct(id),1));
			session.setAttribute("cart", cart);
		}
		return "cart.index";
	}
	
}
