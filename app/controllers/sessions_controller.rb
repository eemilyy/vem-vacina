class SessionsController < ApplicationController
  
  def new
    redirect_to usuario_path(current_usuario) if usuario_signed_in?
  end

  def create
    usuario = Usuario.find_by(cpf: params[:session][:cpf])
    if usuario && usuario.authenticate(params[:session][:password])
      sign_in(usuario)
      redirect_to vacinas_path(usuario)
    else
      flash.now[:danger] = "CPF ou senha inválidos"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path 
  end
end
