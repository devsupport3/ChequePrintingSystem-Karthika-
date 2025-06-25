package com.ui.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ui.dao.ChequeBookService;
import com.ui.dao.LayoutService;
import com.ui.dao.Impl.BankAccountServiceImpl;
import com.ui.dao.Impl.BankServiceImpl;
import com.ui.dao.Impl.LayoutServiceImpl;
import com.ui.dao.Impl.SupplierServiceImpl;
import com.ui.dao.Impl.UserServiceImpl;
import com.ui.model.Bank;
import com.ui.model.BankAccounts;
import com.ui.model.ChequeBook;
import com.ui.model.Suppliers;
import com.ui.model.User;
import com.ui.model.ChequeLayout;


@Controller
public class MainController {
	  @Autowired
	    private ChequeBookService chequeBookService;
	   
	  @RequestMapping("/")
	    public String index() {
	        return "admin/index";
	    }
	  
	  
	  
	   @RequestMapping("/users/list")
	    public String usersPage() {
	        return "admin/user-list";  
	    }
	   
	   
	   @GetMapping("/users/list")
	    public String showUserListPage(Model model) {
	      
	        return "admin/user-list"; 
	    }
	   
	   @RequestMapping("/users/add")
	    public String addUserForm() {
	        return "admin/userAdd"; 
	    }

	   @RequestMapping(value = "/users/edit", method = RequestMethod.GET)
	    public String editUserForm(@RequestParam("id") int id, Model model) {
	        model.addAttribute("userId", id);
	        return "admin/userEdit"; 
	    }
	    
	   
	   @GetMapping("/users/edit/{id}")
	    public String userEditForm(@PathVariable("id") int id, Model model) {
	        User user;
			
				UserServiceImpl userRow = new UserServiceImpl();
				user = userRow.getUserById(id);
	        model.addAttribute("user", user);
	        return "admin/userEdit"; // JSP page name under /WEB-INF/views/
	    }
	   
	   
	   
	   @RequestMapping("/suppliers/list")
	    public String suppliersPage() {
	        return "admin/supplier-list";  
	    }
	   
	   
	   @GetMapping("/suppliers/list")
	    public String showSupplierListPage(Model model) {
	      
	        return "admin/supplier-list"; 
	    }
	    
	   
	   @RequestMapping("/suppliers/add")
	    public String addSupplierForm() {
	        return "admin/supplierAdd"; 
	    }

	   @RequestMapping(value = "/suppliers/edit", method = RequestMethod.GET)
	    public String editSupplierForm(@RequestParam("id") int id, Model model) {
	        model.addAttribute("supplierId", id);
	        return "admin/supplierEdit"; 
	    }
	   
	   
	   @GetMapping("/suppliers/edit/{id}")
	    public String EditSupplierForm(@PathVariable("id") int id, Model model) {
	        Suppliers supplier;
			
				SupplierServiceImpl supplierRow = new SupplierServiceImpl();
				supplier = supplierRow.getSupplierById(id);
	        model.addAttribute("supplier", supplier);
	        return "admin/supplierEdit"; 
	    }
	   
	   
	   @GetMapping("/banks/list")
	    public String showBankPage(Model model) {
	      
	        return "admin/bankList"; 
	    }
	   
	   
	   @RequestMapping("/banks/add")
	    public String addBankForm() {
	        return "admin/bankAdd"; 
	    }
	 

	    // ✅ Show add bank form
	    @GetMapping("/banks/add")
	    public String showAddBankForm(Model model) {
	        model.addAttribute("bank", new Bank());
	        return "admin/bankAdd"; // JSP page: /WEB-INF/views/addBank.jsp
	    }

	    @RequestMapping(value = "/banks/edit", method = RequestMethod.GET)
	    public String editBankForm(@RequestParam("id") int id, Model model) {
	        model.addAttribute("bankId", id);
	        return "admin/bankEdit"; 
	    }
	   
	   
	   @GetMapping("/banks/edit/{id}")
	    public String EditBankForm(@PathVariable("id") int id, Model model) {
	        Bank bank;
			
				BankServiceImpl bankRow = new BankServiceImpl();
				bank = bankRow.getBankById(id);
	        model.addAttribute("bank", bank);
	        return "admin/bankEdit"; 
	    }
	   
	   

	   
	   
	   
	   
	   
	   
	   
	   @RequestMapping("/bankAccounts/list")
	    public String bankAccountsPage() {
	        return "admin/bankAccount-list";  
	    }
	   
	   @GetMapping("/bankAccounts/list")
	    public String showBankAccountListPage(Model model) {
	      
	        return "admin/bankAccount-list"; 
	    }
	   
	   
	   @RequestMapping("/bankAccounts/add")
	    public String addbankAccountForm() {
	        return "admin/bankAccountAdd"; 
	    }

	   @RequestMapping(value = "/bankAccounts/edit", method = RequestMethod.GET)
	    public String editbankAccountForm(@RequestParam("id") int id, Model model) {
	        model.addAttribute("bankAccountId", id);
	        return "admin/bankAccountEdit"; 
	    }
	   
	   
	   @GetMapping("/bankAccounts/edit/{id}")
	    public String EditBankAccountForm(@PathVariable("id") int id, Model model) {
	        BankAccounts account;
			
				BankAccountServiceImpl accountRow = new BankAccountServiceImpl();
				account = accountRow.getBankAccountById(id);
	        model.addAttribute("bankAccount", account);
	        return "admin/bankAccountEdit"; // JSP page name under /WEB-INF/views/
	    }
	   
	   
		/*
		 * @RequestMapping("/signatories/list") public String SignatoryPage() { return
		 * "admin/sign-list"; }
		 * 
		 * 
		 * 
		 * @GetMapping("/signatories/list") public String viewSignatoryList() { return
		 * "admin/sign-list"; // JSP: /WEB-INF/admin/views/signatories/listSignatory.jsp
		 * }
		 * 
		 * // Add new signatory form
		 * 
		 * @GetMapping("/signatories/add") public String addSignatoryForm() { return
		 * "admin/signatoryAdd"; // JSP:
		 * /WEB-INF/admin/views/signatories/addSignatory.jsp }
		 * 
		 * 
		 * @RequestMapping(value = "/signatories/edit", method = RequestMethod.GET)
		 * public String editSignForm(@RequestParam("id") int id, Model model) {
		 * model.addAttribute("sign_id", id); return "admin/signatoryEdit"; }
		 * 
		 * 
		 * // Edit signatory form
		 * 
		 * @GetMapping("/signatories/edit/{id}") public String
		 * editSignatoryForm(@PathVariable("id") int id, Model model) { Signatory sign;
		 * 
		 * SignatoryServiceImpl signRow = new SignatoryServiceImpl(); sign =
		 * signRow.getSignatoryById(id); model.addAttribute("signatory", sign); return
		 * "admin/signatoryEdit"; // JSP:
		 * /WEB-INF/admin/views/signatories/editSignatory.jsp }
		 * 
		 * 
		 * 
		 * 
		 * @GetMapping("/cheques/list") public String showChequeListPage() { return
		 * "admin/chequeList"; }
		 * 
		 * 
		 * @GetMapping("/cheques/add") public String showAddChequePage() { return
		 * "admin/chequeAdd"; }
		 * 
		 * 
		 * @GetMapping("/cheques/edit") public String
		 * showEditChequePage(@RequestParam("id") int chequeId, Model model) {
		 * model.addAttribute("chequeId", chequeId); return "editcheque"; }
		 * 
		 * 
		 * @GetMapping("/cheques/print") public String
		 * showPrintChequePage(@RequestParam("id") int chequeId, Model model) {
		 * model.addAttribute("chequeId", chequeId); return "printcheque"; }
		 */
	    
	    
	   @RequestMapping("/chequeBooks/list")
	    public String ListChequeBookPage() {
	        return "admin/chequebookList";  
	    }
	   

	   @GetMapping("/chequeBooks/list")
	    public String listChequeBooks(Model model) {
	        model.addAttribute("chequeBooks", chequeBookService.getAllChequeBooks());
	        return "admin/chequebookList"; // maps to /WEB-INF/views/chequebookList.jsp
	    }

	   @RequestMapping("/chequeBooks/add")
	    public String addChequeBookForm() {
	        return "admin/addChequeBook"; 
	    }
	 

	    // ✅ Show add bank form
	    @GetMapping("/chequeBooks/add")
	    public String showChequeBookForm(Model model) {
	        model.addAttribute("book", new ChequeBook());
	        return "admin/addChequeBook"; // JSP page: /WEB-INF/views/addBank.jsp
	    }

	    
	    
	    @GetMapping("/layout/add")
	    public String showLayoutForm(Model model) {
	        model.addAttribute("layout", new ChequeLayout());
	        return "admin/chequeLayout"; // JSP page: /WEB-INF/views/addBank.jsp
	    }

	    
	    @GetMapping("/layout/design")
	    public String showLayoutDesigner() {
	        return "admin/chequeLayout";  // JSP page name (WEB-INF/views/chequeLayout.jsp)
	    }
	    
	    LayoutServiceImpl layoutService=new LayoutServiceImpl();
	    
	    @GetMapping("/layout/view")
	    public String viewLayoutsPage(Model model) {
	        // Fetch list from DB using service
	    	
	        List<ChequeLayout> layout = layoutService.getAllLayouts();
	        model.addAttribute("layout", layout);
	        return "admin/viewLayouts"; // maps to viewLayouts.jsp
	    }
	    
	    
		/*
		 * @GetMapping("/layout/preview") public String showLayoutPreviewPage() { return
		 * "previewLayout"; // This will resolve to previewLayout.jsp }
		 */
	    
	    
	    @GetMapping("/layout/preview/{id}")
	    public String previewLayoutById(@PathVariable("id") int layoutId, Model model) {
	        ChequeLayout layout = layoutService.getLayoutById(layoutId);
	        model.addAttribute("layout", layout);
	        return "admin/previewLayout"; // This maps to previewLayout.jsp
	    }
	    
	    
	    
	    @RequestMapping(value = "/layout/preview", method = RequestMethod.GET)
	    public String previewLayout(@RequestParam("id") int id, Model model) {
	    	  model.addAttribute("layoutId", id);
	        return "admin/previewLayout"; 
	    }
	   
	    
	    @GetMapping("/cheque/issue")
	    public String showIssueChequePage() {
	        return "admin/issueCheque";  // JSP name (WEB-INF/views/issueCheque.jsp)
	    }

	    @GetMapping("/cheque/preview")
	    public String showPreviewChequePage() {
	        return "admin/previewCheque";
	    }

	    @GetMapping("/cheque/print")
	    public String showPrintChequePage() {
	        return "admin/printCheque";
	    }
}
