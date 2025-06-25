var chequeApp = angular.module('chequeApp', []);

// ✅ Base configuration
chequeApp.constant("AppConfig", {
    baseUrl: "/ChequePrintingWebApp",
    apiUrl: "/ChequePrintingWebApp/api",
    adminUrl: "/ChequePrintingWebApp/admin"
}); 

// ✅ Shared app-wide controller (if needed)
chequeApp.controller('MainController', function($scope,$window) {
    $scope.currentView = 'views/admin/login.jsp';  // Default view

    $scope.navigate = function(view) {
        $scope.currentView = view;
    };

	$scope.logout = function () {
	      $http.post(AppConfig.apiUrl + "/users/logout").then(function () {
	          sessionStorage.removeItem("loggedUser");
	          $window.location.href = AppConfig.baseUrl + "/login";
	      }, function () {
	          alert("Logout failed. Try again.");
	      });
	  };
		
});

// ✅ Login Controller
chequeApp.controller('LoginController', function($scope, $http,$window, AppConfig) {
    $scope.username = '';
    $scope.password = '';
    $scope.error = '';

	$scope.login = function () {
	    $http({
	        method: 'POST',
	        url: AppConfig.apiUrl + '/users/login',  // ✅ Correct endpoint
	        data: {
	            username: $scope.username,
	            password: $scope.password
	        },			headers: {
			       'Content-Type': 'application/json'
			   }
	    }).then(function (response) {
	        if (response.data && response.data.userId) {
	            sessionStorage.setItem('loggedUser', JSON.stringify(response.data));
	            $window.location.href = AppConfig.baseUrl + '/adminDashboard';
	        } else {
	            $scope.error = "Invalid username or password.";
	        }
	    }, function () {
	        $scope.error = "Server error. Try again.";
	    });
	};
	
	
	
	
});



/*chequeApp.controller('DashboardController', function ($scope, $window) {
    $scope.logout = function () {
        sessionStorage.removeItem("loggedUser");
        $window.location.href = "/ChequePrintingWebApp/login";
    };
});   
*/
/*//var chequeApp = angular.module('chequeApp', ['ngRoute']);
chequeApp.config(function($routeProvider) {
    $routeProvider
        .when('/users', {
            templateUrl: 'views/user-list.jsp',
            controller: 'UserController'
        })
        // Add other routes here if needed
        .otherwise({
            redirectTo: '/users'
        });
});

*/

//Loads User list 
chequeApp.controller('UserController', function($scope, $http, $window,AppConfig) {
    $scope.users = [];

    $scope.loadUsers = function() {
        $http.get(AppConfig.apiUrl + "/users").then(function(response) {
            $scope.users = response.data;
        }, function() {
            $scope.error = "Failed to fetch users.";
        });
    };

	
	$scope.toggleUserActive = function(user) {
	    $http.put(AppConfig.apiUrl + "/users/update-active/" + user.userId)
	        .then(() => console.log('Active status updated'))
	        .catch(err => console.error('Error updating active', err));
	};

	$scope.toggleUserDeleted = function(user) {
	    $http.put(AppConfig.apiUrl + "/users/update-delete/" + user.userId)
	        .then(() => console.log('Delete flag updated'))
	        .catch(err => console.error('Error updating delete flag', err));
	};
	
	
	
	
	//Deactivate 
	$scope.deactivateUser = function(id) {
	       if (confirm("Are you sure you want to deactivate this user?")) {
	           $http.delete(AppConfig.apiUrl + "/users/" + id)
	           .then(function(response) {
	               alert(response.data);
	             $window.location.href = AppConfig.baseUrl + "/users/list"; // reload list after deletion
	           }, function() {
	               alert("Failed to deactivate user.");
	           });
	       }
	   };
    $scope.loadUsers();  // Called when user-list.jsp loads
});



//Add User 
/*chequeApp.controller('AddUserController', function($scope, $http, $window,AppConfig) {
    $scope.user = {
        username: '',
        password: '',
        role: '',
        active: true
    };

    $scope.successMessage = '';
    $scope.errorMessage = '';

    $scope.addUser = function(event) {
		event.preventDefault();
		if ($scope.adduserForm.$valid) {
        $http.post(AppConfig.apiUrl + "/users/register", $scope.user)
            .then(function(response) {
				alert("User added successfully!");
				               $location.path('/users'); 
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
                $scope.user = {};  // Clear form
			$window.location.href = AppConfig.baseUrl + "/users/list";
	    }, function(error) {
                $scope.successMessage = '';
                $scope.errorMessage = "Failed to register user."+ error;
            });
		}
    };
});

*/

chequeApp.controller('AddUserController', function($scope, $http, $window, AppConfig) {
    $scope.user = {
        username: '',
        password: '',
        roleId: '',   // use roleId instead of role name
        active: true
    };

    $scope.roles = [];
    $scope.successMessage = '';
    $scope.errorMessage = '';

    // Load available roles
    $scope.loadRoles = function() {
        $http.get(AppConfig.apiUrl + "/users/roles").then(function(response) {
            $scope.roles = response.data;
        }, function() {
            $scope.errorMessage = "Failed to load roles.";
        });
    };

    $scope.addUser = function(event) {
        event.preventDefault();
      
		if (!$scope.adduserForm) {
		     console.error("Form not found on scope.");
		     return;
		 }

		 // Touch all fields (to show validation errors)
		 if ($scope.adduserForm.$error && $scope.adduserForm.$error.required) {
		     angular.forEach($scope.adduserForm.$error.required, function(field) {
		         if (field && typeof field.$setTouched === 'function') {
		             field.$setTouched();
		         }
		     });
		 }

		 if ($scope.adduserForm.$invalid) {
		     return; // Don't submit
		 }
		
            $http.post(AppConfig.apiUrl + "/users/register", $scope.user)
                .then(function(response) {
                    $scope.successMessage = response.data;
                    $window.location.href = AppConfig.baseUrl + "/users/list";
                }, function(error) {
                    $scope.errorMessage = "Failed to register user. " + error.data;
                });
        
    };

    $scope.loadRoles($scope.loadUser);// Load roles when form loads
});



//Edit User data 
/*chequeApp.controller('EditUserController', function($scope, $http, $window,AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const userId = queryParams.get('id');

    $scope.user = {};
    $scope.successMessage = '';
    $scope.errorMessage = '';

    if (!userId) {
        $scope.errorMessage = "Invalid or missing user ID.";
        return;
    }

    // Load user data by ID
    $http.get(AppConfig.apiUrl + "/users/" + userId).then(function(response) {
        $scope.user = response.data;
    }, function() {
        $scope.errorMessage = "Failed to load user.";
    });

    // Update user
    $scope.updateUser = function(event) {
		event.preventDefault();
		if ($scope.edituserForm.$valid) {
        $http.put(AppConfig.apiUrl + "/users/update/" + userId, $scope.user)
            .then(function(response) {
                $scope.successMessage = response.data;
			$window.location.href = AppConfig.baseUrl + "/users/list";
			    $scope.errorMessage = '';
            }, function() {
                $scope.successMessage = '';
                $scope.errorMessage = "Update failed.";
            });
			}
    };
});


*/

chequeApp.controller('EditUserController', function($scope, $http, $window, AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const userId = queryParams.get('id');
	$scope.user = {};
	   /*  userId: null,
	     username: '',
	     password: '',
	     roleId: '',
	     active: true*/
	 

	 $scope.roles = [];
	 $scope.successMessage = '';
	 $scope.errorMessage = '';
	 
    $scope.loadRoles = function() {
        $http.get(AppConfig.apiUrl + "/users/roles").then(function(response) {
            $scope.roles = response.data;
        }, function() {
            $scope.errorMessage = "Failed to load roles.";
        });
    };

    if (!userId) {
        $scope.errorMessage = "Invalid or missing user ID.";
        return;
    }

    // Load user data
    $http.get(AppConfig.apiUrl + "/users/" + userId).then(function(response) {
        $scope.user = response.data;
    }, function() {
        $scope.errorMessage = "Failed to load user.";
    });

    $scope.updateUser = function(event) {
        event.preventDefault();
 
		/*if (!$scope.edituserForm) {
		           console.error("Form not found.");
		           return;
		       }

		       // Touch all required fields to show validation
		       if ($scope.edituserForm.$error && $scope.edituserForm.$error.required) {
		           angular.forEach($scope.edituserForm.$error.required, function(field) {
		               if (field && typeof field.$setTouched === 'function') {
		                   field.$setTouched();
		               }
		           });
		       }

		       // Stop submission if form invalid
		       if ($scope.edituserForm.$invalid) {
		           return;
		       }
*/
		
		
		
            $http.put(AppConfig.apiUrl + "/users/update/" + userId, $scope.user)
                .then(function(response) {
                    $scope.successMessage = response.data;
                    $window.location.href = AppConfig.baseUrl + "/users/list";
                }, function() {
                    $scope.errorMessage = "Update failed.";
                });
        
    };

    $scope.loadRoles($scope.loadUser);
	
	 // Load role dropdown on form load
});



// ✅ Other controllers can be similarly structured:
chequeApp.controller('SupplierController', function($scope, $http,$window, AppConfig) {
	$scope.suppliers = [];

	   // Load all suppliers
	   $scope.loadSuppliers = function() {
	       $http.get(AppConfig.apiUrl + "/suppliers")
	       .then(function(response) {
	           $scope.suppliers = response.data;
	       }, function() {
	           alert("Failed to load suppliers.");
	       });
	   };

	   
	   
	   $scope.toggleSupplierActive = function(supplier) {
	       $http.put(AppConfig.apiUrl + "/suppliers/update-active/" + supplier.supplierId)
	           .then(() => console.log('Active status updated'))
	           .catch(err => console.error('Error updating active', err));
	   };

	   $scope.toggleSupplierDeleted = function(supplier) {
	       $http.put(AppConfig.apiUrl + "/suppliers/update-delete/" + supplier.supplierId)
	           .then(() => console.log('Delete flag updated'))
	           .catch(err => console.error('Error updating delete flag', err));
	   };
	   
	   
	   // Deactivate supplier
	   $scope.deactivateSupplier = function(id) {
	       if (confirm("Are you sure you want to deactivate this supplier?")) {
	           $http.delete(AppConfig.apiUrl + "/suppliers/" + id)
	           .then(function(response) {
	               alert(response.data);
	             	$window.location.href = AppConfig.baseUrl + "/suppliers/list";// refresh list
	           }, function() {
	               alert("Failed to deactivate supplier.");
	           });
	       }
	   };

	   $scope.loadSuppliers();
});



//Add Supplier data
chequeApp.controller('AddSupplierController', function($scope, $http,$window,AppConfig) {
    $scope.supplier = {
		first_name: '',
		last_name: '',
		company_name: '',
		contact_person_name: '',
		email: '',
		mobile_no: '',
	    address_line1: '',
		address_line2: '',
	    address_line3: '',
		city: '',
		 state: '',
		 zip_code: '',
		 country: '',
		 is_active: true
    };

    $scope.successMessage = '';
    $scope.errorMessage = '';

    $scope.addSupplier = function(event) {
		event.preventDefault();
		
		
		if (!$scope.addsupplierForm) {
		    console.error("Form not found on scope.");
		    return;
		}

		// Touch all required fields to trigger validation messages
		if ($scope.addsupplierForm.$error && $scope.addsupplierForm.$error.required) {
		    angular.forEach($scope.addsupplierForm.$error.required, function(field) {
		        if (field && typeof field.$setTouched === 'function') {
		            field.$setTouched();
		        }
		    });
		}

		// Prevent form submission if invalid
		if ($scope.addsupplierForm.$invalid) {
		    return;
		}
		
		
		
        $http.post(AppConfig.apiUrl + "/suppliers/add", $scope.supplier)
            .then(function(response) {
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
				$window.location.href = AppConfig.baseUrl + "/suppliers/list";
				
            }, function(error) {
                $scope.successMessage = '';
                $scope.errorMessage = "Failed to add supplier."+error;
            });
			
			
    };
});



//Edit Supplier
chequeApp.controller('EditSupplierController', function($scope, $http,$window, AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const supplierId = queryParams.get('id');

    $scope.supplier = {};
    $scope.successMessage = '';
    $scope.errorMessage = '';

    if (!supplierId) {
        $scope.errorMessage = "Invalid or missing supplier ID.";
        return;
    }

    // Load supplier data
    $http.get(AppConfig.apiUrl + "/suppliers/" + supplierId).then(function(response) {
        $scope.supplier = response.data;
		console.log("EditSupplierController loaded with ID:", supplierId);
    }, function() {
        $scope.errorMessage = "Failed to load supplier.";
    });

    // Update supplier
    $scope.updateSupplier = function(event) {
		event.preventDefault();
		if ($scope.editsupplierForm.$valid) {
        $http.put(AppConfig.apiUrl + "/suppliers/update/" + supplierId, $scope.supplier)
            .then(function(response) {
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
				$window.location.href = AppConfig.baseUrl + "/suppliers/list";
            }, function() {
                $scope.successMessage = '';
                $scope.errorMessage = "Update failed.";
            });
			}
    };
});


//Bank Controllers 
chequeApp.controller('BankController', function($scope, $http, AppConfig) {
    $scope.banks = [];
    $scope.successMessage = '';
    $scope.errorMessage = '';

	$scope.loadBanks = function() {
	       $http.get(AppConfig.apiUrl + "/banks")
	       .then(function(response) {
	           $scope.banks = response.data;
	       }, function() {
	           alert("Failed to load banks.");
	       });
	   };


	   
	   $scope.toggleActive = function(bank) {
	          $http.put(AppConfig.apiUrl + "/banks/update-active/" + bank.bankId)
	              .then(() => console.log('Active status updated'))
	              .catch(err => console.error('Error updating active', err));
	      };

	      $scope.toggleDelete = function(bank) {
	          $http.put(AppConfig.apiUrl + "/banks/update-delete/" +bank.bankId)
	              .then(() => console.log('Delete flag updated'))
	              .catch(err => console.error('Error updating delete flag', err));
	      };
	      
	   
	   
    $scope.deleteBank = function(bankId) {
        if (confirm("Are you sure you want to delete this bank?")) {
            $http.delete(AppConfig.apiUrl + "/banks/delete/" + bankId).then(function() {
                $scope.loadBanks();
            }, function() {
                $scope.errorMessage = "Failed to delete bank.";
            });
        }
    };

    $scope.loadBanks();
});


//Add Bank Controller
chequeApp.controller('AddBankController', function($scope, $http, $window, AppConfig) {
    $scope.newBank = {
        bankName: '',
        shortForm: '',
        active: true
    };
    $scope.successMessage = '';
    $scope.errorMessage = '';

    $scope.addBank = function(event) {
        event.preventDefault();

			if (!$scope.addBankForm) {
			    console.error("Form not found on scope.");
			    return;
			}

			// Touch all required fields to trigger validation messages
			if ($scope.addBankForm.$error && $scope.addBankForm.$error.required) {
			    angular.forEach($scope.addBankForm.$error.required, function(field) {
			        if (field && typeof field.$setTouched === 'function') {
			            field.$setTouched();
			        }
			    });
			}

			// Prevent form submission if invalid
			if ($scope.addBankForm.$invalid) {
			    return;
			}
			
			
			
        $http.post(AppConfig.apiUrl + "/banks/add", $scope.newBank).then(function(response) {
            $scope.successMessage = "Bank added successfully!";
            $window.location.href = AppConfig.baseUrl + "/banks/list";
        }, function(error) {
            $scope.errorMessage = "Failed to add bank.";
        });
    };
});



//Edit Bank Controller
chequeApp.controller('EditBankController', function($scope, $http,$window, AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const bankId = queryParams.get('id');

    $scope.bank = {};
    $scope.successMessage = '';
    $scope.errorMessage = '';

    if (!bankId) {
        $scope.errorMessage = "Invalid or missing bank ID.";
        return;
    }

    // Load supplier data
    $http.get(AppConfig.apiUrl + "/banks/" + bankId).then(function(response) {
        $scope.bank = response.data;
		console.log("EditBankController loaded with ID:", bankId);
    }, function() {
        $scope.errorMessage = "Failed to load bank.";
    });

    // Update bank
    $scope.updateBank = function(event) {
		event.preventDefault();
	
        $http.put(AppConfig.apiUrl + "/banks/update/" + bankId, $scope.bank)
            .then(function(response) {
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
				$window.location.href = AppConfig.baseUrl + "/banks/list";
            }, function() {
                $scope.successMessage = '';
                $scope.errorMessage = "Update failed.";
            });
			
    };
});









//Loads BankAccount Data

chequeApp.controller('BankAccountController', function($scope, $http,$window, AppConfig) {
	$scope.bankAccounts = [];

	   // Load bank accounts
	   $scope.loadBankAccounts = function() {
	       $http.get(AppConfig.apiUrl + "/bankAccounts")
	       .then(function(response) {
	           $scope.bankAccounts = response.data;
	       }, function() {
	           alert("Failed to load bank accounts.");
	       });
	   };

	   

	   $scope.toggleActive = function(bankAccount) {
	          $http.put(AppConfig.apiUrl + "/bankAccounts/update-active/" + bankAccount.bankaccountId)
	              .then(() => console.log('Active status updated'))
	              .catch(err => console.error('Error updating active', err));
	      };

	      $scope.toggleDelete = function(bankAccount) {
	          $http.put(AppConfig.apiUrl + "/bankAccounts/update-delete/" +bankAccount.bankaccountId)
	              .then(() => console.log('Delete flag updated'))
	              .catch(err => console.error('Error updating delete flag', err));
	      };
	      

	   
	   
	   
	   // Deactivate bank account
	   $scope.deactivateBankAccount = function(id) {
	       if (confirm("Are you sure you want to deactivate this bank account?")) {
	           $http.delete(AppConfig.apiUrl + "/bankAccounts/" + id)
	           .then(function(response) {
	               alert(response.data);
	              	$window.location.href = AppConfig.baseUrl + "/bankAccounts/list"; // refresh list
	           }, function() {
	               alert("Failed to deactivate bank account.");
	           });
	       }
	   };

	   $scope.loadBankAccounts();
});



chequeApp.controller('AddBankAccountController', function($scope, $http,$window, AppConfig) {
    $scope.bankAccount = {
		accountNumber: '',
		       accountHolderName: '',
		       bankId: '',
		       branchName: '',
		       ifscCode: '',
		       active: true,
		       deleteFlag: false
    };

    $scope.successMessage = '';
    $scope.errorMessage = '';

	
	$scope.bankList = [];

	   // Load all banks for dropdown
	   $http.get(AppConfig.apiUrl + "/bankAccounts/banksAll")
	       .then(function(response) {
	           $scope.bankList = response.data;
	       }, function() {
	           $scope.errorMessage = "Failed to load bank list.";
	       });
	
	
    $scope.addBankAccount = function(event) {
		event.preventDefault();
		
		
		if (!$scope.addbankAccountForm) {
					    console.error("Form not found on scope.");
					    return;
					}

					// Touch all required fields to trigger validation messages
					if ($scope.addbankAccountForm.$error && $scope.addbankAccountForm.$error.required) {
					    angular.forEach($scope.addbankAccountForm.$error.required, function(field) {
					        if (field && typeof field.$setTouched === 'function') {
					            field.$setTouched();
					        }
					    });
					}

					// Prevent form submission if invalid
					if ($scope.addbankAccountForm.$invalid) {
					    return;
					}
					
					
		
        $http.post(AppConfig.apiUrl + "/bankAccounts/add", $scope.bankAccount)
            .then(function(response) {
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
			$window.location.href = AppConfig.baseUrl + "/bankAccounts/list";	    
            }, function(error) {
                $scope.successMessage = '';
                $scope.errorMessage = "Failed to add bank account."+error;
            });
			
    };
});


//Edit BankAccount 
chequeApp.controller('EditBankAccountController', function($scope, $http,$window, AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const accountId = queryParams.get('id');

    $scope.bankAccount = {};
    $scope.successMessage = '';
    $scope.errorMessage = '';

    if (!accountId) {
        $scope.errorMessage = "Invalid or missing bank account ID.";
        return;
    }

    // Load bank account data
    $http.get(AppConfig.apiUrl + "/bankAccounts/" + accountId).then(function(response) {
        $scope.bankAccount = response.data;
    }, function() {
        $scope.errorMessage = "Failed to load bank account.";
    });

	
	
	$scope.bankList = [];

		   // Load all banks for dropdown
		   $http.get(AppConfig.apiUrl + "/bankAccounts/banksAll")
		       .then(function(response) {
		           $scope.bankList = response.data;
		       }, function() {
		           $scope.errorMessage = "Failed to load bank list.";
		       });
			   
    // Update bank account
    $scope.updateBankAccount = function(event) {
		event.preventDefault();
	

        $http.put(AppConfig.apiUrl + "/bankAccounts/update/" + accountId, $scope.bankAccount)
            .then(function(response) {
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
				$window.location.href = AppConfig.baseUrl + "/bankAccounts/list";
			         }, function() {
                $scope.successMessage = '';
                $scope.errorMessage = "Update failed.";
            });
			
    };
});

//ChequeBook Controller

chequeApp.controller('ChequeBookController', function($scope, $http, AppConfig) {
	$scope.book = {};
	   $scope.banks = [];
	   $scope.bankAccounts = [];

	   // Load all banks on page load
	   $http.get(AppConfig.apiUrl + "/bankAccounts/banksAll").then(function(response) {
	       $scope.banks = response.data;
	   }, function(error) {
	       console.error("Error loading banks:", error);
	   });
	   
	   
	   // Load accounts for selected bank
	   	 $scope.loadAccountsByBank = function(bankId) {
	   	     $http.get(AppConfig.apiUrl + "/bankAccounts/bank/" + bankId).then(function(response) {
	   	         $scope.bankAccounts = response.data;
	   	     }, function(error) {
	   	         console.error("Failed to load accounts: ", error);
	   	     });
	   	 };

	   // Watch for change in selected bank
	 /*  $scope.$watch('book.bankId', function(newVal) {
	    if (newVal) {
	           $http.get(AppConfig.apiUrl + "/bankAccounts/bank/" + newVal)
	               .then(function(response) {
	                   $scope.bankAccounts = response.data;
	                   $scope.book.bankAccountId = ""; // clear previous selection
	               }, function(error) {
	                   console.error("Failed to load accounts:", error);
	               });
				   }*/
	       /*} else {
	           $scope.bankAccounts = [];
	           $scope.book.bankAccountId = "";
	       }*/
	   
	
		   $scope.chequeBooks = [];

		   	   // Load bank accounts
		   	   $scope.loadchequebooks = function() {
		   	       $http.get(AppConfig.apiUrl + "/chequeBooks")
		   	       .then(function(response) {
		   	           $scope.chequeBooks = response.data;
		   	       }, function() {
		   	           alert("Failed to load bank accounts.");
		   	       });
		   	   };

		    
		    

	   $scope.toggleActive = function(chequebook) {
	          $http.put(AppConfig.apiUrl + "/chequebooks/update-active/" + chequebook.chequeBookId)
	              .then(() => console.log('Active status updated'))
	              .catch(err => console.error('Error updating active', err));
	      };

	      $scope.toggleDelete = function(chequebook) {
	          $http.put(AppConfig.apiUrl + "/chequebooks/update-delete/" +chequebook.chequeBookId)
	              .then(() => console.log('Delete flag updated'))
	              .catch(err => console.error('Error updating delete flag', err));
	      };
	      

	   
	   
	
	   $scope.loadchequebooks();
});



chequeApp.controller('AddChequeBookController', function($scope, $http,AppConfig) {
	$scope.book = {
	    bookName: '',
	    seriesStart: '',
	    seriesEnd: '',
	    issueDate: '',
	    status: '',
	    bankId: null,
		totalCheques:'',
	    bankAccountId: null
	};

	   $scope.banks = [];
	   $scope.bankAccounts = [];

	   // Load Banks
	   $http.get(AppConfig.apiUrl + "/bankAccounts/banksAll").then(function(response) {
	       $scope.banks = response.data;
	   }, function(error) {
	       //console.error("Error loading banks", error);
	   });

	   // Load Bank Accounts based on selected Bank
	   $scope.loadAccountsByBank = function(bankId) {
	       if (!bankId) {
	           $scope.bankAccounts = [];
	           return;
	       }

	       $http.get(AppConfig.apiUrl + "/bankAccounts/bank/" + bankId).then(function(response) {
	           $scope.bankAccounts = response.data;
			   console.log("Loaded accounts:", $scope.bankAccounts);
			   console.log("Account ID:", $scope.bankAccounts.bankaccountId);
	       }, function(error) {
	           console.error("Error loading accounts for bankId: " + bankId, error);
	       });
	   };

	   // Submit Cheque Book
	   $scope.addChequeBook = function(event) {
		event.preventDefault();
		console.log("Book to submit:", $scope.book);
		console.log("Account _id:",$scope.book.bankAccountId);

	       $http.post(AppConfig.apiUrl + "/chequeBooks/add", $scope.book)
	           .then(function(response) {
			
	               alert("Cheque Book Added Successfully"+response);
	               $scope.book = {};
	               $scope.bankAccounts = [];
	           }, function(error) {
	               alert("Failed to add Cheque Book");
	               console.error(error);
	           });
	   };
});


//Edit BankAccount 
chequeApp.controller('EditChequeBookController', function($scope, $http,$window, AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const accountId = queryParams.get('id');

    $scope.bankAccount = {};
    $scope.successMessage = '';
    $scope.errorMessage = '';

    if (!accountId) {
        $scope.errorMessage = "Invalid or missing bank account ID.";
        return;
    }

    // Load bank account data
    $http.get(AppConfig.apiUrl + "/bankAccounts/" + accountId).then(function(response) {
        $scope.bankAccount = response.data;
    }, function() {
        $scope.errorMessage = "Failed to load bank account.";
    });

	
	
	$scope.bankList = [];

		   // Load all banks for dropdown
		   $http.get(AppConfig.apiUrl + "/bankAccounts/banksAll")
		       .then(function(response) {
		           $scope.bankList = response.data;
		       }, function() {
		           $scope.errorMessage = "Failed to load bank list.";
		       });
			   
    // Update bank account
    $scope.updateBankAccount = function(event) {
		event.preventDefault();
	

        $http.put(AppConfig.apiUrl + "/bankAccounts/update/" + accountId, $scope.bankAccount)
            .then(function(response) {
                $scope.successMessage = response.data;
                $scope.errorMessage = '';
				$window.location.href = AppConfig.baseUrl + "/bankAccounts/list";
			         }, function() {
                $scope.successMessage = '';
                $scope.errorMessage = "Update failed.";
            });
			
    };
});




chequeApp.controller("ListChequeController", function($scope, $http,AppConfig,$window) {
    $scope.cheques = [];

    $http.get(AppConfig.apiUrl +"/cheques/getAll").then(function(response) {
        $scope.cheques = response.data;
    });

   
});


chequeApp.controller('LayoutController', function ($scope, $http,AppConfig) {
    $scope.layout = {
		layoutName: '',
		      bankId: '',
		     // accountId: '',
		      fields: [],
		      createdBy: 'admin'
    };

	
	
	$scope.banks = [];
	   //$scope.accounts = [];

	   // Load all banks
	   $http.get(AppConfig.apiUrl + "/bankAccounts/banksAll").then(function (response) {
	       $scope.banks = response.data;
	   });

/*	   // Load accounts by selected bank
	   $scope.loadAccounts = function (bankId) {
	       $http.get(AppConfig.apiUrl + "/bankAccounts/bank/"  + bankId).then(function (response) {
	           $scope.accounts = response.data;
	       });
	   };*/

	   $scope.addField = function () {
	        const label = prompt("Enter field label (e.g., Payee Name):");
	        if (label) {
	            const newField = {
	                label: label,
	                style: {
	                    top: '50px',
	                    left: '100px',
	                    width: '150px',
	                    height: '30px'
	                }
	            };
	            $scope.layout.fields.push(newField);
	           // setTimeout(makeFieldsDraggable, 100);
	        }
	    };

		   
		   
		// Save layout to server
		    $scope.saveLayout = function () {
		        const layoutData = {
		            layoutName: $scope.layout.layoutName,
		            bankId: $scope.layout.bankId,
		            //accountId: $scope.accounts.accountId,
		            layoutJson: JSON.stringify($scope.layout.fields),
		            createdBy: $scope.layout.createdBy
		        };

		        $http.post(AppConfig.apiUrl + "/layout/save", layoutData).then(function () {
		            alert("Layout saved successfully!");
		        }, function (error) {
		            console.error("Error saving layout:", error);
		        });
		    };

		  /*  // Enable draggable and resizable fields
		    function makeFieldsDraggable() {
		        $('.field').draggable({
		            containment: "#layoutArea",
		            stop: function (event, ui) {
						const scope = angular.element(this).scope();
		                const index = $(this).attr('id').split('-')[1];
		                $scope.layout.fields[index].style.top = ui.position.top + 'px';
		                $scope.layout.fields[index].style.left = ui.position.left + 'px';
		                $scope.$apply();
		            }
		        }).resizable({
		            containment: "#layoutArea",
		            stop: function (event, ui) {
		                const index = $(this).attr('id').split('-')[1];
		                $scope.layout.fields[index].style.width = ui.size.width + 'px';
		                $scope.layout.fields[index].style.height = ui.size.height + 'px';
		                $scope.$apply();
		            }
		        });
		    }*/
});

chequeApp.directive('draggableResizable', function () {
    return {
        restrict: 'A',
        link: function (scope, element) {
            element.css({
                position: 'absolute',
                resize: 'both',
                overflow: 'auto',
                cursor: 'move'
            });

            element.on('mousedown', function (e) {
                if (e.target.classList.contains('resize-handle')) return;
                e.preventDefault();

                const startX = e.clientX;
                const startY = e.clientY;
                const origX = element[0].offsetLeft;
                const origY = element[0].offsetTop;

                function onMouseMove(e) {
                    element.css({
                        left: (origX + e.clientX - startX) + 'px',
                        top: (origY + e.clientY - startY) + 'px'
                    });
                }

                function onMouseUp() {
                    document.removeEventListener('mousemove', onMouseMove);
                    document.removeEventListener('mouseup', onMouseUp);

                    const index = element.attr('id').split('-')[1];
                    scope.$apply(() => {
                        scope.layout.fields[index].style.top = element.css('top');
                        scope.layout.fields[index].style.left = element.css('left');
                    });
                }

                document.addEventListener('mousemove', onMouseMove);
                document.addEventListener('mouseup', onMouseUp);
            });

            element.on('mouseup', function () {
                const index = element.attr('id').split('-')[1];
                scope.$apply(() => {
                    scope.layout.fields[index].style.width = element[0].offsetWidth + 'px';
                    scope.layout.fields[index].style.height = element[0].offsetHeight + 'px';
                });
            });
        }
    };
});





//View Layout data
chequeApp.controller('ViewLayoutController', function ($scope, $http,AppConfig) {
       $scope.layouts = [];

       $scope.loadLayouts = function () {
           $http.get(AppConfig.apiUrl + "/layout/all")
               .then(function (response) {
                   $scope.layouts = response.data;
               }, function (error) {
                   console.error("Error loading layouts", error);
               });
       };

       $scope.deleteLayout = function (layoutId) {
           if (confirm("Are you sure you want to delete this layout?")) {
               $http.delete('/ChequePrintingWebApp/api/layout/delete/' + layoutId)
                   .then(function () {
                       alert("Layout deleted successfully");
                       $scope.loadLayouts(); // Refresh list
                   }, function (error) {
                       alert("Error deleting layout");
                       console.error(error);
                   });
           }
       };

       $scope.loadLayouts();
   });
   
   
   
   
   chequeApp.controller('PreviewLayoutController', function ($scope, $http,AppConfig) {
	const urlParams = new URLSearchParams(window.location.search);
	   const layoutId = urlParams.get('id');

	   $scope.layout = {
	       layoutName: '',
	       bankName: '',
	       accountId: '',
	       fields: []
	   };
	   
	   
	   
         $http.get(AppConfig.apiUrl + "/layout/getById/" + layoutId)
	           .then(function (response) {
	               $scope.layout = response.data;

	               // Parse JSON string to object if needed
	               if (typeof $scope.layout.layoutJson === 'string') {
	                   $scope.layout.fields = JSON.parse($scope.layout.layoutJson);
	               } else {
	                   $scope.layout.fields = $scope.layout.layoutJson;
	               }
	           }, function (error) {
	               console.error("Error fetching layout:", error);
	               alert("Could not load layout");
	           });
	   });
	   
	   
	   
	   
	   
	//Issue Cheques
	chequeApp.controller('IssueChequeController', function($scope, $http,AppConfig) {

	    $scope.cheque = {};
	    $scope.banks = [];
	    $scope.chequeBooks = [];
	    $scope.suppliers = [];

	    // Load Banks
	    $http.get(AppConfig.apiUrl + "/banks/banksAll").then(function(response) {
	        $scope.banks = response.data;
	    });

	    // Load Suppliers
	    $http.get(AppConfig.apiUrl + "/suppliers/suppliersAll").then(function(response) {
	        $scope.suppliers = response.data;
	    });

	    // Load Cheque Books when Bank selected
	    $scope.fetchChequeBooks = function () {
	        if (!$scope.selectedBankId) return;
	        $http.get(AppConfig.apiUrl + "/chequebooks/bybank/" + $scope.selectedBankId).then(function(response) {
	            $scope.chequeBooks = response.data;
	        });
	    };

	    // Convert amount to words
	    $scope.convertToWords = function () {
	        var num = $scope.cheque.amountNumeric;
	        if (num == null || isNaN(num)) {
	            $scope.cheque.amountWords = "";
	            return;
	        }
	        $scope.cheque.amountWords = convertNumberToWords(num);
	    };

	    // Number to Words Utility
	    function convertNumberToWords(amount) {
	        const a = [
	            '', 'One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine',
	            'Ten', 'Eleven', 'Twelve', 'Thirteen', 'Fourteen', 'Fifteen',
	            'Sixteen', 'Seventeen', 'Eighteen', 'Nineteen'
	        ];
	        const b = ['', '', 'Twenty', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety'];

	        if ((amount = amount.toString()).length > 9) return 'Overflow';
	        let n = ('000000000' + amount).substr(-9).match(/.{1,2}/g);
	        if (!n) return;

	        let str = '';
	        str += (n[0] != 0) ? (a[Number(n[0])] || b[n[0][0]] + ' ' + a[n[0][1]]) + ' Crore ' : '';
	        str += (n[1] != 0) ? (a[Number(n[1])] || b[n[1][0]] + ' ' + a[n[1][1]]) + ' Lakh ' : '';
	        str += (n[2] != 0) ? (a[Number(n[2])] || b[n[2][0]] + ' ' + a[n[2][1]]) + ' Thousand ' : '';
	        str += (n[3] != 0) ? (a[Number(n[3])] || b[n[3][0]] + ' ' + a[n[3][1]]) + ' Hundred ' : '';
	        str += (n[4] != 0) ? ((str != '') ? 'and ' : '') +
	            (a[Number(n[4])] || b[n[4][0]] + ' ' + a[n[4][1]]) + ' Rupees ' : '';

	        return str + 'Only';
	    }

	    // Submit form
	    $scope.issueCheque = function () {
	        $http.post(AppConfig.apiUrl + "/cheques/issue", $scope.cheque)
	            .then(function (response) {
	                alert('Cheque Issued Successfully'+ response);
	                $scope.cheque = {};
	            }, function (error) {
	                alert('Error issuing cheque');
	                console.error(error);
	            });
	    };

	});
	
	
	
	
	
	
	
	
	/*app.controller('LayoutController', function ($scope, $http,AppConfig) {
       $scope.layout = {
           bank: '',
           name: 'Default Layout',
           bgImage: '',
           fields: []
       };

       $scope.uploadImage = function (files) {
           const reader = new FileReader();
           reader.onload = function (e) {
               $scope.$apply(() => {
                   $scope.layout.bgImage = e.target.result;
               });
           };
           reader.readAsDataURL(files[0]);
       };

       $scope.addField = function () {
           const label = prompt("Enter field label (e.g., Payee Name):");
           if (label) {
               const newField = {
                   label: label,
                   style: {
                       top: '10%',
                       left: '10%',
                       width: '20%',
                       height: 'auto'
                   }
               };
               $scope.layout.fields.push(newField);
               $scope.$applyAsync(() => makeFieldsDraggable());
           }
       };

       $scope.saveLayout = function () {
           $http.post(AppConfig.apiUrl +"/layouts/save", $scope.layout).then(function () {
               alert("Layout saved successfully!");
           }, function (error) {
               console.error("Error saving layout", error);
           });
       };

       function makeFieldsDraggable() {
           $('.field').draggable({
               containment: "#layoutContent",
               stop: function (event, ui) {
                   const index = $(this).attr('id').split('-')[1];
                   const parent = $('#layoutContent');
                   const topPercent = (ui.position.top / parent.height()) * 100;
                   const leftPercent = (ui.position.left / parent.width()) * 100;
                   const scope = angular.element(this).scope();
                   scope.layout.fields[index].style.top = topPercent + '%';
                   scope.layout.fields[index].style.left = leftPercent + '%';
                   scope.$apply();
               }
           }).resizable({
               containment: "#layoutContent",
               stop: function (event, ui) {
                   const index = $(this).attr('id').split('-')[1];
                   const parent = $('#layoutContent');
                   const widthPercent = (ui.size.width / parent.width()) * 100;
                   const heightPercent = (ui.size.height / parent.height()) * 100;
                   const scope = angular.element(this).scope();
                   scope.layout.fields[index].style.width = widthPercent + '%';
                   scope.layout.fields[index].style.height = heightPercent + '%';
                   scope.$apply();
               }
           });
       }

       setTimeout(makeFieldsDraggable, 500);
   });

*/


/*chequeApp.controller('ChequeBookController', function($scope, $http,AppConfig) {
    
    $scope.book = {};            // form model for new cheque book
    $scope.chequeBooks = [];     // list of all cheque books

    // Add new cheque book
    $scope.addChequeBook = function() {
        if (!$scope.book.bank_account_id || !$scope.book.series_start || !$scope.book.series_end || !$scope.book.issue_date) {
            alert("Please fill all required fields.");
            return;
        }

        $http.post(AppConfig.apiUrl + "/chequebooks/add", $scope.book)
            .then(function(response) {
                alert("Cheque Book added successfully!");
                $scope.book = {};           // clear form
                $scope.loadChequeBooks();   // reload list
            }, function(error) {
                console.error(error);
                alert("Failed to add cheque book.");
            });
    };

    // Load all cheque books
    $scope.loadChequeBooks = function() {
        $http.get(AppConfig.apiUrl +"/chequebooks/list")
            .then(function(response) {
                $scope.chequeBooks = response.data;
            }, function(error) {
                console.error(error);
            });
    };

    // Load data on controller init
    $scope.loadChequeBooks();
});

*/
//Load signatories
/*chequeApp.controller('SignatoryController', function ($scope, $http, $window, AppConfig) {
    $scope.signatories = [];

    // Load all signatories
    $scope.loadSignatories = function () {
        $http.get(AppConfig.apiUrl + "/signatories")
            .then(function (response) {
                $scope.signatories = response.data;
            }, function () {
                alert("Failed to load signatories.");
            });
    };

    // Deactivate (soft delete) a signatory
    $scope.deactivateSignatory = function (id) {
        if (confirm("Are you sure you want to deactivate this signatory?")) {
            $http.delete(AppConfig.apiUrl + "/signatories/delete/" + id)
                .then(function (response) {
                    alert(response.data);
                    $window.location.href = AppConfig.baseUrl + "/signatories/list"; // redirect to list
                }, function () {
                    alert("Failed to deactivate signatory.");
                });
        }
    };

    $scope.loadSignatories();
});


//Add signs
chequeApp.controller('AddSignatoryController', function($scope, $http, $window, AppConfig) {
    $scope.signatory = {
        name: '',
        designation: '',
        active: true
    };

    $scope.successMessage = '';
    $scope.errorMessage = '';

    $scope.addSignatory = function(event) {
        event.preventDefault();
        if ($scope.addSignatoryForm.$valid) {
            $http.post(AppConfig.apiUrl + "/signatories/add", $scope.signatory)
                .then(function(response) {
                    $scope.successMessage = response.data;
                    $scope.errorMessage = '';
                    $window.location.href = AppConfig.baseUrl + "/signatories/list";
                }, function(error) {
                    $scope.successMessage = '';
                    $scope.errorMessage = "Failed to add signatory. " + error.statusText;
                });
        }
    };
});


//Edit
chequeApp.controller('EditSignatoryController', function($scope, $http, $window, AppConfig) {
    const queryParams = new URLSearchParams(window.location.search);
    const signatoryId = queryParams.get('id');

    $scope.signatory = {};
    $scope.successMessage = '';
    $scope.errorMessage = '';

    if (!signatoryId) {
        $scope.errorMessage = "Invalid or missing signatory ID.";
        return;
    }

    // Load signatory data
    $http.get(AppConfig.apiUrl + "/signatories/" + signatoryId).then(function(response) {
        $scope.signatory = response.data;
    }, function() {
        $scope.errorMessage = "Failed to load signatory.";
    });

    // Update signatory
    $scope.updateSignatory = function(event) {
        event.preventDefault();
        if ($scope.editSignatoryForm.$valid) {
            $http.put(AppConfig.apiUrl + "/signatories/update/" + signatoryId, $scope.signatory)
                .then(function(response) {
                    $scope.successMessage = response.data;
                    $scope.errorMessage = '';
                    $window.location.href = AppConfig.baseUrl + "/signatories/list";
                }, function() {
                    $scope.successMessage = '';
                    $scope.errorMessage = "Update failed.";
                });
        }
    };
});




chequeApp.controller('ChequeController', function($scope, $http, AppConfig) {
    $http.get(AppConfig.apiUrl + "/cheques").then(function(response) {
        $scope.cheques = response.data;
    });
});









chequeApp.controller("AddChequeController", function ($scope, $http,AppConfig) {
           $scope.cheque = {};
           $scope.successMessage = '';
           $scope.errorMessage = '';

           // Load suppliers
           $http.get( AppConfig.apiUrl +"/cheques/suppliers").then(function (response) {
               $scope.suppliers = response.data;
           });

           // Load signatories
           $http.get( AppConfig.apiUrl +"/cheques/signatories").then(function (response) {
               $scope.signatories = response.data;
           });

           // Set Payee Name from selected supplier
           $scope.setPayeeName = function () {
               var selected = $scope.suppliers.find(s => s.supplierId === $scope.cheque.supplierId);
               if (selected) {
                   $scope.cheque.payeeName = selected.supplierName;
               }
           };

           // Submit Cheque
           $scope.addCheque = function () {
               // Collect selected signatory IDs
               $scope.cheque.signatoryIds = $scope.signatories
                   .filter(s => s.selected)
                   .map(s => s.signatoryId);

               $http.post( AppConfig.apiUrl +"/cheques/add", $scope.cheque)
                   .then(function (response) {
                       $scope.successMessage = response.data;
                       $scope.errorMessage = '';
                       $scope.cheque = {}; // Reset form
                       $scope.signatories.forEach(s => s.selected = false);
                   }, function (error) {
                       $scope.errorMessage = "Failed to save cheque.";
                       $scope.successMessage = '';
                   });
           };
       });


chequeApp.controller("EditChequeController", function ($scope, $http,AppConfig) {
	              $scope.cheque = {};
	              $scope.signatories = [];
	              $scope.suppliers = [];
	              $scope.successMessage = '';
	              $scope.errorMessage = '';

	              const queryParams = new URLSearchParams(window.location.search);
	              const chequeId = queryParams.get('id');

	              // Load suppliers
	              $http.get(AppConfig.apiUrl +"/cheques/suppliers").then(function (response) {
	                  $scope.suppliers = response.data;
	              });

	              // Load signatories
	              $http.get(AppConfig.apiUrl+ "/cheques/signatories").then(function (response) {
	                  $scope.signatories = response.data;
	              });

	              // Load existing cheque
	              $http.get(AppConfig.apiUrl +"/cheques/" + chequeId).then(function (response) {
	                  $scope.cheque = response.data;

	                  // Pre-select signatories
	                  if ($scope.cheque.signatoryIds) {
	                      $scope.cheque.signatoryIds.forEach(function (id) {
	                          let signatory = $scope.signatories.find(s => s.signatoryId === id);
	                          if (signatory) {
	                              signatory.selected = true;
	                          }
	                      });
	                  }
	              });

	              // Set payee name from supplier
	              $scope.setPayeeName = function () {
	                  let selected = $scope.suppliers.find(s => s.supplierId === $scope.cheque.supplierId);
	                  if (selected) {
	                      $scope.cheque.payeeName = selected.supplierName;
	                  }
	              };

	              // Update cheque
	              $scope.updateCheque = function () {
	                  $scope.cheque.signatoryIds = $scope.signatories
	                      .filter(s => s.selected)
	                      .map(s => s.signatoryId);

	                  $http.put(AppConfig.apiUrl +"/cheques/update", $scope.cheque)
	                      .then(function (response) {
	                          $scope.successMessage = response.data;
	                          $scope.errorMessage = '';
	                      }, function () {
	                          $scope.errorMessage = "Failed to update cheque.";
	                          $scope.successMessage = '';
	                      });
	              };
	          });
			  
			  
			  
chequeApp.controller("PrintChequeController", function($scope, $http,AppConfig) {
    const urlParams = new URLSearchParams(window.location.search);
    const chequeId = urlParams.get('id');

    $scope.cheque = {};

    $http.get(AppConfig.apiUrl +"/cheques/print/" + chequeId).then(function(response) {
        $scope.cheque = response.data;
    });

    $scope.print = function() {
        window.print();
    };
});
*/