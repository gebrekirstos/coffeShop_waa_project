package edu.mum.coffee.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.mum.coffee.domain.Order;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.domain.Product;
import edu.mum.coffee.service.OrderService;

@RestController
public class OrderController {
	@Autowired
	private OrderService orderService;
	
	@GetMapping(value="/orders")
	public String getAllOrderss(Model model){
		model.addAttribute("orders", orderService.findAll());
		return "orders";
	}
	
	@GetMapping(value="addOrder")
	public String addOrderWebPage(Model model){
		model.addAttribute("addOrder");
		return "addOrder";
	}
	
	@PostMapping(value="orders")
	public String saveOrder(Order order){
		orderService.save(order);
		return "redirect:/orders";
	}
	
	@GetMapping(value="/orders/{id}")
	public String getOrder(@PathVariable("id")int id, Model model){
		model.addAttribute("order", orderService.findById(id));
		return "editOrder";
	}
	
	@PutMapping(value="/orders/update/{id}")
	public String updateOrder(Order order, @PathVariable("id")int id){
		Order ord = orderService.findById(id);
		ord = order;
		orderService.save(ord);
		return "redirect:/orders";
	}
	
	@DeleteMapping(value="/deleteorder/{id}")
	public String deleteOrder(Order order, @PathVariable("id")int id){
		Order ord = orderService.findById(id);
		orderService.delete(ord);
		return "redirect:/orders";
	}
	
	@GetMapping(value="/findbyproduct")
	public String findByProduct(Product product, Model model){
		model.addAttribute("findbyproduct", orderService.findByProduct(product));
		return "findbyproduct";
	}
	
	@GetMapping(value="/findbyperson")
	public String findByPerson(Person person, Model model){
		model.addAttribute("findbyperson", orderService.findByPerson(person));
		return "findbyperson";
	}
	
	@GetMapping(value="/findbydate/{min}/{max}")
	public String findByDate(@PathVariable("min") Date minDate, @PathVariable("max") Date maxDate, Model model){
		model.addAttribute("minandmax", orderService.findByDate(minDate, maxDate));
		return "findbydate";
	}

}
