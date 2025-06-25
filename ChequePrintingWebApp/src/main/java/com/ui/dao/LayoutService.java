package com.ui.dao;

import java.util.List;

import com.ui.model.ChequeLayout;

public interface LayoutService {
	void saveLayout(ChequeLayout layout);

	List<ChequeLayout> getAllLayouts();

	ChequeLayout getLayoutById(int layoutId);

		
}
