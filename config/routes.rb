Rails.application.routes.draw do
  
  get("/", { :controller => "countries", :action => "home" })


  # Routes for the Must see sight resource:

  # CREATE
  post("/insert_must_see_sight", { :controller => "must_see_sights", :action => "create" })
          
  # READ
  
  get("/must_see_sights/:path_id", { :controller => "must_see_sights", :action => "show" })
  
  # UPDATE
  
  post("/modify_must_see_sight/:path_id", { :controller => "must_see_sights", :action => "update" })
  
  # DELETE
  get("/delete_must_see_sight/:path_id", { :controller => "must_see_sights", :action => "destroy" })

  #------------------------------

  # Routes for the Bookmark resource:

  # CREATE
  post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  
  post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the City resource:

  # CREATE
  post("/insert_city", { :controller => "cities", :action => "create" })
          
  # READ
  get("/cities", { :controller => "cities", :action => "index" })
  
  get("/cities/:path_id", { :controller => "cities", :action => "show" })
  
  # UPDATE
  
  post("/modify_city/:path_id", { :controller => "cities", :action => "update" })
  
  # DELETE
  get("/delete_city/:path_id", { :controller => "cities", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Country resource:

  # CREATE
  post("/insert_country", { :controller => "countries", :action => "create" })
          
  # READ
  get("/countries", { :controller => "countries", :action => "index" })
  
  get("/countries/:path_id", { :controller => "countries", :action => "show" })
  
  # UPDATE
  
  post("/modify_country/:path_id", { :controller => "countries", :action => "update" })
  
  # DELETE
  get("/delete_country/:path_id", { :controller => "countries", :action => "destroy" })

  #------------------------------

end
