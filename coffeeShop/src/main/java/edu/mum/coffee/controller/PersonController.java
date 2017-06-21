package edu.mum.coffee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.coffee.domain.Address;
import edu.mum.coffee.domain.Person;
import edu.mum.coffee.service.PersonService;

@Controller
public class PersonController {
	@Autowired
	private PersonService personService;
	
	@GetMapping(value="/persons")
	public String getAllPersons(Model model){
		model.addAttribute("persons", personService.findAll());
		return "persons";
	}
	//add person
	@GetMapping(value="addPerson")
	public String addPersonWebPage(@ModelAttribute("person") Person person, Address address){		
		return "addPerson";
	}
	
	@PostMapping(value="persons")
	public String savePerson(Person person, Address address){
		person.setAddress(address);
		personService.savePerson(person);
		return "redirect:/persons";
	}
	
	@GetMapping(value="/persons/{id}")
	public String getPerson(@PathVariable("id")long id, Model model){
		model.addAttribute("person", personService.findById(id));
		return "editPerson";
	}
	
	@PostMapping(value="/persons/update/{id}")
	public String updatePerson(Person person, @PathVariable("id")long id){
		Person per = personService.findById(id);
		per=person;
		personService.savePerson(per);
		return "redirect:/persons";
	}
	
	@PostMapping(value="/deleteperson/{id}")
	public String removePerson(Person person, @PathVariable("id")long id){
		Person per = personService.findById(id);
		personService.removePerson(per);
		return "redirect:/persons";
	}
	@GetMapping(value="findbyemail")
	public List<Person> findByEmail(String email){
		return personService.findByEmail(email);
	}
}
