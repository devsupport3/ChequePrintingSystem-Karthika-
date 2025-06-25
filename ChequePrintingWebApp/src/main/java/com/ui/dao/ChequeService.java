package com.ui.dao;

import java.util.List;

import com.ui.model.Cheques;

public interface ChequeService {
	void issueCheque(Cheques cheque) throws Exception;
    List<Cheques> getAllCheques() throws Exception;
    Cheques getChequeById(int chequeId) throws Exception;
}
