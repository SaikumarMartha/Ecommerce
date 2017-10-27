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

import com.Dao.SupplierDao;
import com.model.Category;
import com.model.Supplier;
@Controller
public class SupplierController 
{
	@Autowired
	SupplierDao supplierDao;
	  
	
	   @RequestMapping(value="AddSupplier",method=RequestMethod.POST)
			 public String addSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
			    {

			    	
		   supplierDao.addSupplier(supplier);
			        
			        return "redirect:/supplier";
			    }
			    
			    
				@RequestMapping(value="supplier",method=RequestMethod.GET)
			    public String showSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
			    {
			         
			        List<Supplier> listSupplier=supplierDao.retrieveSupplier();
			        m.addAttribute("supplier", supplier);
			        m.addAttribute("supplierList",listSupplier);
			        return "Supplier";
			    }
			    
				/* @RequestMapping(value="/updateCategory/{catId}",method=RequestMethod.GET)
				    public String updateCategory(@PathVariable("catId") int catId,Model m,RedirectAttributes attributes)
				     {
					 categoryDAO.updateCategory(catId);
						return "redirect:/category";
				    }*/
			    
				@RequestMapping(value="updateSupplier/{supplierId}",method=RequestMethod.GET)
				    public String updateSupplier(@PathVariable("supplierId") int supplierId,Model m,RedirectAttributes attributes)
				    {
					Supplier supplier=supplierDao.getSupplier(supplierId);
				       // m.addAttribute(category);
				         attributes.addFlashAttribute("supplier",supplier);
				        List<Supplier> listSupplier=supplierDao.retrieveSupplier();
				        m.addAttribute("supplierList",listSupplier);
				        return "redirect:/supplier";
				    }
			    
			    @RequestMapping(value="/deleteSupplier/{supplierId}",method=RequestMethod.GET)
			    public String deleteSupplier(@PathVariable("supplierId")int supplierId,Model m,RedirectAttributes attributes)
			    {	
			    	Supplier supplier=supplierDao.getSupplier(supplierId);
			    	supplierDao.deleteSupplier(supplier);
			    	List<Supplier> listSupplier=supplierDao.retrieveSupplier();
					m.addAttribute("supplierList",listSupplier);
					return "redirect:/supplier";
					
			    }
	
	
}
	/*
	
	@RequestMapping(value="AddSupplier",method=RequestMethod.POST)
	public String addSupplier(@ModelAttribute("supplier")Supplier supplier,Model m)
	{
		supplierDao.addSupplier(supplier);
		
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		
		return "Supplier";
	}
	
	@RequestMapping(value="supplier",method=RequestMethod.GET)
	public String showCategory(Model m)
	{
		Supplier supplier=new Supplier();
		m.addAttribute(supplier);
		
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "Supplier";
	}
	
	@RequestMapping(value="updateSupplier/{supplierId}",method=RequestMethod.GET)
	public String updateSupplier(@PathVariable("supplierId") int supplierId,Model m)
	{
		Supplier supplier=supplierDao.getSupplier(supplierId);
		m.addAttribute(supplier);
		
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "redirect:supplier";
	}
	
	
	@RequestMapping(value="deleteSupplier/{supplierId}",method=RequestMethod.GET)
	public String deleteSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDao.getSupplier(supplierId);
		supplierDao.deleteSupplier(supplier);
		List<Supplier> listSupplier=supplierDao.retrieveSupplier();
		m.addAttribute("supplierList",listSupplier);
		return "Supplier";
}
}*/