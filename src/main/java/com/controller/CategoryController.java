package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.Dao.CategoryDao;
import com.model.Category;

@Controller
public class CategoryController 
{
	@Autowired
	CategoryDao categoryDao;
	
	
	
	
	@RequestMapping(value="AddCategory",method=RequestMethod.POST)
	public String addCategory(@ModelAttribute("category")Category category,Model m)
	{
		categoryDao.addCategory(category);
		
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		
		return "Category";
	}
	
	@RequestMapping(value="category",method=RequestMethod.GET)
	public String showCategory(Model m)
	{
		Category category=new Category();
		m.addAttribute(category);
		
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		return "Category";
	}
	
	@RequestMapping(value="updateCategory/{catId}",method=RequestMethod.GET)
	public String updateCategory(@PathVariable("catId") int catId,Model m)
	{
		Category category=categoryDao.getCategory(catId);
		m.addAttribute("Category",category);
		
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		return "updateCategory";
	}
	
	@RequestMapping(value="updateCategory",method=RequestMethod.POST)
	public String updateMyCategory(@ModelAttribute("category")Category category,Model m)
	{
		categoryDao.updateCategory(category);
		
		
		
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		
		return "redirect:/category";
	}
	
	@RequestMapping(value="deleteCategory/{catId}",method=RequestMethod.GET)
	public String deleteCategory(@PathVariable("catId")int catId,Model m)
	{
		Category category=categoryDao.getCategory(catId);
		categoryDao.deleteCategory(category);
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		
		
		return "Category";
	}
	
	
	
	
	
}
