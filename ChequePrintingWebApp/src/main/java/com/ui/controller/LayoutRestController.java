package com.ui.controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.ui.dao.LayoutService;
import com.ui.model.ChequeLayout;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/layout")
public class LayoutRestController {
	
	@Autowired
	private LayoutService layoutService;

    @PostMapping("/save")
    public String saveLayout(@RequestBody ChequeLayout layout) {
        try {
            layoutService.saveLayout(layout);
            return "Layout saved successfully.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Error saving layout.";
        }
    }
    
    
    
    @GetMapping("/all")
    public List<ChequeLayout> getAllLayouts() {
        return layoutService.getAllLayouts();
    }
    
    
    @GetMapping("/getById/{id}")
    public ChequeLayout getLayoutById(@PathVariable("id") int layoutId) {
        return layoutService.getLayoutById(layoutId);
    }

}
