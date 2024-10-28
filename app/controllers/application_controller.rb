class ApplicationController < ActionController::Base
  # Redirige l'utilisateur vers la page des flats après connexion
  def after_sign_in_path_for(resource)
    flats_path
  end

  # Redirige l'utilisateur vers la page d'accueil après déconnexion
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
