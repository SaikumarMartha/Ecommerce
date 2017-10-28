package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Dao.CartDao;
import com.Dao.ProductDao;
import com.Dao.UserDao;
import com.model.Cart;
import com.model.Product;
import com.model.User;

@Controller
public class CartController
{

	@Autowired
	CartDao cartDao;
	
	@Autowired
	ProductDao productDao;
	@Autowired
	UserDao userDao;
	int userId;
	User user;
	

	  @RequestMapping(value="addToCart/{id}")
	    public String addProductToCart(@PathVariable("id") int id, HttpSession session,Model model,RedirectAttributes attributes)
	    {
	    	int userId = (Integer) session.getAttribute("userid");
	    	int q=1;
	    	if (cartDao.getitem(id, userId) != null) {
				Cart item = cartDao.getitem(id, userId);
				
				item.setProductQuantity(item.getProductQuantity() + q);
				
				Product p = productDao.getProduct(id);
				
				System.out.println(item);
				item.setProductPrice(p.getPrice());
				item.setSubTotal(item.getProductQuantity() *p.getPrice());
				cartDao.saveProductToCart(item);
				attributes.addFlashAttribute("ExistingMessage",  p.getProductName() +"is already exist");
		
				return "redirect:/";
			} 
	    	else
			{
				Cart item = new Cart();
				Product p = productDao.getProduct(id);
				item.setProductid(p.getProductId());
				item.setProductName(p.getProductName());
				item.setUserId(userId);
				item.setProductQuantity(q);
				item.setSubTotal(q * p.getPrice());
				item.setProductPrice(p.getPrice());
				cartDao.saveProductToCart(item);
				attributes.addFlashAttribute("SuccessMessage", "Item"+p.getProductName()+" has been deleted Successfully");
				return "redirect:/";
			}
	    	
	    }
	 
	  @RequestMapping("cart")
		public String viewCart(Model model, HttpSession session) {
	    	
			//int userId = (Integer) session.getAttribute("userid");
			model.addAttribute("CartList", cartDao.listCart());
			 if(cartDao.cartsize((Integer) session.getAttribute("userid"))!=0){
				
				model.addAttribute("CartPrice", cartDao.CartPrice((Integer) session.getAttribute("userid")));
			} else {
				model.addAttribute("EmptyCart", "true");
			}
			model.addAttribute("IfViewCartClicked", "true");
		//	model.addAttribute("HideOthers", "true");
			return "Cart";
		}



	
	  
	  
}
