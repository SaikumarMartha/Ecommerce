package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		        
		        return "redirect:/category";
		    }
		    
		    
			@RequestMapping(value="category",method=RequestMethod.GET)
		    public String showCategory(@ModelAttribute("category")Category category,Model m)
		    {
		         
		        List<Category> listCategory=categoryDao.retrieveCategory();
		        m.addAttribute("category", category);
		        m.addAttribute("categoryList",listCategory);
		        return "Category";
		    }
		    
		/*	@RequestMapping(value="/updateCategory/{catId}",method=RequestMethod.GET)
			    public String updateCategory(@PathVariable("catId") int catId,Model m,RedirectAttributes attributes)
			     {
				 categoryDao.updateCategory(catId);
					return "redirect:/category";
			    }*/
		    
			@RequestMapping(value="updateCategory/{catId}",method=RequestMethod.GET)
			    public String updateCategory(@PathVariable("catId") int catId,Model m,RedirectAttributes attributes)
			    {
				
				
			       Category category=categoryDao.getCategory(catId);
			       m.addAttribute(category);
			        attributes.addFlashAttribute("category",category);
			        List<Category> listCategory=categoryDao.retrieveCategory();
			        m.addAttribute("categoryList",listCategory);
			       
			        return "redirect:/category";
			    }
		    
		    @RequestMapping(value="/deleteCategory/{catId}",method=RequestMethod.GET)
		    public String deleteCategory(@PathVariable("catId")int catId,Model m,RedirectAttributes attributes)
		    {	
		    	m.addAttribute("category",categoryDao.deleteCategory(catId));
				return "redirect:/category";
				
		    }

}
























	/*
	
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
		m.addAttribute("Category",category);
		
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
	
	@RequestMapping(value="updateCategory",method=RequestMethod.GET)
	public String updateMyCategory(@ModelAttribute("category")Category category,Model m)
	{
		categoryDao.updateCategory(category);
		
		
		
		List<Category> listCategory=categoryDao.retrieveCategory();
		m.addAttribute("categoryList",listCategory);
		
		return "redirect:/category";
	}
	
	@RequestMapping(value="deleteCategory/{catId}",method=RequestMethod.GET)
	public String deleteCategory(@PathVariable("catId")int catId,Model m,RedirectAttributes attributes)
	{
		m.addAttribute("category",categoryDao.deleteCategory(catId));
		
		
		return "redirect:/category";
	}
	
	
	
	
	
}*/
