package com.controller;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Dao.CategoryDao;
import com.Dao.ProductDao;
import com.Dao.SupplierDao;
import com.model.Category;
import com.model.Product;
import com.model.Supplier;
@Controller
public class ProductController
{

	@Autowired
	ProductDao productDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired
	SupplierDao supplierDao;
	
	@RequestMapping(value="product",method=RequestMethod.GET)
	public String showProduct(Model m)
	{
		Product product=new Product();
		m.addAttribute(product);
		
		m.addAttribute("categoryList",this.getCategories());
		m.addAttribute("supplierList", this.getSuppliers());
		
		return "Product";
	}
	
	public LinkedHashMap<Integer,String> getCategories()
	{
		List<Category> listCategories=categoryDao.retrieveCategory();
		LinkedHashMap<Integer,String> categoriesList=new LinkedHashMap<Integer,String>();
		
		for(Category category:listCategories)
		{
			categoriesList.put(category.getCatId(),category.getCatName());
		}
		
		return categoriesList;		
	}

	
		
	
	public LinkedHashMap<Integer,String> getSuppliers()
	{
		List<Supplier> listSuppliers=supplierDao.retrieveSupplier();
		LinkedHashMap<Integer,String> suppliersList=new LinkedHashMap<Integer,String>();
		
		for(Supplier supplier:listSuppliers)
		{
			suppliersList.put(supplier.getSupplierId(),supplier.getSupplierName());
		}
		
		return suppliersList;
	}
	
	@RequestMapping(value="InsertProduct",method = RequestMethod.POST)

	public String addItem(@ModelAttribute("product") Product p,@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException
	{
		p.setImage(file.getBytes());
		this.productDao.addProduct(p);
		return "Product";
		
	}
	
	@RequestMapping(value="userHome")
	public String showProducts(Model m)
	{
		List<Product> listProducts=productDao.retrieveProduct();
		m.addAttribute("productList",listProducts);
		
		return "UserHome";
	}
	
	@RequestMapping(value="productDesc/{productId}")
	public String showProductDesc(@PathVariable("productId")int productId,Model m)
	{
		Product product=productDao.getProduct(productId);
		m.addAttribute("Product",product);
		return "ProductDesc";
	}

}

