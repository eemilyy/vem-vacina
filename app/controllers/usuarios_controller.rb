class UsuariosController < ApplicationController

    def new
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.new(usuario_params)

        if @usuario.save
            flash[:success] = "Cadastrado com Sucesso"
            redirect_to new_usuario_path
        else
            render 'new'
        end
    end

    private
        def usuario_params
            params.require(:usuario).permit(:nome_completo, :data_nascimento, :nome_mae, :cpf, :telefone, :email, :password, :password_confirmation)
        end
end
