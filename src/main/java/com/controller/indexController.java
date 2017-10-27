package com.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Dao.UserDao;
import com.model.User;










@Controller
public class indexController
{
	
	
	@Autowired
	private UserDao userDao;
	
@RequestMapping("/")
public String index()
{
	return "welcome";
}
	

@RequestMapping("/registration")
public String goToRegisterPage(@ModelAttribute("user") User user,Model model)
{
	
	model.addAttribute("user",new User());
	
	return "register";


}

@RequestMapping("/saveUser")
public String createUser(@ModelAttribute("user") User user)
{
 
	user.setRole("ROLE_USER");
	user.setEnabled(true);
	userDao.saveUser(user);
	return "welcome";
}





}




















/*@RequestMapping(value="/register",method=RequestMethod.GET)
public ModelAndView goToregister()
{
ModelAndView mv= new ModelAndView();
mv.addObject("user",new User());
mv.setViewName("register");
return mv;
}


/*@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
public String UserRegister(@ModelAttribute("user") User user,RedirectAttributes attributes) {
	user.setEnabled(true);
	user.setRole("ROLE_USER");
	userDAO.saveOrUpdate(user);
	attributes.addFlashAttribute("SuccessMessage","Registration Successfull");
	return "redirect:/";




@RequestMapping(value="/saveRegister",method=RequestMethod.POST)
public ModelAndView saveUser(@ModelAttribute("user")User user)
{
	ModelAndView mv= new ModelAndView();
	user.setRole("ROLE_USER");
	userDAO.saveOrUpdate(user);
	mv.setViewName("index");
	return mv;

	}*/
	
	
