package edu.mum.coffee.domain;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties(ignoreUnknown=true)
public class Product {

	@Id
	@GeneratedValue
	private int id;
	@NotEmpty
	private String productName;
	private String description;
	@NotNull
	@DecimalMax("50.0")
	private double price;
	@NotNull
	@Enumerated(EnumType.STRING)
	private ProductType productType;

	public Product() {
		super(); // default constructor
	}

	public Product(String productName, String description, double price, ProductType productType) {
		super();
		this.productName = productName;
		this.description = description;
		this.price = price;
		this.productType = productType;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public ProductType getProductType() {
		return productType;
	}

	public void setProductType(ProductType productType) {
		this.productType = productType;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getId() {
		return id;
	}

}
